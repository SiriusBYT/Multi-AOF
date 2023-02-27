@ECHO OFF
SETLOCAL
mode con: cols=320 lines=80

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
   echo Multi-AOF 1.2 - Setup Script
   echo.
   echo Welcome to Multi-AOF ! This is a batch script that will download a modpack and inject extra mods, ressources and shader packs to then create a Multi-MC Instance.
   echo However it seems that "server-setup-config.yaml" is missing in %cd%.
   echo Please add that file in order for the Script to be able to execute.
   echo.
   echo Press any key to exit the program.
   pause >nul
   exit
) 

REM Sets some variables to be used to make the ZIP file.
cd %cd%
set "DotMC=%cd%"
cd ..
set "MultInst=%cd%"
cd ..
set "ZipLoc=%cd%"
cd %DotMC%

echo Multi-AOF 1.2 - Setup Script
echo.
echo Welcome to Multi-AOF ! This is a batch script that will download a modpack and inject extra mods, ressources and shader packs to then create a Multi-MC Instance.
echo Before starting, please note that the following steps will be done:
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name.
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
echo If this seems entirely fine to you then feel free to press any key to start the Script !
pause >nul

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub. ^<--
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name.
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.

IF NOT EXIST "%cd%\serverstarter-2.4.0.jar" (
	%SYSTEMROOT%\SYSTEM32\bitsadmin.exe /rawreturn /nowrap /transfer starter /dynamic /download /priority foreground https://github.com/TeamAOF/ServerStarter/releases/download/v2.4.0/serverstarter-2.4.0.jar "%cd%\serverstarter-2.4.0.jar"
)
CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub. 
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter. ^<--
echo - [Manual] Set the Multi-MC Instance Name.
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
start SSJD.bat

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name. ^<--
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
echo [Multi-AOF] Please type the Instance's name, leaving it blank will default to "Multi-AOF".
set InstanceName=Multi-AOF
set /P InstanceName=

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name. (%InstanceName%)
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations. ^<--
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
powershell "Install-Module -Name 7Zip4PowerShell -Verbose -Scope CurrentUser"

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name. (%InstanceName%)
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA. ^<--
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
echo [Multi-AOF] Press any key ONLY after closing ServerStarter IF AND ONLY the other Terminal Window asks you to agree to Minecraft's EULA.
pause >nul

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name. (%InstanceName%)
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders. ^<--
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
cd %DotMC%
mkdir mods
move Extra-Mods\*.* mods\ 
mkdir resourcepacks
move Extra-Resource_Packs\*.* resourcepacks\
mkdir shaderpacks
move Extra-Shader_Packs\*.* shaderpacks\

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name. (%InstanceName%)
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files. ^<--
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
del .fabric /F /Q
del libraries /F /Q
del versions /F /Q
del log /F /Q
del fabricloader.log /F /Q
del fabric-server-launch.jar /F /Q
del fabric-server-launcher.properties /F /Q
del Insert-SSConfig_Here.yaml /F /Q
del manifest.json /F /Q
del modpack-download.zip /F /Q
del server.jar /F /Q
del serverstarter.lock /F /Q
del server-setup-config.yaml /F /Q
del server-setup-config.yaml /F /Q
del serverstarter-2.4.0.jar /F /Q
del SSJD.bat /F /Q
cd ..
del LICENSE.md /F /Q
del README.md /F /Q

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name. (%InstanceName%)
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC ^<--
echo - [Automatic] Uninstall "7Zip4Powershell"
echo.
powershell "Compress-7zip -Path '%MultInst%' -ArchiveFilename '%InstanceName%.zip' -Format Zip"

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo Excecuting Script...
echo - [Automatic] Download ServerStarter 2.4.0 from TeamAOF's GitHub.
echo - [Automatic] Launch another terminal that downloads the base modpack using ServerStarter.
echo - [Manual] Set the Multi-MC Instance Name. (%InstanceName%)
echo - [Semi-Automatic] Allow if asked to download dependencies and to trust "7Zip4Powershell" to be downloaded due to insecure repository limitations.
echo - [Manual] Close ServerStarter to be able to continue the script when asked to agree to Mojang's EULA.
echo - [Automatic] Inserts Extra Mods, Ressources and then Shader Packs into their respective folders.
echo - [Automatic] Delete Common Server Files.
echo - [Automatic] Create a .ZIP that's compatible with Multi-MC
echo - [Automatic] Uninstall "7Zip4Powershell" ^<--
echo.
powershell "Uninstall-Module -Name 7Zip4PowerShell"

CLS

echo Multi-AOF 1.2 - Setup Script
echo.
echo The script is now complete !
echo An explorer Window should open where %InstanceName%.zip is located, which you can drag and drop into Multi-MC ! 
echo Note that it may take a long while to show up and do not be afraid if Multi-MC freezes for some time.
echo.
echo Thank you for using Multi-AOF ! Press any key to close the Script.
start explorer.exe "%ZipLoc%"
pause >nul
exit