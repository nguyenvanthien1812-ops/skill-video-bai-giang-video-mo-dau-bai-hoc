@echo off
chcp 65001 >nul
title Lay Ma May - Slide & Video Khoi Dong
echo.
python "%~dp0scripts\license_manager.py" --machine-id
if errorlevel 1 (
    py "%~dp0scripts\license_manager.py" --machine-id
)
echo.
pause
