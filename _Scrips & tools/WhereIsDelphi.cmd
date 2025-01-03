@prompt $
@echo off
@REM Sets the DelphiPath variable to the correct disk path based on the Delphi "name" passed as parameter
@REM Call it like this:  CALL WhereIsDelphi.cmd Alex

setlocal

rem DelphiVersion is provided via command line
set DelphiVersion=%1

rem Support for Windows 64 Bit
	set ProgFiles=%ProgramFiles(x86)%
	if not "%ProgFiles%"=="" goto Win64Bit
	set ProgFiles=%ProgramFiles%
:Win64Bit

set DelphiPath=

rem This is equivalent to a case/switch statement
rem Call :Delphi%DelphiVersion% resolves into call :Delphi6 etc.
call :Delphi%DelphiVersion%
goto EndDelphiDetection

	:Delphi6
	  call :ReadReg Borland\Delphi\6.0
	  goto :eof
	  
	:Delphi7
	  call :ReadReg Borland\Delphi\7.0
	  goto :eof
	  
	:Delphi2005
	  call :ReadReg Borland\BDS\3.0
	  goto :eof
	  
	:Delphi2006
	  call :ReadReg Borland\BDS\4.0
	  goto :eof
	  
	:Delphi2007
	  call :ReadReg Borland\BDS\5.0
	  goto :eof
	  
	:Delphi2009
	  call :ReadReg CodeGear\BDS\6.0
	  goto :eof
	  
	:Delphi2010
	  call :ReadReg CodeGear\BDS\7.0
	  goto :eof
	  
	:DelphiXE
	  call :ReadReg Embarcadero\BDS\8.0
	  goto :eof
	  
	:DelphiXE2
	  call :ReadReg Embarcadero\BDS\9.0
	  goto :eof
	  
	:DelphiXE3
	  call :ReadReg Embarcadero\BDS\10.0
	  goto :eof
	  
	:DelphiXE4
	  call :ReadReg Embarcadero\BDS\11.0
	  goto :eof
	  
	:DelphiXE5
	  call :ReadReg Embarcadero\BDS\12.0
	  goto :eof
	  
	:DelphiXE6
	  call :ReadReg Embarcadero\BDS\14.0
	  goto :eof
	  
	:DelphiXE7
	  call :ReadReg Embarcadero\BDS\15.0
	  goto :eof	  
	  
	:DelphiSydney
	  call :ReadReg Embarcadero\BDS\21.0
	  goto :eof
		
	:DelphiAlex
	  call :ReadReg Embarcadero\BDS\22.0
	  goto :eof
	  
	:Delphi12
	  call :ReadReg Embarcadero\BDS\23.0
	  goto :eof
	  
	:Delphi13
	  call :ReadReg Embarcadero\BDS\24.0
	  goto :eof	  
  
:EndDelphiDetection



if exist "%DelphiPath%" goto StatusOK
echo *** Error: Directory "%DelphiPath%" does not exist!***
pause
goto :eof

:StatusOK
endlocal & set DelphiPath=%DelphiPath%
echo DelphiPath: "%DelphiPath%"
goto :eof

:ReadReg
rem Read the registry entry
set DelphiPath=
FOR /F "usebackq skip=2 tokens=3,*" %%A IN (`REG QUERY HKCU\Software\%1 /v RootDir 2^>nul`) DO (
  set DelphiPath=%%A %%B
)
rem Remove one trailing space which might have been added because %%B was empty
rem Remove any quotes
set DelphiPath=%DelphiPath:"=%

rem Add quotes
set DelphiPath="%DelphiPath%"

rem Remove space before the closing quote
set DelphiPath=%DelphiPath: "="%

rem Remove any quotes
set DelphiPath=%DelphiPath:"=%

goto :eof