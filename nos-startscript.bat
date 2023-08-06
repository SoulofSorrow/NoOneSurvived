@echo off
set "GameServerPath=C:\gameserver\noonesurvivedserver\WRSHServer.exe"
set "ServerOptions=-server -log -Port=8484 -QueryPort=45515"
set "RestartDelay=10"  REM Verzögerung vor dem erneuten Starten in Sekunden (Anpassen nach Bedarf)

:start_server
echo Starte No One Survived Server...
start "" "%GameServerPath%" %ServerOptions%

REM Überwache den Prozess in einer Schleife
:monitor
timeout /t %RestartDelay% /nobreak
tasklist | find /i "%GameServerPath%" > nul

if errorlevel 1 (
    echo.
    echo Der Server-Prozess wurde beendet.
    echo Starte den Server erneut...
    goto start_server
) else (
    goto monitor
)

exit