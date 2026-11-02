#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
🔐 License Manager – Kiểm Tra & Kích Hoạt License Key
Tích hợp vào Skill Soạn Slide & Video Khởi Động (tao-slide-va-video-khoi-dong)

Cách dùng (giáo viên):
  python scripts/license_manager.py --machine-id     → Lấy Machine ID để gửi tác giả
  python scripts/license_manager.py --activate <KEY> → Kích hoạt license
  python scripts/license_manager.py --check          → Kiểm tra trạng thái license
"""

import sys, os, json, base64, hashlib, socket, platform, uuid
from datetime import datetime, timezone
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding='utf-8')
except Exception:
    pass

try:
    from cryptography.hazmat.primitives.asymmetric import padding
    from cryptography.hazmat.primitives import hashes, serialization
    from cryptography.hazmat.backends import default_backend
    HAS_CRYPTO = True
except ImportError:
    try:
        import subprocess
        subprocess.run([sys.executable, "-m", "pip", "install", "cryptography", "-q"], check=True)
        from cryptography.hazmat.primitives.asymmetric import padding
        from cryptography.hazmat.primitives import hashes, serialization
        from cryptography.hazmat.backends import default_backend
        HAS_CRYPTO = True
    except Exception:
        HAS_CRYPTO = False

# ─── CẤU HÌNH ────────────────────────────────────────────────────────────────
SKILL_DIR    = Path(__file__).resolve().parent.parent
SKILL_NAME   = "tao-slide-va-video-khoi-dong"

FEATURE_CATALOG = {
    "slide_bai_giang": {
        "index": "1",
        "name": "Soạn slide bài giảng 3 bước chuẩn GDPT 2018",
        "short": "Slide bài giảng chuẩn mực",
        "desc": "Soạn slide từ giáo án/SGK, lọc sạch mục tiêu rườm rà, đi thẳng tiến trình 3 bước"
    },
    "so_do_tu_duy": {
        "index": "2",
        "name": "Sơ đồ tư duy Infographic Radial tỏa tròn",
        "short": "Sơ đồ tư duy tỏa tròn",
        "desc": "Mô hình tư duy tâm điểm tỏa tròn 360°, màu sắc phân nhánh đối xứng, có hiệu ứng bung tỏa"
    },
    "bai_tap_tuong_tac": {
        "index": "3",
        "name": "Slide bài tập điền từ & Trò chơi tương tác",
        "short": "Bài tập tương tác / Điền từ",
        "desc": "Slide bài tập khuyết từ chia cột, click đáp án nhảy lên đúng vị trí"
    },
    "cong_thuc_omml": {
        "index": "4",
        "name": "Công thức Toán học Native OMML chuẩn SGK",
        "short": "Công thức OMML (Toán/Lí/Hóa)",
        "desc": "Công thức vector sắc nét, click đúp chuột sửa trực tiếp 100% trong PowerPoint không cần MathType"
    },
    "tim_anh_web": {
        "index": "5",
        "name": "Tự động tìm kiếm ảnh thực tế khoa học từ Web",
        "short": "Tìm ảnh thực tế bản quyền mở",
        "desc": "Tự động tìm kiếm và chèn ảnh minh họa thực tế, hiển vi khoa học chất lượng cao"
    },
    "video_bai_giang": {
        "index": "6",
        "name": "Hỗ trợ xuất PPTX lồng tiếng & Dựng video bài giảng",
        "short": "Hỗ trợ video bài giảng",
        "desc": "Tự động đồng bộ animation tự chạy, hỗ trợ lồng tiếng xuất video MP4"
    },
    "interactive_video": {
        "index": "7",
        "name": "Tạo Video Tương Tác E-Learning chống tua nhanh",
        "short": "Video tương tác E-Learning",
        "desc": "Video nhúng 10 dạng câu hỏi tương tác chuẩn GDPT 2018, chống tua, ghi điểm Google Sheets"
    }
}

PUBLIC_KEY_PEM = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsykVJf8gHugg+wgotDfK
zUlDcpW09tl/medCzkzfI/1l19nwEqbiJoNBgbroCtu2fU38Jw+saRMusXbMys3a
aCPrHKkg0ui/59jTQx82T5a3VX+fPLe+aiMwe13b/oLGur/pPU6dqr2eoYeNUt3T
9hw+jl2XHYdDgytPeRmGUE8fN/q0VQLaCuKZcXgxugc9JnGZrkZyvoiz2cmNp2mt
Sq+mLFWvPxhbx9gTlHxX7AZCIRjTSJeq9bOL7sHiuSNClRXHAQiYUppoWiumPOV7
fjegRJweRxtBVRmC/zxxL+xz6/Hgazwivog1pRE6tr4gE0xyqjGFgyOca+dW+33H
EQIDAQAB
-----END PUBLIC KEY-----"""

REVOCATION_URL = "https://raw.githubusercontent.com/nguyenvanthien1812-ops/skill-tao-de-tuong-tu/main/revoked.json"

def get_unlocked_features(payload: dict) -> list[str]:
    if not payload:
        return []
    feats = payload.get("features")
    if not feats:
        return ["ALL"]
    if isinstance(feats, str):
        feats = [f.strip() for f in feats.split(",") if f.strip()]
    if "ALL" in feats or "*" in feats:
        return ["ALL"]
    return list(feats)

def has_feature_permission(payload: dict, required_feature: str | list[str] | None = None) -> bool:
    if not payload:
        return False
    if not required_feature:
        return True
    unlocked = get_unlocked_features(payload)
    if "ALL" in unlocked:
        return True
    if isinstance(required_feature, str):
        return required_feature in unlocked
    if isinstance(required_feature, (list, tuple, set)):
        return any(f in unlocked for f in required_feature)
    return False

def format_features_summary(payload: dict) -> str:
    unlocked = get_unlocked_features(payload)
    if "ALL" in unlocked:
        return "🌟 TRỌN BỘ TẤT CẢ TIỆN ÍCH (FULL VIP)"
    names = []
    for code in unlocked:
        info = FEATURE_CATALOG.get(code)
        if info:
            names.append(f"[{info['index']}] {info['name']}")
        else:
            names.append(code)
    return ", ".join(names) if names else "Chưa có tiện ích nào"

def get_all_license_paths(include_cwd: bool = True) -> list[Path]:
    paths = []
    paths.append(SKILL_DIR / "license.key")
    try:
        user_home = Path.home()
        paths.append(user_home / ".gemini" / "config" / "skills" / SKILL_NAME / "license.key")
        paths.append(user_home / ".gemini" / "config" / "skills" / "tao-slide-bai-giang" / "license.key")
        paths.append(user_home / ".gemini" / "config" / "skills" / "tao-de-toan-tuong-tu" / "license.key")
        paths.append(user_home / ".gemini" / "license.key")
    except Exception:
        pass
        
    try:
        parent = SKILL_DIR.parent
        paths.append(parent / "tao-de-toan-tuong-tu" / "license.key")
        paths.append(parent / "soan-giao-an-tich-hop-nls" / "license.key")
        paths.append(parent / "license.key")
        if parent.parent:
            paths.append(parent.parent / "license.key")
    except Exception:
        pass

    try:
        if include_cwd:
            cwd = Path.cwd().resolve()
            paths.append(cwd / "license.key")
            paths.append(cwd / SKILL_NAME / "license.key")
            paths.append(cwd / ".agents" / "skills" / SKILL_NAME / "license.key")
            paths.append(cwd / ".agents" / "skills" / "tao-de-toan-tuong-tu" / "license.key")
    except Exception:
        pass

    unique_paths = []
    seen = set()
    for p in paths:
        try:
            resolved = p.resolve()
            if resolved not in seen:
                seen.add(resolved)
                unique_paths.append(p)
        except Exception:
            if p not in unique_paths:
                unique_paths.append(p)
    return unique_paths

def get_machine_id() -> str:
    parts = []
    mac = uuid.UUID(int=uuid.getnode()).hex[-12:]
    parts.append(mac)
    parts.append(socket.gethostname().lower())
    try:
        import winreg
        key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, r"SOFTWARE\Microsoft\Cryptography")
        guid, _ = winreg.QueryValueEx(key, "MachineGuid")
        parts.append(guid)
    except Exception:
        parts.append(platform.node())
    raw = "|".join(parts)
    return hashlib.sha256(raw.encode()).hexdigest()[:32]

# Danh sách các License ID bị Tác giả thu hồi vĩnh viễn (chặn 100% cả offline lẫn online)
HARDCODED_REVOKED_IDS = {
    "master-author-vip-key",  # Thu hồi key thử nghiệm 2036 bị lọt cho giáo viên
}

def check_revocation(license_id: str) -> bool:
    try:
        import urllib.request, time
        url = REVOCATION_URL + f"?t={int(time.time())}"
        req = urllib.request.Request(url, headers={"User-Agent": "license-checker/2.0"})
        with urllib.request.urlopen(req, timeout=2.5) as resp:
            revoked_list = json.loads(resp.read().decode("utf-8"))
        return license_id in revoked_list
    except Exception:
        return False

def verify_license_key(license_key: str) -> tuple[bool, dict, str]:
    if not HAS_CRYPTO:
        return False, {}, "Cần cài thư viện cryptography: pip install cryptography"

    try:
        parts = license_key.strip().split(".")
        if len(parts) != 2:
            return False, {}, "Định dạng license key không hợp lệ"

        payload_bytes = base64.urlsafe_b64decode(parts[0] + "==")
        signature     = base64.urlsafe_b64decode(parts[1] + "==")
        payload       = json.loads(payload_bytes.decode("utf-8"))

        public_key = serialization.load_pem_public_key(
            PUBLIC_KEY_PEM.strip().encode(), backend=default_backend()
        )
        public_key.verify(
            signature, payload_bytes,
            padding.PSS(mgf=padding.MGF1(hashes.SHA256()), salt_length=padding.PSS.MAX_LENGTH),
            hashes.SHA256()
        )

        target_skill = payload.get("skill", "")
        if target_skill not in {SKILL_NAME, "tao-slide-bai-giang", "ALL", "tao-de-toan-tuong-tu"}:
            return False, payload, "License key không dành cho skill này"

        machine_id = payload.get("machine_id", "ANY")
        if machine_id != "ANY":
            current_mid = get_machine_id()
            if current_mid != machine_id:
                return False, payload, (
                    f"License key này được cấp cho máy khác!\n"
                    f"  Machine ID của máy bạn : {current_mid}\n"
                    f"  Machine ID trong key    : {machine_id}\n"
                    f"  → Liên hệ tác giả để được cấp key mới cho máy này."
                )

        expiry = datetime.strptime(payload["expiry"], "%Y-%m-%d").replace(tzinfo=timezone.utc)
        if datetime.now(timezone.utc) > expiry:
            days_overdue = (datetime.now(timezone.utc) - expiry).days
            return False, payload, f"License key đã hết hạn {days_overdue} ngày ({payload['expiry']})."

        return True, payload, ""
    except Exception as e:
        return False, {}, f"Lỗi xác minh: {e}"

def check_current_license() -> tuple[bool, dict, str]:
    found_key = None
    found_payload = {}
    for p in get_all_license_paths():
        if p.exists():
            try:
                content = p.read_text(encoding="utf-8").strip()
                if content:
                    is_valid, payload, err = verify_license_key(content)
                    lid = payload.get("license_id", "")

                    # 1. Thu hồi tức thì nếu key nằm trong danh sách đen cứng hoặc online
                    is_revoked = (lid in HARDCODED_REVOKED_IDS) or (bool(lid) and check_revocation(lid)) or ("thu hồi" in (err or "").lower())
                    if is_revoked:
                        for p_del in get_all_license_paths():
                            try:
                                if hasattr(p_del, "unlink"):
                                    p_del.unlink(missing_ok=True)
                                elif os.path.exists(str(p_del)):
                                    os.remove(str(p_del))
                            except Exception:
                                pass
                        return False, payload, "License key này đã bị Tác giả thu hồi vĩnh viễn! Vui lòng liên hệ Tác giả để được cấp bản quyền mới."

                    # 2. Thu hồi tự động nếu thời hạn > 400 ngày trên máy không phải Tác giả (key VIP rò rỉ)
                    issued_s = payload.get("issued", "")
                    expiry_s = payload.get("expiry", "")
                    if issued_s and expiry_s:
                        try:
                            from datetime import datetime as _dt, timezone as _tz
                            _di = _dt.strptime(issued_s, "%Y-%m-%d").replace(tzinfo=_tz.utc)
                            _de = _dt.strptime(expiry_s, "%Y-%m-%d").replace(tzinfo=_tz.utc)
                            if (_de - _di).days > 400 and get_machine_id() != "4f0d356462e1ea6c9cb3de5b7d1e38ca":
                                for p_del in get_all_license_paths():
                                    try:
                                        if hasattr(p_del, "unlink"):
                                            p_del.unlink(missing_ok=True)
                                        elif os.path.exists(str(p_del)):
                                            os.remove(str(p_del))
                                    except Exception:
                                        pass
                                return False, payload, "Thời hạn bản quyền không hợp lệ (vượt quá 365 ngày). Bản quyền đã tự động bị thu hồi. Vui lòng liên hệ Tác giả."
                        except Exception:
                            pass

                    if is_valid:
                        found_key = content
                        found_payload = payload
                        break
            except Exception:
                continue

    if not found_key:
        return False, {}, "Chưa kích hoạt license. Vui lòng chạy KICH_HOAT_BAN_QUYEN.bat hoặc gửi Machine ID cho Tác giả."

    for p in get_all_license_paths(include_cwd=False):
        try:
            if not p.exists() or p.read_text(encoding="utf-8").strip() != found_key:
                p.parent.mkdir(parents=True, exist_ok=True)
                p.write_text(found_key, encoding="utf-8")
        except Exception:
            pass

    return True, found_payload, ""

def require_valid_license(required_feature: str | list[str] | None = None) -> dict:
    is_valid, payload, error = check_current_license()
    if not is_valid:
        print("=" * 65)
        print("  ⛔  CẦN KÍCH HOẠT LICENSE ĐỂ SỬ DỤNG SKILL NÀY")
        print("=" * 65)
        print(f"\n  {error}")
        print()
        print("  📋 Để được cấp license, liên hệ tác giả:")
        print(f"     1. Chạy file LAY_MA_MAY.bat để lấy Machine ID của máy bạn.")
        print(f"     2. Gửi Machine ID cho tác giả để nhận license key.")
        print(f"     3. Chạy KICH_HOAT_BAN_QUYEN.bat để kích hoạt.")
        print("=" * 65)
        sys.exit(1)

    if required_feature and not has_feature_permission(payload, required_feature):
        print("=" * 68)
        print("  🔒  TIỆN ÍCH NÀY CHƯA NẰM TRONG GÓI BẢN QUYỀN CỦA THẦY/CÔ")
        print("=" * 68)
        print(f"  • Tiện ích yêu cầu : {required_feature}")
        print(f"  • Gói hiện tại mở  : {format_features_summary(payload)}")
        print("=" * 68)
        sys.exit(2)

    return payload

def activate(license_key: str) -> bool:
    print("[*] Đang xác minh license key ...")
    is_valid, payload, error = verify_license_key(license_key)
    if not is_valid:
        print(f"[✗] License key KHÔNG HỢP LỆ:\n    {error}")
        return False

    clean_key = license_key.strip()
    for p in get_all_license_paths():
        try:
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(clean_key, encoding="utf-8")
        except Exception:
            pass

    days_left = (datetime.strptime(payload["expiry"], "%Y-%m-%d").replace(tzinfo=timezone.utc)
                 - datetime.now(timezone.utc)).days
    print(f"\n[✓] KÍCH HOẠT BẢN QUYỀN THÀNH CÔNG!")
    print(f"    Người dùng  : {payload.get('name', '')} ({payload.get('email', '')})")
    print(f"    Hạn sử dụng : {payload['expiry']} (còn {days_left} ngày)")
    print(f"    Gói mở khóa : {format_features_summary(payload)}")
    return True

def copy_to_clipboard(text: str):
    try:
        import subprocess
        cmd = f'powershell -Command "Set-Clipboard -Value \'{text}\'"'
        subprocess.run(cmd, shell=True, check=True)
        return True
    except Exception:
        return False

def main():
    import argparse
    p = argparse.ArgumentParser(description=f"License Manager – {SKILL_NAME}")
    g = p.add_mutually_exclusive_group(required=False)
    g.add_argument("--machine-id", action="store_true", help="Lấy Machine ID của máy này")
    g.add_argument("--activate",   nargs="?", const="PROMPT", metavar="LICENSE_KEY", help="Kích hoạt license key")
    g.add_argument("--check",      action="store_true",   help="Kiểm tra trạng thái license")
    g.add_argument("--silent-check", action="store_true", help="Kiểm tra license âm thầm (exit 0/1)")
    p.add_argument("--feature",    metavar="FEATURE_CODE", help="Kiểm tra tiện ích cụ thể")
    args = p.parse_args()

    if args.silent_check:
        is_valid, payload, error = check_current_license()
        if is_valid and args.feature:
            is_valid = has_feature_permission(payload, args.feature)
        sys.exit(0 if is_valid else 1)

    if not (args.machine_id or args.activate or args.check):
        args.check = True

    if args.machine_id:
        mid = get_machine_id()
        copied = copy_to_clipboard(mid)
        print("=" * 60)
        print("         MÃ ĐỊNH DANH MÁY TÍNH (MACHINE ID)")
        print("=" * 60)
        print(f"\n   Mã máy của bạn:  {mid}\n")
        print("-" * 60)
        if copied:
            print("📋 [ĐÃ TỰ ĐỘNG COPY VÀO BỘ NHỚ TẠM / CLIPBOARD!]")
            print("👉 Bạn chỉ cần mở tin nhắn Zalo gửi cho Tác giả và bấm Ctrl + V.")
        print("=" * 60)

    elif args.activate:
        key = args.activate
        if key == "PROMPT":
            print("=" * 60)
            print("   KÍCH HOẠT BẢN QUYỀN SOẠN SLIDE & VIDEO KHỞI ĐỘNG")
            print("=" * 60)
            key = input("\n👉 Dán mã License Key bạn nhận được rồi Enter:\n\n> ").strip()
        if not key:
            print("[!] Mã License Key không được để trống!")
            sys.exit(1)
        ok = activate(key)
        sys.exit(0 if ok else 1)

    elif args.check:
        is_valid, payload, error = check_current_license()
        print("\n" + "=" * 65)
        if is_valid:
            days_left = (datetime.strptime(payload["expiry"], "%Y-%m-%d").replace(tzinfo=timezone.utc)
                         - datetime.now(timezone.utc)).days
            status = "✅ HỢP LỆ" if days_left > 7 else f"⚠️  CÒN {days_left} NGÀY"
            print(f"  Trạng thái  : {status}")
            print(f"  Tên         : {payload.get('name', '')}")
            print(f"  Email/SĐT   : {payload.get('email', '')}")
            print(f"  Hết hạn     : {payload['expiry']} (còn {days_left} ngày)")
            print(f"  Khóa máy    : {'Khóa theo máy này' if payload.get('machine_id') != 'ANY' else 'Không giới hạn máy'}")
            print(f"  Gói mở khóa : {format_features_summary(payload)}")
            print("=" * 65)
            sys.exit(0)
        else:
            print(f"  Trạng thái  : ❌ CHƯA HỢP LỆ")
            print(f"  Chi tiết    : {error}")
            print("=" * 65)
            sys.exit(1)

if __name__ == "__main__":
    main()
