@echo off
chcp 65001 >nul
title Cap Nhat Tinh Nang Moi Tu GitHub - Slide PPTX & Video Tuong Tac

echo.
echo ====================================================================
echo   🔄 CẬP NHẬT TÍNH NĂNG MỚI NHẤT TỪ GITHUB (1-CLICK)
echo   Tiện ích: Slide PPTX, Lời Bình, Video MP4 ^& Video Tương Tác
echo ====================================================================
echo.

set "PYTHON_EXE=python"
py -c "import sys" >nul 2>nul
if not errorlevel 1 set "PYTHON_EXE=py"

"%PYTHON_EXE%" "%~dp0scripts\updater.py"

echo.
pause
