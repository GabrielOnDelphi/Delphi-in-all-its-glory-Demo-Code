
Echo Take the packages out from "Disabled" 
SET REG_IDE_VERSION=22.0
SET DisabledKey=HKEY_CURRENT_USER\Software\Embarcadero\BDS\%REG_IDE_VERSION%\Disabled Packages

Rem Which package?
SET BPLPATH=c:\MyProjects\MyLibraries\LightSaber.bpl

Rem Delete
REG delete "%DisabledKey%" /v "%BplPath%" /f 
