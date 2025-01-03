echo ---------------------------------------------
echo Updating the environment
echo This forces Delphi to see the changes we have done to the registry
echo ---------------------------------------------

rem Force update enviroment
ECHO   Updating the IDE for Delphi %REG_IDE_VERSION% 
SET GlobalsREG=HKEY_CURRENT_USER\Software\Embarcadero\BDS\%REG_IDE_VERSION%\Globals

REG delete "%GlobalsREG%" /v "ForceEnvOptionsUpdate" /f >nul 2>&1
REG add    "%GlobalsREG%" /v "ForceEnvOptionsUpdate" /t REG_SZ /d "1" 
echo. 
