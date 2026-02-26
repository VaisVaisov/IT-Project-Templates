@echo off
chcp 65001 >nul
title Create New IT Project

powershell -ExecutionPolicy Bypass -File "%~dp0new-project-script.ps1" %*
