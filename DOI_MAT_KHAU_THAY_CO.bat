@echo off
chcp 65001 >nul
title Doi Mat Khau Che Do Thay Co (1-Click) - Video Tuong Tac E-Learning

echo.
echo ====================================================================
echo   🔐 CÔNG CỤ ĐỔI MẬT KHẨU CHẾ ĐỘ THẦY CÔ (1-CLICK)
echo   Dành cho bài giảng Video Tương Tác E-Learning
echo ====================================================================
echo.

set "PYTHON_EXE=python"
py -c "import sys" >nul 2>nul
if not errorlevel 1 set "PYTHON_EXE=py"

set "TARGET_PATH=%~1"
if not "%TARGET_PATH%"=="" goto :ASK_PWD

echo 👉 CACH DUNG NHANH:
echo    Thay/Co co the keo tha truc tiep THU MUC bai giang (hoac file index.html)
echo    vao bieu tuong file DOI_MAT_KHAU_THAY_CO.bat nay, hoac dan duong dan o duoi:
echo.
set /p TARGET_PATH="📂 Dan duong dan thu muc bai giang (hoac file index.html): "

:ASK_PWD
if "%TARGET_PATH%"=="" (
    echo [!] Chua nhap duong dan bai giang.
    pause
    exit /b 1
)

echo.
echo [*] Bai giang duoc chon: %TARGET_PATH%
set /p NEW_PWD="🔑 Nhap MAT KHAU MOI cho Che do Thay Co (VD: Thien2026): "

if "%NEW_PWD%"=="" (
    echo [!] Mat khau moi khong duoc de trong!
    pause
    exit /b 1
)

echo.
"%PYTHON_EXE%" "%~dp0scripts\interactive_video_builder.py" --set-password "%NEW_PWD%" "%TARGET_PATH%"

echo.
pause
