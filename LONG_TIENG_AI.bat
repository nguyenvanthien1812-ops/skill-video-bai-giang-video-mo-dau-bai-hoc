@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
title Long Tieng AI Cho Slide PowerPoint - Thay Thien

cd /d "%~dp0"

echo.
echo ====================================================================
echo      TU DONG LONG TIENG AI CHO SLIDE POWERPOINT TU LOI BINH (NOTES)
echo           Tac gia: Thay Nguyen Van Thien - THCS Ung Hoe
echo ====================================================================
echo.

set "PPTX_FILE=%~1"

if "%PPTX_FILE%"=="" (
    echo [HUONG DAN SU DUNG]:
    echo   1. KEO THA file PowerPoint (.pptx da co Notes) vao file bat nay.
    echo   2. Hoac nhap duong dan file PowerPoint vao ben duoi:
    echo.
    set /p "PPTX_FILE=[*] Nhap duong dan file .pptx: "
)

if "%PPTX_FILE%"=="" (
    echo [!] Chua co file PowerPoint de long tieng.
    pause
    exit /b 1
)

set "PPTX_FILE=%PPTX_FILE:"=%"

if not exist "%PPTX_FILE%" (
    echo [X] Khong tim thay file PowerPoint: "%PPTX_FILE%"
    pause
    exit /b 1
)

echo.
echo [CHON GIONG DOC PHAT THANH VIEN AI]:
echo   [1] Co Hoai My   (Giong nu mien Bac - Nhe nhang, truyen cam, chuan co giao)
echo   [2] Thay Nam Minh (Giong nam mien Bac - Dong dac, tram am, chuan thay giao)
echo.
set "VOICE_OPT=1"
set /p "VOICE_OPT=[*] Thay/Co chon [1 hoac 2, Nhan Enter de mac dinh chon 1]: "

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
if exist "%~dp0scripts\long_tieng_pptx.py" (
    set "SCRIPT_FILE=%~dp0scripts\long_tieng_pptx.py"
) else if exist "%USERPROFILE%\.gemini\config\skills\tao-slide-va-video-khoi-dong\scripts\long_tieng_pptx.py" (
    set "SCRIPT_FILE=%USERPROFILE%\.gemini\config\skills\tao-slide-va-video-khoi-dong\scripts\long_tieng_pptx.py"
) else if exist "%USERPROFILE%\.gemini\antigravity\skills\tao-slide-va-video-khoi-dong\scripts\long_tieng_pptx.py" (
    set "SCRIPT_FILE=%USERPROFILE%\.gemini\antigravity\skills\tao-slide-va-video-khoi-dong\scripts\long_tieng_pptx.py"
)

if not defined SCRIPT_FILE (
    echo [X] Khong tim thay script long_tieng_pptx.py!
    pause
    exit /b 1
)

echo.
echo [*] Dang tien hanh doc loi giang va long tieng vao slide...
echo.

"!PYTHON_EXE!" "%SCRIPT_FILE%" "%PPTX_FILE%" --voice "%VOICE_OPT%"

echo.
pause
