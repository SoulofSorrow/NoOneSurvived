@echo off
set "GameServerPath=C:\gameserver\noonesurvivedserver\WRSHServer.exe"
set "GameExe=WRSHServer.exe"
set "ServerOptions=-server -log -Port=8484 -QueryPort=45515"
set "RestartDelay=10"  REM Delay before restarting in seconds (Adjust as needed)

:start_server
echo Starting No One Survived Server...
start "" "%GameServerPath%" %ServerOptions%

REM Monitor the process in a loop
:monitor
timeout /t %RestartDelay% /nobreak
tasklist | find /i "%GameExe%" > nul

if errorlevel 1 (
    echo.
    echo The server process has been terminated.
    echo Restarting the server...
    goto start_server
) else (
    goto monitor
)

exit
