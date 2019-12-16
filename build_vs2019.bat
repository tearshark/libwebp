@echo off

call build_vs2019_x64.bat
call build_vs2019_x86.bat

if not exist %~dp0include mkdir %~dp0include
xcopy /Q /Y %~dp0src\webp\*.* %~dp0include
