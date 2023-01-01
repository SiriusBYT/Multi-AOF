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

REM Checks if SSConfig is present, if not then the user did an oopsie. 
IF NOT EXIST "%cd%\server-setup-config.yaml" (
	ECHO [Multi-AOF] server-setup-config.yaml is missing ! Cannot continue the script !
   echo [Multi-AOF] Please put your modpack's YAML into %cd% and relaunch the script.
   pause
   exit
) 

REM Checks if SS is present, if not then the script's first phase is triggered, else the Instance will be made.
REM Warning will be issued if the ZIP File already exists.
IF NOT EXIST "%cd%\serverstarter-2.4.0.jar" (
	ECHO [Multi-AOF] Team AOF's ServerStarter Binary is missing ! Will be downloading it using their GitHub repository...
   echo >nul
   echo [Multi-AOF] Once serverstarter starts, you will need when prompted, to NOT agree to the Minecraft EULA.
   echo [Multi-AOF] Please close the program instead.
   echo [Multi-AOF] After that is done, please relaunch the Multi-AOF Script.
   echo >nul
   echo Press any key to proceed with the Download of ServerStarter.
   pause >nul
   echo [Multi-AOF] Now installing ServerStarter...
	%SYSTEMROOT%\SYSTEM32\bitsadmin.exe /rawreturn /nowrap /transfer starter /dynamic /download /priority foreground https://github.com/TeamAOF/ServerStarter/releases/download/v2.4.0/serverstarter-2.4.0.jar "%cd%\serverstarter-2.4.0.jar"
   java -jar serverstarter-2.4.0.jar
   GOTO MAIN
) ELSE (
   ECHO [Multi-AOF] Team AOF's ServerStarter Binary is present.
   echo [Multi-AOF] Due to issues with Powershell's "Compress-Archive", the module "7Zip4Powershell" needs to be installed.
   echo [Multi-AOF] It will be uninstalled during cleanup.
   echo If you're okay with this script installing this module, then press any key to continue.
   echo >nul
   echo [Multi-AOF] Please type the Instance's name, leaving it blank will default to "Multi-AOF".
   set "InstanceName="
   set /P InstanceName=
   if not defined var set "InstanceName=Multi-AOF"
   pause >nul
   IF EXIST "%cd%\%InstanceName%.zip" (
      echo [MultiMC] WARNING: %InstanceName%.zip already exists ! Proceeding will delete the old instance's zip file !
      echo Press any key to continue anyway.
      pause >nul
      del "%cd%\%InstanceName%.zip" /F
      echo [MultiMC] The old instance was deleted.
      echo >nul
   )
   GOTO MAIN
)

:MAIN 
REM Sets some variables to be used to make the ZIP file.
cd %cd%
set "DotMC=%cd%"
cd ..
set "MultInst=%cd%"
cd ..
set "ZipLoc=%cd%"

REM ECHOs the variables just to make sure and tells the user where the Instance ZIP File will be.
echo [Multi-AOF] The .minecraft folder is located at "%DotMC%"
echo [Multi-AOF] The MultiMC Instance folder is located at "%MultInst%"
echo [Multi-AOF] The Instance ZIP File will be located at %ZipLoc%\%InstanceName%.zip

echo [Multi-AOF] Installing "7Zip4Powershell" Powershell Module...
powershell "Install-Module -Name 7Zip4PowerShell -Verbose -Scope CurrentUser"

echo [Multi-AOF] Now cleaning up Files... (Removing Server Files)
cd %DotMC%
del .fabric /F /Q
echo [Multi-AOF] Deleted .fabric Folder
del libraries /F /Q
echo [Multi-AOF] Deleted libraries Folder
del versions /F /Q
echo [Multi-AOF] Deleted versions Folder
del fabricloader.log /F /Q
echo [Multi-AOF] Deleted fabricloader.log File
del fabric-server-launch.jar /F /Q
echo [Multi-AOF] Deleted fabric-server-launch.jar File
del fabric-server-launcher.properties /F /Q
echo [Multi-AOF] Deleted fabric-server-launcher.properties File
del Insert-SSConfig_Here.yaml /F /Q
echo [Multi-AOF] Deleted Insert-SSConfig_Here.yaml File
del manifest.json /F /Q
echo [Multi-AOF] Deleted manifest.json File
del modpack-download.zip /F /Q
echo [Multi-AOF] Deleted modpack-download.zip File
del server.jar /F /Q
echo [Multi-AOF] Deleted server.jar File
del serverstarter.lock /F /Q
echo [Multi-AOF] Deleted serverstarter.lock File
del serverstarter.log /F /Q
echo [Multi-AOF] Deleted serverstarter.log File
del server-setup-config.yaml /F /Q
echo [Multi-AOF] Deleted server-setup-config.yaml File

cd ..
del LICENSE.md /F /Q
echo [Multi-AOF] Deleted LICENSE.md File
del README.md /F /Q
echo [Multi-AOF] Deleted README.md File

echo [Multi-AOF] Creating a MultiMC ZIP Instance using Powershell...
cd ..
powershell "Compress-7zip -Path '%MultInst%' -ArchiveFilename '%InstanceName%.zip' -Format Zip"
echo [Multi-AOF] Uninstalling the module "7Zip4Powershell"
powershell "Uninstall-Module -Name 7Zip4PowerShell"
GOTO EOF

:EOF
echo >nul
echo [Multi-AOF] Operation Complete. Drag and drop the Multi-AOF.zip file located in %ZipLoc% to your MultiMC Window !
echo [Multi-AOF] Warning: By default, Multi-AOF comes with an Instance that identifies as 1.19.2 - 0.14.11 Fabric.
echo [Multi-AOF] If this doesn't match your modpack version, please edit it in "Version" under "Edit Instance".
start explorer.exe "%ZipLoc%"
pause