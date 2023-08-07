# No One Survived Server Auto-Restart Script

[![en](https://img.shields.io/badge/lang-en-red)](https://github.com/SoulofSorrow/NoOneSurvived/edit/main/README.md)

Dieses Repository enthält ein einfaches Windows-Batch-Skript, das entwickelt wurde, um den "No One Survived"-Spielserver automatisch neu zu starten, falls unerwartete Abschaltungen oder Abstürze auftreten.

## Verwendung

1. Stellen Sie sicher, dass der "No One Survived"-Spielserver im angegebenen Pfad (`C:\gameserver\noonesurvivedserver\WRSHServer.exe`) installiert ist.
2. Passen Sie bei Bedarf die Skriptparameter an:
   - `GameServerPath`: Pfad zur ausführbaren Datei "WRSHServer.exe".
   - `ServerOptions`: Zusätzliche Optionen, um den Server zu starten (z. B. Server-Flags, Ports).
   - `RestartDelay`: Die Verzögerung in Sekunden, bevor der Server nach einem unerwarteten Stopp erneut gestartet wird.
3. Doppelklicken Sie auf die Batch-Datei oder führen Sie sie über die Kommandozeile aus, um den Server zu starten und seinen Status zu überwachen.
4. Das Skript überprüft kontinuierlich, ob der Serverprozess läuft. Wenn festgestellt wird, dass der Server gestoppt wurde, wird er automatisch neu gestartet.
5. Um den automatischen Neustartvorgang zu beenden, schließen Sie das Eingabeaufforderungsfenster des Skripts.

**Hinweis:** Stellen Sie sicher, dass Sie die erforderlichen Berechtigungen haben, um Batch-Skripts auf Ihrem System auszuführen.

## Wichtig

- Dieses Skript geht davon aus, dass der Spiele-Serverprozess "WRSHServer.exe" heißt. Wenn Ihr Serverprozess einen anderen Namen hat, passen Sie das Skript entsprechend an.
- Passen Sie den Wert von `RestartDelay` nach Bedarf an, um den Anforderungen Ihres Servers gerecht zu werden.

## Haftungsausschluss

Bitte verwenden Sie dieses Skript verantwortungsbewusst und in Übereinstimmung mit den Nutzungsbedingungen des Spiel-Servers. Die Autoren übernehmen keine Verantwortung für Missbrauch oder unbefugte Handlungen im Zusammenhang mit diesem Skript.

---

# NoOneSurvived Server Update Script

Dieses Skript dient dazu, den NoOneSurvived-Server zu aktualisieren und dabei eine Sicherung der Savegames und Konfigurationsdateien durchzuführen.

## Voraussetzungen

1. Installierte Version von SteamCMD (Steam Console Client) unter `C:\SteamCMD`.
2. Steam Web API-Schlüssel (wird benötigt, um den Server zu aktualisieren).

## Konfiguration

Bitte stelle sicher, dass du die folgenden Variablen entsprechend deiner Umgebung und Anforderungen anpasst:

- `GameServerDir`: Das Verzeichnis des NoOneSurvived-Servers.
- `SteamCMDDir`: Das Verzeichnis von SteamCMD.
- `SteamWebAPIKey`: Dein Steam Web API-Schlüssel (falls erforderlich).
- `SteamAppID`: Die App-ID für den NoOneSurvived-Server.
- `TmpDir`: Ein temporäres Verzeichnis für die Sicherung der Konfigurationsdateien.
- `BackupParentDir`: Das Verzeichnis, in dem die Sicherungsdateien gespeichert werden sollen.

## Anleitung

1. Passe die Konfigurationsvariablen entsprechend an.
2. Führe das Skript aus, um den NoOneSurvived-Server zu aktualisieren und die Sicherungsdateien zu erstellen.

**Hinweis**: Stelle sicher, dass du vor der Ausführung des Skripts den GameServer-Ordner (`C:\gameserver\noonesurvivedserver`) und das Backup-Verzeichnis (`C:\gameserver\backup`) erstellt hast.

## Skriptbeschreibung

1. Das Skript erfasst das aktuelle Datum im Format JJJJ-MM-TT und erstellt einen Backup-Verzeichnisnamen entsprechend dem Datum.
2. Es sichert die Savegames des NoOneSurvived-Servers in das Backup-Verzeichnis mit Hilfe von Robocopy.
3. Die Konfigurationsdateien `game.ini` und `gameusersettings.ini` werden in ein temporäres Verzeichnis kopiert.
4. SteamCMD wird ausgeführt, um den NoOneSurvived-Server zu aktualisieren.
5. Nach der Aktualisierung werden die Konfigurationsdateien aus dem temporären Verzeichnis wiederhergestellt.
6. Das temporäre Sicherungsverzeichnis wird gelöscht.

## Haftungsausschluss

Dieses Skript wird "wie es ist" bereitgestellt, ohne ausdrückliche oder stillschweigende Gewährleistung. Der Autor übernimmt keine Verantwortung für Schäden oder Datenverluste, die durch die Verwendung dieses Skripts entstehen können.

**Wichtiger Hinweis**: Es wird dringend empfohlen, vor der Ausführung dieses Skripts eine vollständige Sicherung aller wichtigen Daten zu erstellen.
