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
	ECHO [Multi-AOF] Team AOF's ServerStarter Binary is missing ! Will be downloading it using their GitHub repository...
   echo >nul
   echo [Multi-AOF] Looks like it's your first time running this tool then !
   echo [Multi-AOF] Please note due to my lack of programming knowledge I cannot currently modify "serverstarter" to make this process fully automatic.
   echo [Multi-AOF] So unfortuanely, once serverstarter starts, you will need when prompted, to NOT agree to the Minecraft EULA (instead close the program).
   echo [Multi-AOF] After that is done, please relaunch Multi-AOF.bat so that the MultiMC Instance can be created.
   echo >nul
   echo Press any key to proceed with the Download of ServerStarter.
   pause >nul
	%SYSTEMROOT%\SYSTEM32\bitsadmin.exe /rawreturn /nowrap /transfer starter /dynamic /download /priority foreground https://github.com/TeamAOF/ServerStarter/releases/download/v2.4.0/serverstarter-2.4.0.jar "%cd%\serverstarter-2.4.0.jar"
   java -jar serverstarter-2.4.0.jar
   GOTO MAIN
) ELSE (
   ECHO [Multi-AOF] Team AOF's ServerStarter Binary is present.
   IF EXIST "%cd%\Multi-AOF.zip" (
      echo [MultiMC] WARNING: Multi-AOF.zip already exists ! Proceeding will delete the old instance's zip file !
      echo Press any key to continue anyway.
      pause >nul
      del "%cd%\Multi-AOF.zip" /F
      echo [MultiMC] The old instance was deleted.
      echo >nul
   )
   GOTO MAIN
)

:MAIN 
cd %cd%
set "DotMC=%cd%"
cd ..
set "MultInst=%cd%"
echo [Multi-AOF] The .minecraft folder is located at "%DotMC%"
echo [Multi-AOF] The MultiMC Instance folder is located at "%MultInst%"
echo [Multi-AOF] Creating a MultiMC ZIP Instance using Powershell...
powershell "Compress-Archive '%MultInst%\*' '%DotMC%\Multi-AOF.zip'"
GOTO EOF

:EOF
echo >nul
echo [Multi-AOF] Operation Complete. Drag and drop the Multi-AOF.zip file located in %MultInst% to your MultiMC Window !
start explorer.exe "%DotMC%"
pause