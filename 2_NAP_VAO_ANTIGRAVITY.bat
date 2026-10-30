@echo off
chcp 65001 >nul
title NAP BO TIEN ICH 3-TRONG-1 SLIDE PPTX, VIDEO MP4 & VIDEO TUONG TAC VAO ANTIGRAVITY

echo.
echo ====================================================================
echo   🎉 TỰ ĐỘNG NẠP BỘ TIỆN ÍCH 3-TRONG-1 VÀO GOOGLE ANTIGRAVITY (v2.0.0)
echo   Tiện ích: Slide PPTX -^> Lời Bình ^& Video MP4 -^> Video Tương Tác
echo   Tác giả: Thầy Nguyễn Văn Thiện - THCS Ứng Hòe
echo ====================================================================
echo.

set "TARGET_DIR_1=%USERPROFILE%\.gemini\config\skills\tao-slide-va-video-khoi-dong"
set "TARGET_DIR_2=%USERPROFILE%\.gemini\antigravity\skills\tao-slide-va-video-khoi-dong"

echo [*] Dang tao thu muc tien ich tren may tinh cua Thay/Co...
if not exist "%TARGET_DIR_1%" mkdir "%TARGET_DIR_1%"
if not exist "%TARGET_DIR_2%" mkdir "%TARGET_DIR_2%"

echo [*] Dang sao chep toan bo file tien ich vao Google Antigravity...
set "PYTHON_EXE=python"
py -c "import sys" >nul 2>nul
if not errorlevel 1 set "PYTHON_EXE=py"

"%PYTHON_EXE%" -c "import sys; sys.path.insert(0, r'%~dp0scripts'); from updater import sync_to_antigravity_global; sync_to_antigravity_global(r'%~dp0')" 2>nul
if errorlevel 1 (
    xcopy "%~dp0*" "%TARGET_DIR_1%\" /E /I /Y /Q >nul
    xcopy "%~dp0*" "%TARGET_DIR_2%\" /E /I /Y /Q >nul
)

echo.
echo ====================================================================
echo   🎉 [HOÀN TẤT] ĐÃ NẠP TIỆN ÍCH VÀO ANTIGRAVITY THÀNH CÔNG 100%!
echo.
echo   Bây giờ Thầy/Cô mở Google Antigravity lên và nhắn tin thử ngay:
echo.
echo   👉 1. SOẠN SLIDE PPTX, VIẾT LỜI BÌNH ^& XUẤT VIDEO MP4:
echo      "Soạn bài giảng PPTX từ file giáo án này giúp tôi..."
echo      "Viết lời bình và xuất video MP4 từ file PPTX này..."
echo.
echo   👉 2. TẠO WEB VIDEO TƯƠNG TÁC E-LEARNING ^& ĐỔI MẬT KHẨU THẦY CÔ:
echo      "Tôi muốn tạo video tương tác"
echo      "Làm video tương tác từ giáo án word / sách giáo khoa"
echo      "Tôi muốn thay đổi mật khẩu chế độ thầy cô"
echo.
echo   👉 3. TẠO VIDEO KHỞI ĐỘNG BÀI HỌC VỚI VEO 3:
echo      "Tôi muốn tạo kịch bản video mở đầu bài học"
echo ====================================================================
echo.
pause
