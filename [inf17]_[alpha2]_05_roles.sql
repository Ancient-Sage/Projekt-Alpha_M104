/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschränkt mehrbenutzerfähige MP3-Verwaltung" für Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
Rollen Ausetzung für die Datenbank
+ Schema für Vergebung / Entfernen der Rollen
*/

USE MP3_VERWALTUNG;
GO

CREATE ROLE Moderator;

GRANT UPDATE, INSERT, SELECT ON ALBUM TO Moderator;
GRANT UPDATE, INSERT, SELECT ON INTERPRETS TO Moderator;
GRANT UPDATE, INSERT, SELECT ON GENRES TO Moderator;
GRANT UPDATE, INSERT, SELECT ON SONGS TO Moderator;
GRANT UPDATE, INSERT, SELECT ON SONG_ALBUM TO Moderator;
GRANT INSERT, SELECT ON LAENDER TO Moderator;
GRANT SELECT ON BENUTZER TO Moderator;
GRANT SELECT ON KAUF_SONGBESITZ TO Moderator;

/*Um Moderatoren-Rechte zu vergeben benutze den unteren Befehl bitte. (Multiuser-Fähig)*/
--GRANT Moderator TO ..., ...;
--REVOKE Moderator FROM ..., ...;


/* Um Systemadministratoren-Recht zu vegeben bitter nutze den Folgenden Befehl der
die Vorbestehende Rolle namens sysadmin benutzt. (Achtung: sysadmin vergibt komplette / allzugängliche Zugangsrechte!)*/
--GRANT sysadmin TO ..., ...;
--REVOKE sysadmin FROM ..., ...;