#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script Tự Động Cập Nhật Bộ Tiện Ích Slide PPTX, Video Bài Giảng & Video Tương Tác từ GitHub
- Tự động đọc cấu hình repo từ github_config.json, version.json hoặc git remote origin
- Tải phiên bản mới nhất trên GitHub và cập nhật an toàn
- Tự động đồng bộ ngay vào Google Antigravity (%USERPROFILE%/.gemini/...)
"""

import sys
import os
import re
import json
import subprocess
import urllib.request
import urllib.error
import shutil
import tempfile
import zipfile
import argparse

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
SKILL_DIR = os.path.dirname(SCRIPT_DIR)
LOCAL_VER = os.path.join(SKILL_DIR, "version.json")
CONFIG_FILE = os.path.join(SKILL_DIR, "github_config.json")

PROTECTED_FILES = {
    "config.json",
    "license.key",
    "machine_id.txt",
    "MA_MAY_CUA_BAN.txt",
    "github_config.json",
}

GITHUB_USER = "nguyenvanthien1812-ops"
GITHUB_REPO = "skill-video-bai-giang-video-mo-dau-bai-hoc"


def detect_github_repo():
    """Tự động phát hiện user/repo từ github_config.json, version.json hoặc git remote."""
    user, repo = GITHUB_USER, GITHUB_REPO

    if os.path.exists(LOCAL_VER):
        try:
            with open(LOCAL_VER, "r", encoding="utf-8") as f:
                vdata = json.load(f)
            gr = vdata.get("github_repo", "")
            if "/" in gr:
                u, r = gr.split("/", 1)
                if u.strip() and r.strip():
                    user, repo = u.strip(), r.strip()
        except Exception:
            pass

    if os.path.exists(CONFIG_FILE):
        try:
            with open(CONFIG_FILE, "r", encoding="utf-8") as f:
                cfg = json.load(f)
            user = cfg.get("github_user", user) or user
            repo = cfg.get("github_repo", repo) or repo
        except Exception:
            pass

    git_dir = os.path.join(SKILL_DIR, ".git")
    if os.path.exists(git_dir):
        try:
            res = subprocess.run(
                ["git", "-C", SKILL_DIR, "remote", "get-url", "origin"],
                capture_output=True,
                text=True,
                timeout=5,
            )
            if res.returncode == 0 and res.stdout.strip():
                m = re.search(r"github\.com[:/]([^/\s]+)/([^/\s]+?)(?:\.git)?$", res.stdout.strip())
                if m:
                    user, repo = m.group(1), m.group(2)
        except Exception:
            pass

    return user, repo


def get_github_urls(user, repo):
    api_base = f"https://api.github.com/repos/{user}/{repo}"
    raw_base = f"https://raw.githubusercontent.com/{user}/{repo}/main"
    zip_url = f"https://github.com/{user}/{repo}/archive/refs/heads/main.zip"
    version_url = f"{raw_base}/version.json"
    return api_base, raw_base, zip_url, version_url


def fetch_json(url, timeout=10):
    req = urllib.request.Request(url, headers={"User-Agent": "slide-video-skill-updater/2.0"})
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return json.loads(resp.read().decode("utf-8"))


def read_local_version():
    if not os.path.exists(LOCAL_VER):
        return "0.0.0", {}
    try:
        with open(LOCAL_VER, encoding="utf-8") as f:
            data = json.load(f)
        return data.get("version", "0.0.0"), data
    except Exception:
        return "0.0.0", {}


def compare_versions(v1, v2):
    def parse(v):
        parts = []
        for x in str(v).split("."):
            try:
                parts.append(int(x))
            except ValueError:
                parts.append(0)
        return tuple(parts)

    return parse(v2) > parse(v1)


def sync_to_antigravity_global(src_dir):
    """Đồng bộ bản mới nhất vào thư mục Global Skills của Google Antigravity."""
    home = os.path.expanduser("~")
    targets = [
        os.path.join(home, ".gemini", "config", "skills", "tao-slide-va-video-khoi-dong"),
        os.path.join(home, ".gemini", "antigravity", "skills", "tao-slide-va-video-khoi-dong"),
    ]
    synced = []
    for dst in targets:
        try:
            if os.path.abspath(src_dir).lower() == os.path.abspath(dst).lower():
                continue
            os.makedirs(dst, exist_ok=True)
            for root, dirs, files in os.walk(src_dir):
                dirs[:] = [d for d in dirs if d not in {".git", "__pycache__", "extracted_images"}]
                rel_dir = os.path.relpath(root, src_dir)
                target_dir = dst if rel_dir == "." else os.path.join(dst, rel_dir)
                os.makedirs(target_dir, exist_ok=True)
                for fn in files:
                    if fn.endswith((".pyc", ".pyo", ".tmp")) or fn.startswith("~$"):
                        continue
                    if fn in PROTECTED_FILES and os.path.exists(os.path.join(target_dir, fn)):
                        continue
                    shutil.copy2(os.path.join(root, fn), os.path.join(target_dir, fn))
            synced.append(dst)
        except Exception:
            pass
    return synced


def download_zip_and_update(zip_url, dest_dir):
    print("[*] Đang tải gói cập nhật mới nhất từ GitHub...")
    fd, tmp_zip = tempfile.mkstemp(suffix=".zip")
    os.close(fd)
    try:
        req = urllib.request.Request(zip_url, headers={"User-Agent": "slide-video-skill-updater/2.0"})
        with urllib.request.urlopen(req, timeout=60) as resp, open(tmp_zip, "wb") as f:
            f.write(resp.read())
        print("[*] Tải về thành công! Đang giải nén và cập nhật...")

        with zipfile.ZipFile(tmp_zip, "r") as z:
            namelist = z.namelist()
            prefix = ""
            for n in namelist:
                if n.endswith("/") and n.count("/") == 1:
                    prefix = n
                    break

            updated, skipped = [], []
            for member in namelist:
                if member == prefix:
                    continue
                rel_path = member[len(prefix):] if prefix and member.startswith(prefix) else member
                if not rel_path:
                    continue

                basename = os.path.basename(rel_path)
                if basename in PROTECTED_FILES:
                    skipped.append(rel_path)
                    continue

                target = os.path.join(dest_dir, rel_path)
                if member.endswith("/"):
                    os.makedirs(target, exist_ok=True)
                else:
                    os.makedirs(os.path.dirname(target), exist_ok=True)
                    with z.open(member) as src, open(target, "wb") as dst:
                        dst.write(src.read())
                    updated.append(rel_path)
        return updated, skipped
    finally:
        if os.path.exists(tmp_zip):
            try:
                os.remove(tmp_zip)
            except Exception:
                pass


def main():
    parser = argparse.ArgumentParser(description="Cập nhật Bộ Tiện Ích Slide PPTX & Video Tương Tác từ GitHub")
    parser.add_argument("--check-only", action="store_true", help="Chỉ kiểm tra phiên bản")
    parser.add_argument("--force", action="store_true", help="Buộc cập nhật mới nhất và không cần hỏi xác nhận")
    parser.add_argument("--repo", type=str, default=None, help="Định dạng user/repo hoặc URL GitHub")
    args = parser.parse_args()

    user, repo = detect_github_repo()
    if args.repo:
        m = re.search(r"github\.com[:/]([^/\s]+)/([^/\s]+?)(?:\.git)?$", args.repo.strip())
        if m:
            user, repo = m.group(1), m.group(2)
        elif "/" in args.repo:
            user, repo = [x.strip() for x in args.repo.split("/", 1)]

    print("=" * 68)
    print("  🔄 CẬP NHẬT TỰ ĐỘNG – SLIDE PPTX, VIDEO MP4 & VIDEO TƯƠNG TÁC")
    print("=" * 68)

    local_ver, _ = read_local_version()
    print(f"\n[i] Phiên bản trên máy hiện tại : v{local_ver}")
    print(f"[*] Kho lưu trữ GitHub kết nối  : {user}/{repo}")

    _, _, zip_url, version_url = get_github_urls(user, repo)

    try:
        remote_data = fetch_json(version_url, timeout=10)
        remote_ver = remote_data.get("version", "0.0.0")
        print(f"[i] Phiên bản mới nhất GitHub   : v{remote_ver}")
    except Exception as e:
        print(f"\n[OFFLINE] Chưa kết nối được kho GitHub ({user}/{repo}): {e}")
        print("          • Nếu Thầy/Cô vừa tạo GitHub mới, hãy chạy DAY_LEN_GITHUB_MOI.bat để liên kết.")
        print("          • Bộ tiện ích hiện tại trên máy vẫn hoạt động bình thường 100%.")
        return

    is_newer = compare_versions(local_ver, remote_ver)
    if not is_newer and not args.force:
        print(f"\n[✓] Tuyệt vời! Thầy/Cô đang sử dụng PHIÊN BẢN MỚI NHẤT (v{local_ver}).")
        sync_to_antigravity_global(SKILL_DIR)
        return

    if args.check_only:
        print(f"\n[!] Đã có phiên bản mới: v{remote_ver} (hiện tại: v{local_ver})")
        return

    changelog = remote_data.get("changelog", {}).get(remote_ver, [])
    if changelog:
        print(f"\n  🌟 Các cải tiến trong phiên bản v{remote_ver}:")
        for item in changelog:
            print(f"    • {item}")

    if not args.force:
        confirm = input("\n  Cập nhật ngay bây giờ? [Y/n] (Nhấn Enter để đồng ý): ").strip().upper()
        if confirm and confirm not in ("Y", "YES"):
            print("  Đã hủy tiến trình cập nhật.")
            return

    updated_files, skipped_files = download_zip_and_update(zip_url, SKILL_DIR)
    synced_dirs = sync_to_antigravity_global(SKILL_DIR)

    print(f"\n[✓] Đã cập nhật thành công {len(updated_files)} tệp mã nguồn & tài liệu.")
    if synced_dirs:
        print(f"[✓] Đã tự động đồng bộ vào Google Antigravity ({len(synced_dirs)} thư mục hệ thống).")
    if skipped_files:
        print(f"[i] Giữ nguyên an toàn {len(skipped_files)} tệp cấu hình riêng.")

    print("\n" + "=" * 68)
    print(f"  🎉 HOÀN TẤT CẬP NHẬT LÊN PHIÊN BẢN v{remote_ver} THÀNH CÔNG!")
    print("=" * 68)


if __name__ == "__main__":
    main()
