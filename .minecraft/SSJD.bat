@echo off
SETLOCAL
mode con: cols=80 lines=80
:BEGIN
CLS
COLOR 3F >nul 2>&1
SET MC_SYS32=%SYSTEMROOT%\SYSTEM32
REM Make batch directory the same as the directory it's being called from
REM For example, if "run as admin" the batch starting dir could be system32
CD "%~dp0" >nul 2>&1

echo Multi-AOF 1.2 - ServerStarter Script
echo.
echo - [Automatic] Download the Base Modpack. <-
echo - [Manual] Close SSJD when prompted to agree to Minecraft's EULA.
echo.
java -jar serverstarter-2.4.0.jar
exit