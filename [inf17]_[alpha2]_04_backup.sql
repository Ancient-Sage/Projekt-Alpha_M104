/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschränkt mehrbenutzerfähige MP3-Verwaltung" für Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
*/


BACKUP DATABASE MP3_VERWALTUNG 
TO DISK = 'C:\M104\Projekt Kick-Off\Backups\test.sql'




RESTORE DATABASE MP3_VERWALTUNG 
FROM DISK = 'C:\M104\Projekt Kick-Off\Backups\test.sql' WITH REPLACE
