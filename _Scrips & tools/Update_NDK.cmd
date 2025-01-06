rem cd "c:\Delphi\Delphi 11\CatalogRepository\AndroidSDK-2525-22.0.48361.3236\cmdline-tools\latest\bin\"
prompt $g
echo off
cls
echo.
echo.
echo This tool: 
echo  * Checks the Java version and Java_Home env var.
echo  * Updates the SDK
echo www.GabrielMoraru.com
echo More details in my new book "Delphi in all its gloty [Part 4]"
echo.
echo.

echo _____________________________
echo JAVA_HOME VAR IS SET TO:
echo         %JAVA_HOME%
echo _____________________________
echo.
echo.


java -version
echo.
echo.
echo.

call  sdkmanager.bat --list --verbose > List.txt
echo Open List.txt and choose the NDK you want to install. Replace its version in the command below.
pause

echo INSTALL NDK
echo This has 3-4GB so it will take a while...
call sdkmanager.bat --verbose --install "ndk;22.0.7026061"

echo.
echo.
echo.
pause

