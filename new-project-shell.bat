@echo off
chcp 65001 >nul
title Create New IT Project
cd /d "%~dp0"

echo.
echo Starting project creation wizard...
echo.

powershell -ExecutionPolicy Bypass -NoExit -File "new-project-script.ps1"

echo.
echo Press any key to close this window...
pause >nul
