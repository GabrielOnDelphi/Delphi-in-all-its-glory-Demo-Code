@prompt $
@echo off
echo ---------------------------------------
echo Installing BPLs into the IDE
echo ---------------------------------------
echo.

SET REG_IDE_VERSION=22.0
echo Detect Delphi installation folder
CALL whereIsDelphi.cmd Alex
CALL "%DelphiPath%\bin\rsvars.bat"
echo.

call CleanDisabledPkg.cmd

rem Set the key where we should install the packages
SET BPLREG=HKEY_CURRENT_USER\Software\Embarcadero\BDS\%REG_IDE_VERSION%\Known Packages

rem Which package?
SET BPLPATH=c:\MyProjects\MyLibraries
SET PackageBplName=LightSaber.bpl

ECHO   Package to be installed to %BPLREG% 
ECHO   Package file is: %BPLPATH%\%PackageBplName%

rem Delete that package first, to prevent duplication
rem The delete operation will fail if the package is not already installed. This is normal. We don't show this to the user, therefore we output the messages to the nul console
REG delete "%BPLREG%" /v "%BPLPATH%\%PackageBplName%" /f >nul 2>&1 
REG add    "%BPLREG%" /v "%BPLPATH%\%PackageBplName%" /t REG_SZ /d "TeeChart Standard 2018 Designtime" 
echo.

call UpdateEnvironment.cmd