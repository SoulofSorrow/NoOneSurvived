## Startscript README
[![de](https://img.shields.io/badge/lang-de-yello)](https://github.com/SoulofSorrow/NoOneSurvived/edit/main/README.de.md)

### Beschreibung
Dieses Startscript wurde entwickelt, um den No One Survived Game-Server zu starten und die Prozessüberwachung hinzuzufügen, um den Server automatisch neu zu starten, falls er abstürzt oder unerwartet beendet wird. Das Skript verwendet Batch-Skripting, um den Startvorgang zu automatisieren und die Serverkonfiguration zu vereinfachen.

### Anforderungen
- Windows-Betriebssystem

### Verwendung
Stelle sicher, dass du die erforderlichen Konfigurationsvariablen im Skript an deine Umgebung angepasst hast, bevor du das Skript ausführst. Die wichtigsten Variablen, die du möglicherweise anpassen musst, sind `GameServerPath` und `RestartDelay`. Beachte auch die Kommentare im Skript für weitere Anpassungen.

Speichere das Skript in einer Datei mit der `.bat`-Erweiterung.

Führe das Skript aus, um den No One Survived Game-Server zu starten. Das Skript wird den Server starten und gleichzeitig den Serverprozess überwachen. Wenn der Server abstürzt oder beendet wird, wird er automatisch neu gestartet.

### Hinweise
Dieses Skript wurde für die Verwendung mit dem No One Survived Game-Server entwickelt. Stelle sicher, dass du die Pfadangaben und Konfigurationsvariablen entsprechend anpasst, falls dein Server in einem anderen Verzeichnis installiert ist. Vor dem Ausführen des Skripts solltest du sicherstellen, dass die erforderlichen Voraussetzungen erfüllt sind, wie z. B. die korrekte Installation von SteamCMD und das Vorhandensein des Game-Servers im angegebenen Verzeichnis.

---

## Backupscript README

### Beschreibung
Dieses Backupscript wurde entwickelt, um die Savegames und Konfigurationsdateien des No One Survived Game-Servers zu sichern. Das Skript verwendet Batch-Skripting und das Robocopy-Befehlszeilentool, um die Dateien zu kopieren und in einem Backup-Verzeichnis abzulegen, das mit dem aktuellen Datum benannt ist.

### Anforderungen
- Windows-Betriebssystem
- Robocopy (in der Regel in Windows enthalten)

### Verwendung
Stelle sicher, dass du die erforderlichen Konfigurationsvariablen im Skript an deine Umgebung angepasst hast, bevor du das Skript ausführst. Die wichtigsten Variablen, die du möglicherweise anpassen musst, sind `GameServerDir` und `BackupParentDir`. Beachte auch die Kommentare im Skript für weitere Anpassungen.

Speichere das Skript in einer Datei mit der `.bat`-Erweiterung.

Führe das Skript aus, um die Savegames und Konfigurationsdateien des No One Survived Game-Servers zu sichern. Das Skript erstellt ein Backup-Verzeichnis mit dem aktuellen Datum und kopiert die Dateien in dieses Verzeichnis.

### Hinweise
Dieses Skript wurde für die Verwendung mit dem No One Survived Game-Server entwickelt. Stelle sicher, dass du die Pfadangaben und Konfigurationsvariablen entsprechend anpasst, falls dein Server in einem anderen Verzeichnis installiert ist. Vor dem Ausführen des Skripts solltest du sicherstellen, dass die erforderlichen Voraussetzungen erfüllt sind, wie z. B. die korrekte Installation von Robocopy oder anderen Dateikopiertools, die den in diesem Skript verwendeten Funktionen ähneln.
