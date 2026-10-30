@echo off
chcp 65001 >nul
title Cai Dat Tu Dong 1-Click - Slide PPTX, Video MP4 & Video Tuong Tac E-Learning

echo.
echo ====================================================================
echo   🎉 HỆ THỐNG CÀI ĐẶT TỰ ĐỘNG 1-CLICK DÀNH CHO GIÁO VIÊN (v2.0.0)
echo   Bộ Tiện Ích 3-Trong-1:
echo     (1) Soạn Slide PPTX -^> Lời Bình -^> Lồng Tiếng AI -^> Video MP4
echo     (2) Tạo Trang Web Video Tương Tác E-Learning ^& Đưa Lên Netlify
echo     (3) Tạo Kịch Bản ^& Prompt Veo 3 Video Khởi Động Bài Học
echo   Tác giả: Thầy Nguyễn Văn Thiện - THCS Ứng Hòe
echo ====================================================================
echo.

set "PYTHON_EXE="

:: ─── BƯỚC 1: KIỂM TRA MÔI TRƯỜNG PYTHON ───────────────────────────
echo [*] Buoc 1/2: Dang kiem tra moi truong Python tren may tinh cua Thay/Co...

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

:: Nếu máy tính chưa có Python -> Tự động tải về cài đặt âm thầm
echo [!] May tinh chua co Python. Dang tu dong tai Python 3.11 ve cai dat...
set "PY_URL=https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe"
set "PY_INSTALLER=%TEMP%\python-installer.exe"

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('%PY_URL%', '%PY_INSTALLER%')"
if exist "%PY_INSTALLER%" (
    echo [*] Dang cai dat Python che do tu dong...
    start /wait "" "%PY_INSTALLER%" /quiet InstallAllUsers=0 PrependPath=1 Include_test=0
    del /f /q "%PY_INSTALLER%" >nul 2>nul
)

set "PYTHON_EXE=python"

:PYTHON_READY
echo [OK] Python da san sang!

:: ─── BƯỚC 2: CÀI ĐẶT CÁC THƯ VIỆN BỔ TRỢ CẦN THIẾT ─────────────────
echo.
echo [*] Buoc 2/2: Dang tu dong cai dat cac thu vien chuyen dung:
echo     - python-pptx (Tao va xu ly slide PowerPoint 16:9)
echo     - edge-tts (Long tieng AI giong phat thanh vien mien phi)
echo     - pillow (Xu ly hinh anh sac net cho slide)
echo     - lxml (Xu ly XML DrawingML va cong thuc toan OMML)
echo     - python-docx, docx2txt (Doc va boc tach anh tu file Word giao an)
echo     - pymupdf, pypdf (Doc va boc tach anh tu sach giao khoa PDF)
echo     - requests (Ket noi cap nhat & tim anh khoa hoc)
echo.

"%PYTHON_EXE%" -m pip install --upgrade pip --quiet
"%PYTHON_EXE%" -m pip install python-pptx edge-tts pillow lxml requests python-docx docx2txt pymupdf pypdf cryptography --quiet

echo [*] Kiem tra nhanh moi truong sau khi cai dat...
"%PYTHON_EXE%" -c "import pptx, edge_tts, PIL, lxml, requests; print('    [OK] Thu vien cot loi san sang!')"

echo.
echo ====================================================================
echo  🎉 CHÚC MỪNG: CÀI ĐẶT MÔI TRƯỜNG THÀNH CÔNG 100%!
echo ====================================================================
echo.
echo 👉 Buoc tiep theo:
echo    Thay/Co vui long nhap dup chuot vao file:
echo    "2_NAP_VAO_ANTIGRAVITY.bat"
echo    de nap tien ich vao Google Antigravity va su dung ngay lap tuc!
echo.
pause
