@ECHO OFF
SETLOCAL

:BEGIN
CLS
COLOR 3F >nul 2>&1
SET MC_SYS32=%SYSTEMROOT%\SYSTEM32
REM Make batch directory the same as the directory it's being called from
REM For example, if "run as admin" the batch starting dir could be system32
CD "%~dp0" >nul 2>&1

:CHECK
REM Check if serverstarter JAR is already downloaded
IF NOT EXIST "%cd%\serverstarter-2.4.0.jar" (
	ECHO [Multi-AOF] Team AOF's ServerStarter Binary is missing ! Downloading it from their GitHub repository...
	%SYSTEMROOT%\SYSTEM32\bitsadmin.exe /rawreturn /nowrap /transfer starter /dynamic /download /priority foreground https://github.com/TeamAOF/ServerStarter/releases/download/v2.4.0/serverstarter-2.4.0.jar "%cd%\serverstarter-2.4.0.jar"
   GOTO MAIN
) ELSE (
   ECHO [Multi-AOF] Team AOF's ServerStarter Binary is present, updating modpack !
   GOTO MAIN
)

:MAIN 
cd %cd%
set "DotMC=%cd%"
java -jar serverstarter-2.4.0.jar
cd ..
set "MultInst=%cd%"
echo [Multi-AOF] The .minecraft folder is located at "%DotMC%"
echo [Multi-AOF] The MultiMC Instance folder is located at "%MultInst%"
echo [Multi-AOF] Creating a MultiMC ZIP Instance using Powershell...
powershell "Compress-Archive '%MultInst%\*' '%DotMC%\Multi-AOF.zip'"
GOTO EOF

:EOF
echo [Multi-AOF] Operation Complete. Drag and drop the Multi-AOF.zip file located in %MultInst% to your MultiMC Window !
start explorer.exe "%DotMC%"
pause