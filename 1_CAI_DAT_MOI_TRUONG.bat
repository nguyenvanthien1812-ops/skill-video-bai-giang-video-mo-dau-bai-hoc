@echo off
chcp 65001 >nul
title Cai Dat Tu Dong 1-Click - Slide PPTX, Video MP4 & Video Tuong Tac E-Learning

echo.
echo ====================================================================
echo   🎉 HỆ THỐNG CÀI ĐẶT TỰ ĐỘNG 1-CLICK DÀNH CHO GIÁO VIÊN (v2.0.1)
echo   Bộ Tiện Ích 3-Trong-1:
echo     (1) Soạn Slide PPTX -^> Lời Bình -^> Lồng Tiếng AI -^> Video MP4
echo     (2) Tạo Trang Web Video Tương Tác E-Learning ^& Đưa Lên Netlify
echo     (3) Tạo Kịch Bản ^& Prompt Veo 3 Video Khởi Động Bài Học
echo   Tác giả: Thầy Nguyễn Văn Thiện - THCS Ứng Hòe
echo ====================================================================
echo.

set "PYTHON_EXE="

:: ─── BƯỚC 1: KIỂM TRA MÔI TRƯỜNG PYTHON ───────────────────────────
echo [*] Buoc 1/3: Dang kiem tra moi truong Python tren may tinh cua Thay/Co...

py -c "import sys" >nul 2>nul
if not errorlevel 1 (
    set "PYTHON_EXE=py"
    goto :PYTHON_READY
)

python -c "import sys" >nul 2>nul
if not errorlevel 1 (
    set "PYTHON_EXE=python"
    goto :PYTHON_READY
)

for /d %%D in ("%LOCALAPPDATA%\Programs\Python\Python3*") do (
    if exist "%%D\python.exe" (
        "%%D\python.exe" -c "import sys" >nul 2>nul
        if not errorlevel 1 (
            set "PYTHON_EXE=%%D\python.exe"
            set "PATH=%%D;%%D\Scripts;%PATH%"
            goto :PYTHON_READY
        )
    )
)

for /d %%D in ("C:\Program Files\Python3*") do (
    if exist "%%D\python.exe" (
        "%%D\python.exe" -c "import sys" >nul 2>nul
        if not errorlevel 1 (
            set "PYTHON_EXE=%%D\python.exe"
            set "PATH=%%D;%%D\Scripts;%PATH%"
            goto :PYTHON_READY
        )
    )
)

for /d %%D in ("C:\Python3*") do (
    if exist "%%D\python.exe" (
        "%%D\python.exe" -c "import sys" >nul 2>nul
        if not errorlevel 1 (
            set "PYTHON_EXE=%%D\python.exe"
            set "PATH=%%D;%%D\Scripts;%PATH%"
            goto :PYTHON_READY
        )
    )
)

:: Nếu máy tính chưa có Python -> Tự động tải về cài đặt ngầm
echo [!] May tinh chua co Python. Dang tu dong tai Python 3.12 ve cai dat...
set "PY_URL=https://www.python.org/ftp/python/3.12.6/python-3.12.6-amd64.exe"
set "PY_INSTALLER=%TEMP%\python_installer_auto.exe"

if exist "%SystemRoot%\System32\curl.exe" (
    curl.exe -L -o "%PY_INSTALLER%" "%PY_URL%"
) else (
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%PY_URL%', '%PY_INSTALLER%')"
)

if not exist "%PY_INSTALLER%" (
    echo [X] Khong the tai Python tu dong! Vui long kiem tra ket noi mang Internet.
    pause
    exit /b 1
)

echo [*] Dang cai dat Python che do tu dong (vui long cho 30-60 giay)...
start /wait "" "%PY_INSTALLER%" /quiet InstallAllUsers=0 PrependPath=1 Include_test=0 Include_pip=1 SimpleInstall=1
del /f /q "%PY_INSTALLER%" >nul 2>nul

for /d %%D in ("%LOCALAPPDATA%\Programs\Python\Python3*") do (
    if exist "%%D\python.exe" (
        set "PYTHON_EXE=%%D\python.exe"
        set "PATH=%%D;%%D\Scripts;%PATH%"
        goto :PYTHON_READY
    )
)
py -c "import sys" >nul 2>nul && set "PYTHON_EXE=py"
if "%PYTHON_EXE%"=="" python -c "import sys" >nul 2>nul && set "PYTHON_EXE=python"

if "%PYTHON_EXE%"=="" (
    echo [!] Da cai Python xong nhung can mo lai cua so. Vui long nhap dup lai file nay!
    pause
    exit /b 1
)

:PYTHON_READY
echo [OK] Python da san sang: %PYTHON_EXE%
"%PYTHON_EXE%" -c "import sys; print('     Phien ban Python:', sys.version.split()[0])"

:: ─── BƯỚC 2: CÀI ĐẶT ĐẦY ĐỦ 100% THƯ VIỆN CHO GIÁO VIÊN ───────────
echo.
echo [*] Buoc 2/3: Dang tu dong cai dat tron bo thu vien chuyen dung:
echo     - python-pptx, lxml, latex2mathml (Tao slide PowerPoint 16:9 ^& cong thuc Toan OMML)
echo     - edge-tts, mutagen (Long tieng AI Co Hoai My/Thay Nam Minh ^& do chuan moc giay MP3)
echo     - pillow, matplotlib, numpy (Xu ly anh sac net ^& ve do thi/hinh hoc 300 DPI)
echo     - python-docx, docx2txt, pymupdf, pypdf, openpyxl (Doc Giao an Word, SGK PDF ^& Excel)
echo     - requests, certifi, cryptography (Ket noi Internet ^& cap nhat tu dong tu GitHub)
echo.

"%PYTHON_EXE%" -m pip install --upgrade pip --quiet --no-warn-script-location
"%PYTHON_EXE%" -m pip install python-pptx edge-tts mutagen pillow lxml latex2mathml matplotlib numpy python-docx docx2txt pymupdf pypdf openpyxl requests certifi cryptography --no-warn-script-location

echo.
echo [*] Kiem tra toan ven cac thu vien cot loi...
"%PYTHON_EXE%" -c "import pptx, edge_tts, mutagen, PIL, lxml, latex2mathml, matplotlib, docx, fitz, pypdf, openpyxl, requests; print('    [OK] 100%% thu vien da san sang hoat dong!')"

:: ─── BƯỚC 3: TỰ ĐỘNG NẠP LUÔN VÀO GOOGLE ANTIGRAVITY ──────────────
echo.
echo [*] Buoc 3/3: Tu dong nap tien ich vao Google Antigravity...
"%PYTHON_EXE%" -c "import sys; sys.path.insert(0, r'%~dp0scripts'); from updater import sync_to_antigravity_global; sync_to_antigravity_global(r'%~dp0'); print('    [OK] Da nap tien ich vao Google Antigravity!')" 2>nul

echo.
echo ====================================================================
echo  🎉 CHÚC MỪNG: CÀI ĐẶT MÔI TRƯỜNG ^& NẠP TIỆN ÍCH THÀNH CÔNG 100%!
echo ====================================================================
echo.
echo 👉 Thay/Co co the mo ngay Google Antigravity va go lenh su dung
echo    (hoac nhap dup "2_NAP_VAO_ANTIGRAVITY.bat" bat cu khi nao can dong bo lai).
echo.
pause
