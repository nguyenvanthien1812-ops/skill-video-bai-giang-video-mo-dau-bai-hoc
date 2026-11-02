@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
title Nap Tien Ich Slide PPTX va Video Khoi Dong Vao Google Antigravity

cd /d "%~dp0"

echo.
echo ====================================================================
echo   TU DONG NAP TIEN ICH VAO GOOGLE ANTIGRAVITY DANH CHO GIAO VIEN
echo   Tien ich: Soan Slide Bai Giang Chuan Su Pham va Video Khoi Dong
echo   Tac gia: Thay Nguyen Van Thien - THCS Ung Hoe
echo ====================================================================
echo.

REM Kiem tra ban quyen truoc khi nap
if exist "%~dp0scripts\license_manager.py" (
    python "%~dp0scripts\license_manager.py" --silent-check >nul 2>nul
    if errorlevel 1 (
        echo.
        echo ====================================================================
        echo   [!] MAY CHUA DUOC KICH HOAT BAN QUYEN!
        echo   Vui long chay LAY_MA_MAY.bat gui cho Tac gia, sau do chay
        echo   KICH_HOAT_BAN_QUYEN.bat truoc khi nap vao Antigravity.
        echo ====================================================================
        echo.
        pause
        exit /b 1
    )
)

set "TARGET_DIR_1=%USERPROFILE%\.gemini\config\skills\tao-slide-va-video-khoi-dong"
set "TARGET_DIR_2=%USERPROFILE%\.gemini\antigravity\skills\tao-slide-va-video-khoi-dong"

echo [*] Dang tao thu muc tien ich tren may tinh cua Thay/Co...
if not exist "%TARGET_DIR_1%" mkdir "%TARGET_DIR_1%" >nul 2>&1
if not exist "%TARGET_DIR_2%" mkdir "%TARGET_DIR_2%" >nul 2>&1

echo [*] Dang sao chep toan bo file tien ich vao Google Antigravity (ho tro 100% Unicode tieng Viet)...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$src = (Get-Item -LiteralPath '%~dp0').FullName; $dst1 = '%TARGET_DIR_1%'; $dst2 = '%TARGET_DIR_2%'; if (!(Test-Path $dst1)) { New-Item -ItemType Directory -Path $dst1 -Force | Out-Null }; if (!(Test-Path $dst2)) { New-Item -ItemType Directory -Path $dst2 -Force | Out-Null }; $items = Get-ChildItem -LiteralPath $src | Where-Object { $_.Name -notin @('__pycache__', '.git') } | Select-Object -ExpandProperty FullName; Copy-Item -LiteralPath $items -Destination $dst1 -Recurse -Force; Copy-Item -LiteralPath $items -Destination $dst2 -Recurse -Force" >nul 2>&1
if %errorlevel% neq 0 (
    python -c "import sys, shutil; from pathlib import Path; src = Path(r'%~dp0'); [shutil.copytree(p, Path(r'%TARGET_DIR_1%') / p.name, dirs_exist_ok=True) if p.is_dir() else shutil.copy2(p, Path(r'%TARGET_DIR_1%') / p.name) for p in src.iterdir() if p.name not in ('__pycache__', '.git')]" >nul 2>&1
    python -c "import sys, shutil; from pathlib import Path; src = Path(r'%~dp0'); [shutil.copytree(p, Path(r'%TARGET_DIR_2%') / p.name, dirs_exist_ok=True) if p.is_dir() else shutil.copy2(p, Path(r'%TARGET_DIR_2%') / p.name) for p in src.iterdir() if p.name not in ('__pycache__', '.git')]" >nul 2>&1
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "$srcLic = Join-Path '%~dp0' 'license.key'; $dstLic1 = Join-Path '%TARGET_DIR_1%' 'license.key'; $dstLic2 = Join-Path '%TARGET_DIR_2%' 'license.key'; $usrLic = Join-Path $env:USERPROFILE '.gemini\license.key'; if (Test-Path -LiteralPath $srcLic) { Copy-Item -LiteralPath $srcLic -Destination $dstLic1 -Force -ErrorAction SilentlyContinue; Copy-Item -LiteralPath $srcLic -Destination $dstLic2 -Force -ErrorAction SilentlyContinue; Copy-Item -LiteralPath $srcLic -Destination $usrLic -Force -ErrorAction SilentlyContinue }" >nul 2>&1

echo.
echo ====================================================================
echo   [HOAN TAT] DA NAP TIEN ICH VAO ANTIGRAVITY THANH CONG 100%!
echo.
echo   Bay gio Thay/Co chi can mo Google Antigravity len va nhan tin:
echo.
echo   [>] LAM VIDEO KHOI DONG:
echo       "Toi muon tao kich ban video mo dau bai hoc..."
echo.
echo   [>] SOAN SLIDE BAI GIANG POWERPOINT:
echo       "Soan bai giang PPTX tu file giao an nay giup toi..."
echo       hoac gui anh chup / PDF SGK kem lenh:
echo       "Lam slide bai giang KHTN chuan 3 buoc tu SGK nay..."
echo ====================================================================
echo.
pause