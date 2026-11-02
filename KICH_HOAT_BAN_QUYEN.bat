@echo off
chcp 65001 >nul
title Kich Hoat Ban Quyen - Slide & Video Khoi Dong
echo.
python "%~dp0scripts\license_manager.py" --activate
if errorlevel 1 (
    py "%~dp0scripts\license_manager.py" --activate
)
echo.
pause
