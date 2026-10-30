#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
link_new_github.py — Liên kết & Đẩy trọn bộ Skill lên Repository GitHub Mới (1-Click)
=====================================================================================
Tự động:
1. Nhận đường link GitHub mới (VD: https://github.com/nguyenvanthien1812-ops/ten-repo-moi.git)
2. Trích xuất Username & Tên Repo -> ghi tự động vào version.json, github_config.json và scripts/updater.py
   để mọi giáo viên tải bộ cài từ GitHub mới đều dùng được tính năng "Cập nhật tính năng mới" 1-click!
3. Đồng bộ bản mới sang Google Antigravity (%USERPROFILE%/.gemini/...)
4. Khởi tạo/cập nhật Git commit, gắn remote origin và đẩy thẳng lên nhánh main (git push -u origin main).
"""

import os
import re
import sys
import json
import subprocess
import argparse

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
SKILL_DIR = os.path.dirname(SCRIPT_DIR)
VER_FILE = os.path.join(SKILL_DIR, "version.json")
CFG_FILE = os.path.join(SKILL_DIR, "github_config.json")
UPDATER_FILE = os.path.join(SCRIPT_DIR, "updater.py")


def parse_github_url(raw_url: str):
    raw = raw_url.strip().strip('"').strip("'").rstrip("/")
    m = re.search(r"github\.com[:/]([^/\s]+)/([^/\s]+?)(?:\.git)?$", raw)
    if m:
        user, repo = m.group(1), m.group(2)
        https_url = f"https://github.com/{user}/{repo}.git"
        return user, repo, https_url
    if re.match(r"^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$", raw):
        user, repo = raw.split("/", 1)
        repo = re.sub(r"\.git$", "", repo)
        return user, repo, f"https://github.com/{user}/{repo}.git"
    return None, None, None


def run_git(args_list, check=True):
    return subprocess.run(
        ["git", "-C", SKILL_DIR] + args_list,
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        check=check,
    )


def main():
    parser = argparse.ArgumentParser(description="Liên kết và đẩy Skill lên GitHub mới")
    parser.add_argument("--url", type=str, default="", help="Đường link GitHub repository mới")
    args = parser.parse_args()

    raw_url = args.url.strip()
    if not raw_url:
        print("=" * 70)
        print("  🚀 ĐẨY BỘ SKILL SLIDE PPTX & VIDEO TƯƠNG TÁC LÊN GITHUB MỚI")
        print("=" * 70)
        print("\nHướng dẫn nhanh trên trình duyệt GitHub:")
        print("  1. Vào https://github.com/new")
        print("  2. Đặt tên Repository (ví dụ: skill-slide-va-video-tuong-tac)")
        print("  3. Chọn Public -> KHÔNG tích 'Add a README file' -> Bấm 'Create repository'")
        print("  4. Copy đường link HTTPS của repo vừa tạo và dán vào bên dưới:\n")
        raw_url = input("👉 Dán đường link GitHub mới vào đây: ").strip()

    user, repo, https_url = parse_github_url(raw_url)
    if not user or not repo:
        print(f"\n[✗] Đường link không hợp lệ: '{raw_url}'")
        print("    Ví dụ đúng: https://github.com/nguyenvanthien1812-ops/skill-slide-va-video-tuong-tac.git")
        sys.exit(1)

    print(f"\n[*] Đã nhận diện kho GitHub mới: {user}/{repo}")
    print(f"    URL chuẩn: {https_url}")

    # 1. Cập nhật version.json
    if os.path.exists(VER_FILE):
        with open(VER_FILE, "r", encoding="utf-8") as f:
            vdata = json.load(f)
        vdata["github_repo"] = f"{user}/{repo}"
        with open(VER_FILE, "w", encoding="utf-8") as f:
            json.dump(vdata, f, indent=2, ensure_ascii=False)
        print(f"[✓] Đã gắn '{user}/{repo}' vào version.json")

    # 2. Cập nhật github_config.json
    with open(CFG_FILE, "w", encoding="utf-8") as f:
        json.dump({"github_user": user, "github_repo": repo}, f, indent=2, ensure_ascii=False)
    print(f"[✓] Đã lưu cấu hình github_config.json")

    # 3. Cập nhật giá trị mặc định trong scripts/updater.py để giáo viên tải về dùng được ngay
    if os.path.exists(UPDATER_FILE):
        utxt = open(UPDATER_FILE, "r", encoding="utf-8").read()
        utxt = re.sub(r'^GITHUB_USER\s*=\s*".*"', f'GITHUB_USER = "{user}"', utxt, flags=re.MULTILINE)
        utxt = re.sub(r'^GITHUB_REPO\s*=\s*".*"', f'GITHUB_REPO = "{repo}"', utxt, flags=re.MULTILINE)
        with open(UPDATER_FILE, "w", encoding="utf-8") as f:
            f.write(utxt)
        print(f"[✓] Đã đồng bộ địa chỉ tự động cập nhật trong scripts/updater.py")

    # 4. Đồng bộ vào Antigravity Global
    try:
        from updater import sync_to_antigravity_global
        sync_to_antigravity_global(SKILL_DIR)
        print("[✓] Đã đồng bộ sang thư mục Global của Google Antigravity")
    except Exception:
        pass

    # 5. Khởi tạo Git nếu chưa có, commit và push
    if not os.path.exists(os.path.join(SKILL_DIR, ".git")):
        run_git(["init", "-b", "main"])
    else:
        run_git(["branch", "-M", "main"], check=False)

    run_git(["add", "-A"])
    status = run_git(["status", "--porcelain"], check=False)
    if status.stdout.strip():
        run_git(["commit", "-m", f"v2.0.0: Khoi tao & lien ket kho GitHub {user}/{repo}"], check=False)

    remotes = run_git(["remote"], check=False).stdout.split()
    if "origin" in remotes:
        run_git(["remote", "set-url", "origin", https_url])
    else:
        run_git(["remote", "add", "origin", https_url])

    print(f"\n[*] Đang đẩy toàn bộ mã nguồn lên GitHub ({https_url})...")
    push_res = subprocess.run(
        ["git", "-C", SKILL_DIR, "push", "-u", "origin", "main"],
        text=True,
    )
    if push_res.returncode == 0:
        print("\n" + "=" * 70)
        print("  🎉 ĐÃ ĐẨY THÀNH CÔNG 100% LÊN GITHUB MỚI!")
        print(f"  🔗 Đường link GitHub: https://github.com/{user}/{repo}")
        print(f"  📦 Link tải ZIP trực tiếp cho Giáo viên:")
        print(f"     https://github.com/{user}/{repo}/archive/refs/heads/main.zip")
        print("=" * 70)
    else:
        print("\n[!] Lệnh git push chưa hoàn tất. Thầy/Cô kiểm tra lại:")
        print("    1. Đã bấm 'Create repository' (trống, chưa tạo README) trên GitHub chưa?")
        print("    2. Nếu repo trên GitHub lỡ tích tạo sẵn README, có thể chạy:")
        print(f'       git -C "{SKILL_DIR}" push -u origin main --force')
        sys.exit(push_res.returncode)


if __name__ == "__main__":
    main()
