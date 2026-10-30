@echo off
setlocal enabledelayedexpansion
title Xuat Video Bai Giang MP4 Tu Slide PowerPoint - Thay Thien

echo.
echo ====================================================================
echo      XUAT VIDEO BAI GIANG MP4 TU FILE POWERPOINT (.PPTX)
echo           Tac gia: Thay Nguyen Van Thien - THCS Ung Hoe
echo ====================================================================
echo.

set "PPTX_FILE=%~1"

if "%PPTX_FILE%"=="" (
    echo [HUONG DAN SU DUNG]:
    echo   1. Thay/Co hay KEO THA file PowerPoint (.pptx) vao file bat nay.
    echo   2. Hoac nhap duong dan file PowerPoint vao ben duoi:
    echo.
    set /p "PPTX_FILE=[*] Nhap duong dan file .pptx: "
)

if "%PPTX_FILE%"=="" (
    echo [!] Chua co file PowerPoint de xuat video.
    pause
    exit /b 1
)

:: Xoa dau ngoac kep neu co
set "PPTX_FILE=%PPTX_FILE:"=%"

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
    echo [!] Khong tim thay Python tren may tinh!
    echo     Vui long chay file cai_dat_tu_dong.bat truoc de cai dat.
    pause
    exit /b 1
)

set "SCRIPT_FILE="
if exist "%~dp0scripts\xuat_video_pptx.py" (
    set "SCRIPT_FILE=%~dp0scripts\xuat_video_pptx.py"
) else if exist "%USERPROFILE%\.gemini\config\skills\tao-slide-va-video-khoi-dong\scripts\xuat_video_pptx.py" (
    set "SCRIPT_FILE=%USERPROFILE%\.gemini\config\skills\tao-slide-va-video-khoi-dong\scripts\xuat_video_pptx.py"
) else if exist "%USERPROFILE%\.gemini\antigravity\skills\tao-slide-va-video-khoi-dong\scripts\xuat_video_pptx.py" (
    set "SCRIPT_FILE=%USERPROFILE%\.gemini\antigravity\skills\tao-slide-va-video-khoi-dong\scripts\xuat_video_pptx.py"
) else if exist "%USERPROFILE%\.gemini\config\skills\tao-slide-bai-giang\scripts\xuat_video_pptx.py" (
    set "SCRIPT_FILE=%USERPROFILE%\.gemini\config\skills\tao-slide-bai-giang\scripts\xuat_video_pptx.py"
)

if "%SCRIPT_FILE%"=="" (
    echo [X] Khong tim thay script xuat_video_pptx.py!
    pause
    exit /b 1
)

echo [*] Dang tien hanh xuat video tu file: %PPTX_FILE%
echo [*] Vui long cho trong giay lat de PowerPoint render video...
echo.

"%PYTHON_EXE%" "%SCRIPT_FILE%" "%PPTX_FILE%"

echo.
pause
