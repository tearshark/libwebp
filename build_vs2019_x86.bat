@echo off

set VSToolset=142
set PlatformName=x86

mkdir build
cd build

REM require cmake-3.16.1
cmake -G "Visual Studio 16 2019" -A Win32 -S ..\ -B .\
cmake --build .\ --config Release
cmake --build .\ --config Debug

cd ..

set DIR=%~dp0
set LIB=%DIR%lib\vs%VSToolset%\

mkdir %LIB%Debug.%PlatformName%
mkdir %LIB%Release.%PlatformName%

echo Copy to lib
xcopy /S /Q /Y %DIR%build\Debug\*.* %LIB%Debug.%PlatformName%
xcopy /S /Q /Y %DIR%build\Release\*.* %LIB%Release.%PlatformName%

echo Clean build directory
rmdir /S /Q %DIR%build

