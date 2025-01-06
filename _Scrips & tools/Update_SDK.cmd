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


echo LIST
call  sdkmanager.bat --list --verbose
echo.
echo.
echo.
pause

echo UPDATE
call sdkmanager.bat --update --verbose
echo.
echo.
echo.
pause

echo INSTALL PLATFORMS 1
call sdkmanager.bat --verbose --install "platforms;android-32"

echo INSTALL PLATFORMS 2 (in case the first one fails)
call sdkmanager.bat "platform-tools" "platforms;android-32"
echo.
echo.
echo.
pause


echo INSTALL BILDS
call sdkmanager.bat --verbose --install "build-tools;32.0.0"
echo.
echo.
echo.
echo DONE
pause

