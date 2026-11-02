@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
title Cai Dat Moi Truong - Tien Ich Soan Slide PPTX va Video Khoi Dong

:: Chuyen ve dung thu muc cua file bat
cd /d "%~dp0"

echo.
echo ====================================================================
echo      HE THONG CAI DAT TU DONG 1-CLICK DANH CHO GIAO VIEN
echo      Tien ich: Soan Slide Bai Giang Chuan Su Pham va Video Khoi Dong
echo      Tac gia: Thay Nguyen Van Thien - THCS Ung Hoe
echo ====================================================================
echo.

set "PYTHON_EXE="

:: ─── BUOC 1: KIEM TRA MOI TRUONG PYTHON ───────────────────────────
echo [*] Buoc 1/2: Dang kiem tra moi truong Python tren may tinh...

:: 1. Kiem tra python trong PATH
python -c "import sys" >nul 2>&1
if !errorlevel! equ 0 (
    set "PYTHON_EXE=python"
    goto :PYTHON_READY
)

:: 2. Kiem tra py launcher trong PATH
py -c "import sys" >nul 2>&1
if !errorlevel! equ 0 (
    set "PYTHON_EXE=py"
    goto :PYTHON_READY
)

:: 3. Kiem tra cac thu muc cai dat Python tren Windows
if exist "%LOCALAPPDATA%\Programs\Python" (
    for /f "delims=" %%D in ('dir /b /ad /o-n "%LOCALAPPDATA%\Programs\Python\Python3*" 2^>nul') do (
        if not defined PYTHON_EXE if exist "%LOCALAPPDATA%\Programs\Python\%%D\python.exe" (
            set "PYTHON_EXE=%LOCALAPPDATA%\Programs\Python\%%D\python.exe"
            set "PATH=%LOCALAPPDATA%\Programs\Python\%%D;%LOCALAPPDATA%\Programs\Python\%%D\Scripts;!PATH!"
            goto :PYTHON_READY
        )
    )
)

if exist "C:\Program Files\Python3*" (
    for /f "delims=" %%D in ('dir /b /ad /o-n "C:\Program Files\Python3*" 2^>nul') do (
        if not defined PYTHON_EXE if exist "C:\Program Files\%%D\python.exe" (
            set "PYTHON_EXE=C:\Program Files\%%D\python.exe"
            set "PATH=C:\Program Files\%%D;C:\Program Files\%%D\Scripts;!PATH!"
            goto :PYTHON_READY
        )
    )
)

if exist "C:\Python3*" (
    for /f "delims=" %%D in ('dir /b /ad /o-n "C:\Python3*" 2^>nul') do (
        if not defined PYTHON_EXE if exist "C:\%%D\python.exe" (
            set "PYTHON_EXE=C:\%%D\python.exe"
            set "PATH=C:\%%D;C:\%%D\Scripts;!PATH!"
            goto :PYTHON_READY
        )
    )
)

:: ─── NEU CHUA CO PYTHON: TU DONG TAI VA CAI DAT ─────────────────
echo [!] May tinh chua co Python. Dang tu dong tai Python 3.11 ve cai dat...
set "PY_URL=https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe"
set "PY_INSTALLER=%TEMP%\python-3.11.9-installer.exe"

powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%PY_URL%', '%PY_INSTALLER%')"

if exist "%PY_INSTALLER%" (
    echo [*] Dang cai dat Python 3.11 tu dong (vui long cho 1-2 phut)...
    start /wait "" "%PY_INSTALLER%" /quiet InstallAllUsers=0 PrependPath=1 Include_test=0
    del /f /q "%PY_INSTALLER%" >nul 2>&1
)

:: Kiem tra lai sau khi cai dat
if exist "%LOCALAPPDATA%\Programs\Python" (
    for /f "delims=" %%D in ('dir /b /ad /o-n "%LOCALAPPDATA%\Programs\Python\Python3*" 2^>nul') do (
        if not defined PYTHON_EXE if exist "%LOCALAPPDATA%\Programs\Python\%%D\python.exe" (
            set "PYTHON_EXE=%LOCALAPPDATA%\Programs\Python\%%D\python.exe"
            set "PATH=%LOCALAPPDATA%\Programs\Python\%%D;%LOCALAPPDATA%\Programs\Python\%%D\Scripts;!PATH!"
            goto :PYTHON_READY
        )
    )
)

python -c "import sys" >nul 2>&1
if !errorlevel! equ 0 (
    set "PYTHON_EXE=python"
    goto :PYTHON_READY
)

echo.
echo ====================================================================
echo  [X] LOI: Khong the tu dong tai hoac cai dat Python tren may nay!
echo ====================================================================
echo  Thay/Co vui long cai dat Python bang tay theo 2 buoc don gian sau:
echo  1. Truy cap: https://www.python.org/downloads/ va tai Python ve cai.
echo  2. QUAN TRONG: Khi cai dat, nho TICH CHON vao o "Add python.exe to PATH".
echo  3. Sau do mo lai file nay la xong ngay!
echo ====================================================================
echo.
pause
exit /b 1

:PYTHON_READY
echo [OK] Python da san sang: !PYTHON_EXE!

:: ─── BUOC 2: CAI DAT CAC THU VIEN BO TRO ──────────────────────────
echo.
echo [*] Buoc 2/2: Dang tu dong cai dat cac thu vien can thiet:
echo     - python-pptx (Tao va xu ly slide PowerPoint)
echo     - edge-tts (Long tieng AI giong phat thanh vien mien phi)
echo     - pillow (Xu ly hinh anh sac net cho slide)
echo     - lxml (Xu ly XML DrawingML va cong thuc toan OMML)
echo     - python-docx, docx2txt (Doc va boc tach anh tu file Word giao an)
echo     - pymupdf, pypdf (Doc va boc tach anh tu sach giao khoa PDF)
echo     - requests (Tim kiem anh khoa hoc tren Internet)
echo.

echo [*] Dang kiem tra va nang cap cong cu pip...
"!PYTHON_EXE!" -m pip install --upgrade pip --quiet --no-warn-script-location

echo [*] Dang cai dat cac thu vien vao Python (vui long cho trong giay lat)...
"!PYTHON_EXE!" -m pip install python-pptx edge-tts pillow lxml requests python-docx docx2txt pymupdf pypdf cryptography --quiet --no-warn-script-location

echo.
echo [*] Kiem tra nhanh moi truong sau khi cai dat...
"!PYTHON_EXE!" -c "import pptx, edge_tts, PIL, lxml, requests, docx, fitz; print('    [OK] Tat ca thu vien cot loi da san sang 100%!')"

if !errorlevel! neq 0 (
    echo [!] Mot so thu vien dang duoc bo sung, dang thu lai...
    "!PYTHON_EXE!" -m pip install python-pptx edge-tts pillow lxml requests python-docx pymupdf --no-warn-script-location
)

echo.
echo [*] Kiem tra ban quyen...
"!PYTHON_EXE!" "%~dp0scripts\license_manager.py" --silent-check >nul 2>nul
if !errorlevel! neq 0 (
    echo.
    echo ====================================================================
    echo   [!] MAY CHUA KICH HOAT BAN QUYEN HOAC DANG DUNG KEY CHO MAY KHAC!
    echo   Quy Thay/Co vui long chay LAY_MA_MAY.bat de lay ma may gui cho Tac gia,
    echo   sau do chay KICH_HOAT_BAN_QUYEN.bat de kich hoat su dung.
    echo ====================================================================
    echo.
    pause
    exit /b 1
) else (
    echo [OK] Ban quyen hop le!
)

echo.
echo ====================================================================
echo   CHUC MUNG: CAI DAT MOI TRUONG THANH CONG 100%!
echo ====================================================================
echo.
echo [>] Buoc tiep theo:
echo     Thay/Co vui long nhap dup chuot vao file:
echo     "2_NAP_VAO_ANTIGRAVITY.bat"
echo     de nap tien ich vao Google Antigravity va su dung ngay lap tuc!
echo.
pause
