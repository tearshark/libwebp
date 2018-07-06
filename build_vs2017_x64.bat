@echo off

mkdir build
cd build

cmake -G "Visual Studio 15 2017 Win64" -B ..\
cmake --build .\ --config Release
cmake --build .\ --config Debug

cd ..

set VSToolset=141
set PlatformName=x64

set DIR=%~dp0
set LIB=%DIR%lib\vs%VSToolset%\

mkdir %LIB%Debug.%PlatformName%
mkdir %LIB%Release.%PlatformName%

echo Copy to lib
xcopy /S /Q /Y %DIR%build\Debug\*.* %LIB%Debug.%PlatformName%
xcopy /S /Q /Y %DIR%build\Release\*.* %LIB%Release.%PlatformName%

echo Clean build directory
rmdir /S /Q %DIR%build

