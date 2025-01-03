cd "c:\Delphi\Delphi 11\CatalogRepository\AndroidSDK-2525-22.0.48361.3236\cmdline-tools\latest\bin\"
prompt $g
echo off
cls
echo Checks the Java version and Java_Home env var.
echo Updates the SDK
echo.

echo JAVA_HOME VAR IS SET TO:
echo         %JAVA_HOME%
echo _____________________________
echo.
echo.


java -version
echo.
echo.
echo.


echo LIST
call  sdkmanager.bat --list
echo.
echo.
echo.
pause

echo UPDATE
call sdkmanager.bat --update
echo.
echo.
echo.
pause

echo INSTALL PLATFORMS
call sdkmanager.bat --install "platforms;android-32"
echo.
echo.
echo.
pause

echo INSTALL BILDS
call sdkmanager.bat --install "build-tools;32.0.0"
echo.
echo.
echo.
echo DONE
pause

