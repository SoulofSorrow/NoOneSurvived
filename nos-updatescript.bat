@echo off
setlocal

REM Konfigurationsvariablen
set "GameServerDir=C:\gameserver\noonesurvivedserver"         REM Verzeichnis des Game
set "SteamCMDDir=C:\SteamCMD"           REM Verzeichnis von SteamCMD
set "SteamWebAPIKey="   REM Steam Web API-Schlüssel
set "SteamAppID=2329680"                 REM App-ID 
set "TmpDir=C:\gameserver\tmp\noonesurvivedserver"     REM Verzeichnis für die Sicherung der Dateien
set "BackupParentDir=C:\gameserver\backup"     REM Verzeichnis für die Sicherung der Dateien

REM Datum im Format JJJJ-MM-TT erfassen
for /F "tokens=1-3 delims=-" %%a in ('echo %date%') do (
    set "year=%%c"
    set "month=%%a"
    set "day=%%b"
)

REM Backup-Verzeichnisnamen mit dem aktuellen Datum erstellen
set "BackupDir=%BackupParentDir%\%year%-%month%-%day%"

REM Sicherung der Savegames
robocopy "%GameServerDir%\WRSH\Saved\SaveGames" "%BackupDir%" /e

REM Sicherung der Konfigurationsdateien
echo Sichere Konfigurationsdateien...
robocopy "%GameServerDir%\WRSH\Saved\Config\WindowsServer" "%tmpDir%" game.ini gameusersettings.ini

REM SteamCMD ausführen, um den NoOneSurvived-Server zu aktualisieren
echo Aktualisiere NoOneSurvived-Server...
cd /d "%SteamCMDDir%"
steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir "%GameServerDir%" +login anonymous +app_update %SteamAppID% validate +quit

REM Wiederherstellen der Konfigurationsdateien
echo Stelle Konfigurationsdateien wieder her...
robocopy "%tmpDir%" "%GameServerDir%\WRSH\Saved\Config\WindowsServer" game.ini gameusersettings.ini

REM Bereinigung: Lösche das Backup-Verzeichnis
echo Lösche temporäre Sicherungsdateien...
rmdir /s /q "%tmpDir%"

echo Aktualisierung abgeschlossen.
endlocal
pause