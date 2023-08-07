# No One Survived Server Auto-Restart Script
[![de](https://img.shields.io/badge/lang-de-yello)](https://github.com/SoulofSorrow/NoOneSurvived/edit/main/README.de.md)

This repository contains a simple Windows batch script designed to automatically restart the "No One Survived" game server in case of unexpected shutdowns or crashes.

## Usage

1. Ensure you have the "No One Survived" game server installed at the specified path (`C:\gameserver\noonesurvivedserver\WRSHServer.exe`).
2. Customize the script parameters if needed:
   - `GameServerPath`: Path to the "WRSHServer.exe" executable.
   - `ServerOptions`: Additional options to start the server with (e.g., server flags, ports).
   - `RestartDelay`: The delay in seconds before attempting to restart the server after it stops unexpectedly.
3. Double-click the batch file or execute it via the command line to start the server and begin monitoring its status.
4. The script will continuously check if the server process is running. If it detects that the server has stopped, it will automatically restart it.
5. To stop the auto-restart process, close the script's command prompt window.

**Note:** Make sure you have the necessary permissions to execute batch scripts on your system.

## Important

- This script assumes the game server process is named "WRSHServer.exe." If your server process has a different name, modify the script accordingly.
- Adjust the `RestartDelay` value as needed to suit your server's specific requirements.

## Disclaimer

Please use this script responsibly and in accordance with the game server's terms of service. The authors are not responsible for any misuse or unauthorized actions related to this script.

---

# NoOneSurvived Server Update Script

This script is designed to update the NoOneSurvived server while creating a backup of the savegames and configuration files.

## Prerequisites

1. Installed version of SteamCMD (Steam Console Client) under `C:\SteamCMD`.
2. Steam Web API key (required for server update).

## Configuration

Please make sure to adjust the following variables according to your environment and requirements:

- `GameServerDir`: The directory of the NoOneSurvived server.
- `SteamCMDDir`: The directory of SteamCMD.
- `SteamWebAPIKey`: Your Steam Web API key (if required).
- `SteamAppID`: The App-ID for the NoOneSurvived server.
- `TmpDir`: A temporary directory for backing up configuration files.
- `BackupParentDir`: The directory where backup files will be stored.

## Instructions

1. Adjust the configuration variables accordingly.
2. Execute the script to update the NoOneSurvived server and create the backup files.

**Note**: Make sure you have created the GameServer directory (`C:\gameserver\noonesurvivedserver`) and the backup directory (`C:\gameserver\backup`) before running the script.

## Script Description

1. The script captures the current date in the format YYYY-MM-DD and creates a backup directory name using the date.
2. It backs up the NoOneSurvived server's savegames to the backup directory using Robocopy.
3. The `game.ini` and `gameusersettings.ini` configuration files are copied to a temporary directory.
4. SteamCMD is executed to update the NoOneSurvived server.
5. After the update, the configuration files are restored from the temporary directory.
6. The temporary backup directory is deleted.

## Disclaimer

This script is provided "as is," without warranty of any kind, express or implied. The author assumes no responsibility for any damages or data loss that may occur from using this script.

**Important Note**: It is strongly recommended to create a full backup of all critical data before executing this script.

