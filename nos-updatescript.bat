@echo off
setlocal

REM Configuration variables
set "GameServerDir=C:\gameserver\noonesurvivedserver"        REM Game server directory
set "SteamCMDDir=C:\SteamCMD"            REM SteamCMD directory
set "SteamWebAPIKey="    REM Steam Web API key
set "SteamAppID=2329680"                  REM App-ID
set "TmpDir=C:\gameserver\tmp\noonesurvivedserver"      REM Directory for temporary backup files
set "BackupParentDir=C:\gameserver\backup"      REM Directory for storing backup files

REM Capture the current date in YYYY-MM-DD format
for /F "tokens=1-3 delims=-" %%a in ('echo %date%') do (
    set "year=%%c"
    set "month=%%a"
    set "day=%%b"
)

REM Create backup directory name with the current date
set "BackupDir=%BackupParentDir%\%year%-%month%-%day%"

REM Backup the save games
robocopy "%GameServerDir%\WRSH\Saved\SaveGames" "%BackupDir%" /e

REM Backup the configuration files
echo Backing up configuration files...
robocopy "%GameServerDir%\WRSH\Saved\Config\WindowsServer" "%tmpDir%" game.ini gameusersettings.ini

REM Run SteamCMD to update the NoOneSurvived server
echo Updating NoOneSurvived server...
cd /d "%SteamCMDDir%"
steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir "%GameServerDir%" +login anonymous +app_update %SteamAppID% validate +quit

REM Restore the configuration files
echo Restoring configuration files...
robocopy "%tmpDir%" "%GameServerDir%\WRSH\Saved\Config\WindowsServer" game.ini gameusersettings.ini

REM Cleanup: Delete the backup directory
echo Deleting temporary backup files...
rmdir /s /q "%tmpDir%"

echo Update completed.
endlocal
pause
