/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschr�nkt mehrbenutzerf�hige MP3-Verwaltung" f�r Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
*/


BACKUP DATABASE MP3_VERWALTUNG 
TO DISK = 'C:\M104\Projekt Kick-Off\Backups\test.sql'




RESTORE DATABASE MP3_VERWALTUNG 
FROM DISK = 'C:\M104\Projekt Kick-Off\Backups\test.sql' WITH REPLACE
