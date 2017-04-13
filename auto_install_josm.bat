:: Set environment vars
set var=%PROCESSOR_ARCHITECTURE%
set a64="jre-8u111-windows-x64.exe"
set x86="jre-8u111-windows-i586.exe"

echo %APPDATA%
:: Copy files to desktop
md "%USERPROFILE%\Desktop\project_noah"
copy /b/v/y "josm-setup.exe" "%USERPROFILE%\Desktop\project_noah\josm-setup.exe"
xcopy Plugins "%USERPROFILE%\Desktop\project_noah\Plugins" /i /y

echo %var%
if %var% == AMD64 (copy /b/v/y %a64% "%USERPROFILE%\Desktop\project_noah\%a64%") else (copy /b/v/y %x86% "%USERPROFILE%\Desktop\project_noah\%x86%")

@echo off
cd /d "%USERPROFILE%\Desktop\project_noah"

start "" /w /b "josm-setup.exe"
xcopy Plugins "%APPDATA%\JOSM\plugins" /i /y

if %var% == AMD64 (start "" /w /b %a64%) else (start "" /w /b %x64%)

pause