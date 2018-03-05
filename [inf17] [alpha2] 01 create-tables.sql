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
	,Benutzername text NOT NULL
	,Passwort text NOT NULL
	,Email text NOT NULL
	,Vorname text
	,Nachname text
	,Strasse text
	,PLZ text
	,Ort text
	,Land int --Fremdschlüssel
	,CONSTRAINT BENUTZER_PK PRIMARY KEY (BID)
	,CONSTRAINT LAND_FK FOREIGN KEY (Land)
	REFERENCES LAENDER (LID));


CREATE TABLE SONGS (
	SID int IDENTITY (1,1)
	,Songtitel text NOT NULL
	,Erscheinungsjahr date NOT NULL--nicht nur das jahr
	,Interpret text NOT NULL--Was ist ein Interpret?
	,Dauer time NOT NULL--nicht nur sekunden
	,Genre int NOT NULL--Fremdschlüssel
	,Herkunftsland int NOT NULL--Fremdschlüssel
	,Kaufpreis decimal NOT NULL
	,Ersteller int NOT NULL--Fremdschlüssel
	,CONSTRAINT SONG_PK PRIMARY KEY (SID)
	,CONSTRAINT GENRE_FK FOREIGN KEY (Genre)
	REFERENCES GENRES (GID)
	,CONSTRAINT HERKUNFTS_FK FOREIGN KEY (Herkunftsland)
	REFERENCES LAENDER (LID)
	,CONSTRAINT ERSTELLER_FK FOREIGN KEY (Ersteller)
	REFERENCES BENUTZER (BID));


CREATE TABLE GENRES (
	GID int IDENTITY (1,1)
	,Genrename text NOT NULL
	,CONSTRAINT GENRES_PK PRIMARY KEY (GID));


CREATE TABLE LAENDER (
	LID int IDENTITY (1,1)
	,Land text NOT NULL
	,CONSTRAINT LAENDER_PK PRIMARY KEY (LID));


CREATE TABLE ALBUM (
	AID int IDENTITY (1,1)
	,Albumname text NOT NULL
	,Cover text NOT NULL
	,CONSTRAINT ALBUM_PK PRIMARY KEY(AID));


CREATE TABLE SONG_ALBUM (
	SID int NOT NULL--Fremdschlüssel
	,AID int NOT NULL--Fremdschlüssel
	,CONSTRAINT ALBUM_FK FOREIGN KEY (AID)
	REFERENCES ALBUM (AID)
	,CONSTRAINT SONG_ALBUM_FK FOREIGN KEY (SID)
	REFERENCES SONGS (SID));


CREATE TABLE KAUF_SONGBESITZ (
	KID int IDENTITY (1,1)
	,BID int NOT NULL
	,SID int NOT NULL
	,Kaufdatum date NOT NULL
	,CONSTRAINT SONGBESITZ_PK PRIMARY KEY(KID)
	,CONSTRAINT BENUTZER_FK FOREIGN KEY (BID)
	REFERENCES BENUTZER (BID)
	,CONSTRAINT SONGSBESITZ_FK FOREIGN KEY (SID)
	REFERENCES SONGS (SID));