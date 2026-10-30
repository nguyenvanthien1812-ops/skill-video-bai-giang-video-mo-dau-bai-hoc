@echo off
chcp 65001 >nul
title Day Bo Skill Slide PPTX & Video Tuong Tac Len GitHub Moi (1-Click)

echo.
echo ====================================================================
echo   🚀 LIÊN KẾT ^& ĐẨY BỘ SKILL ĐỘC LẬP LÊN GITHUB MỚI (1-CLICK)
echo   Dành cho Tác giả khi tạo Repository GitHub mới
echo ====================================================================
echo.

set "PYTHON_EXE=python"
py -c "import sys" >nul 2>nul
if not errorlevel 1 set "PYTHON_EXE=py"

"%PYTHON_EXE%" "%~dp0scripts\link_new_github.py"

echo.
pause
