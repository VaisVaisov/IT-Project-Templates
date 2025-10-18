@echo off
chcp 65001 >nul
title Создание нового IT-проекта
cd /d "%~dp0"

echo.
echo 🚀 Запуск мастера создания проекта...
echo.

powershell -ExecutionPolicy Bypass -NoExit -File "new-project-script.ps1"

echo.
echo Нажмите любую клавишу, чтобы закрыть окно...
pause >nul
