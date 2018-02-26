/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschränkt mehrbenutzerfähige MP3-Verwaltung" für Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
*/

USE MP3_VERWALTUNG;
GO

CREATE TABLE BENUTZER(
	BID int IDENTITY (1,1)
	,Benutzername 
	,Passwort
	,Email 
	,Vorname 
	,Nachname 
	CONSTRAINT BENUTZER_PK PRIMARY KEY (BID)
	);
GO

CREATE TABLE SONG ();
CREATE TABLE GENRES ();
