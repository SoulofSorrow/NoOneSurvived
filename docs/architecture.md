# Architecture

## `nos-startscript.bat`

| Variable | Value in repo | Purpose |
| --- | --- | --- |
| `GameServerPath` | `C:\gameserver\noonesurvivedserver\WRSHServer.exe` | Server executable |
| `GameExe` | `WRSHServer.exe` | Process name checked with `tasklist` |
| `ServerOptions` | `-server -log -Port=8484 -QueryPort=45515` | Start arguments |
| `RestartDelay` | `10` | Seconds between checks |

Flow:

1. `:start_server`: `start "" "%GameServerPath%" %ServerOptions%`.
2. `:monitor`: `timeout /t %RestartDelay%`, then `tasklist | find /i "%GameExe%"`.
3. Not found (`errorlevel 1`): back to `:start_server`; otherwise loop.
4. Runs until the console window is closed.

## `nos-updatescript.bat`

| Variable | Value in repo | Purpose |
| --- | --- | --- |
| `GameServerDir` | `C:\gameserver\noonesurvivedserver` | Server install dir |
| `SteamCMDDir` | `C:\SteamCMD` | SteamCMD location |
| `SteamWebAPIKey` | empty | Defined, not used by any command |
| `SteamAppID` | `2329680` | App id passed to `app_update` |
| `TmpDir` | `C:\gameserver\tmp\noonesurvivedserver` | Temporary config copy |
| `BackupParentDir` | `C:\gameserver\backup` | Parent of dated backup folders |

Flow:

1. Splits `%date%` on `-` into month, day, year; `BackupDir` =
   `%BackupParentDir%\<year>-<month>-<day>`.
2. `robocopy` `WRSH\Saved\SaveGames` to `BackupDir` (`/e`).
3. `robocopy` `game.ini` and `gameusersettings.ini` from
   `WRSH\Saved\Config\WindowsServer` to `TmpDir`.
4. `steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir ... +login anonymous +app_update %SteamAppID% validate +quit`.
5. `robocopy` the two ini files back.
6. `rmdir /s /q` `TmpDir`, `pause`.

## Known limitations

- No error handling: a failed `robocopy` or `steamcmd` does not stop the
  script; the restore and cleanup run anyway.
- Date parsing depends on the Windows locale format of `%date%` (expects
  `MM-DD-YYYY` with `-`).
- The start script restarts the server endlessly, also after an intended
  shutdown.

## `Makefile`

Repository setup helper, unrelated to the game server. Generates
`.editorconfig`, `.gitignore`, `.dockerignore` and a pre-commit hook that
rejects commits from an unexpected git identity. These generated files are not
committed.
