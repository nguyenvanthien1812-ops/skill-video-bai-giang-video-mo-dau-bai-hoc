@echo off
chcp 65001 >nul
title Cap Nhat Tinh Nang Moi Tu GitHub - Slide PPTX & Video Tuong Tac

echo.
echo ====================================================================
echo   🔄 CẬP NHẬT TÍNH NĂNG MỚI NHẤT TỪ GITHUB (1-CLICK)
echo   Tiện ích: Slide PPTX, Lời Bình, Video MP4 ^& Video Tương Tác
echo ====================================================================
echo.

set "PYTHON_EXE="
py -c "import sys" >nul 2>nul && set "PYTHON_EXE=py"
if "%PYTHON_EXE%"=="" python -c "import sys" >nul 2>nul && set "PYTHON_EXE=python"
if "%PYTHON_EXE%"=="" (
    for /d %%D in ("%LOCALAPPDATA%\Programs\Python\Python3*") do if exist "%%D\python.exe" set "PYTHON_EXE=%%D\python.exe"
)
if "%PYTHON_EXE%"=="" (
    for /d %%D in ("C:\Program Files\Python3*") do if exist "%%D\python.exe" set "PYTHON_EXE=%%D\python.exe"
)
if "%PYTHON_EXE%"=="" (
    for /d %%D in ("C:\Python3*") do if exist "%%D\python.exe" set "PYTHON_EXE=%%D\python.exe"
)

if "%PYTHON_EXE%"=="" (
    echo [!] Không tìm thấy Python trên máy tính! Vui lòng chạy 1_CAI_DAT_MOI_TRUONG.bat trước.
    pause
    exit /b 1
)

"%PYTHON_EXE%" "%~dp0scripts\updater.py"

echo.
pause
