@echo off

Powershell.exe -ExecutionPolicy Unrestricted -command "%~dp0wsl2_network_reconfigure.ps1"

timeout /t 3 >nul