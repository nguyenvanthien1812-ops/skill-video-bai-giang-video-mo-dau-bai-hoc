@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
title Xuat Video Bai Giang MP4 Tu Slide PowerPoint - Thay Thien

cd /d "%~dp0"

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

set "PPTX_FILE=%PPTX_FILE:"=%"

if not exist "%PPTX_FILE%" (
    echo [X] Khong tim thay file PowerPoint: "%PPTX_FILE%"
    pause
    exit /b 1
)

set "PYTHON_EXE="
python -c "import sys" >nul 2>&1 && set "PYTHON_EXE=python"
if not defined PYTHON_EXE py -c "import sys" >nul 2>&1 && set "PYTHON_EXE=py"
if not defined PYTHON_EXE (
    if exist "%LOCALAPPDATA%\Programs\Python" (
        for /f "delims=" %%D in ('dir /b /ad /o-n "%LOCALAPPDATA%\Programs\Python\Python3*" 2^>nul') do (
            if not defined PYTHON_EXE if exist "%LOCALAPPDATA%\Programs\Python\%%D\python.exe" (
                set "PYTHON_EXE=%LOCALAPPDATA%\Programs\Python\%%D\python.exe"
            )
        )
    )
)
if not defined PYTHON_EXE (
    if exist "C:\Program Files\Python3*" (
        for /f "delims=" %%D in ('dir /b /ad /o-n "C:\Program Files\Python3*" 2^>nul') do (
            if not defined PYTHON_EXE if exist "C:\Program Files\%%D\python.exe" (
                set "PYTHON_EXE=C:\Program Files\%%D\python.exe"
            )
        )
    )
)
if not defined PYTHON_EXE (
    if exist "C:\Python3*" (
        for /f "delims=" %%D in ('dir /b /ad /o-n "C:\Python3*" 2^>nul') do (
            if not defined PYTHON_EXE if exist "C:\%%D\python.exe" (
                set "PYTHON_EXE=C:\%%D\python.exe"
            )
        )
    )
)

if not defined PYTHON_EXE (
    echo [!] Khong tim thay Python tren may tinh!
    echo     Vui long nhap dup file "1_CAI_DAT_MOI_TRUONG.bat" truoc.
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
)

if not defined SCRIPT_FILE (
    echo [X] Khong tim thay script xuat_video_pptx.py!
    pause
    exit /b 1
)

echo [*] Dang tien hanh xuat video tu file: %PPTX_FILE%
echo [*] Vui long cho trong giay lat de PowerPoint render video...
echo.

"!PYTHON_EXE!" "%SCRIPT_FILE%" "%PPTX_FILE%"

echo.
pause
