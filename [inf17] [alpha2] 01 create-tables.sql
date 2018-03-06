/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschränkt mehrbenutzerfähige MP3-Verwaltung" für Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
*/

USE MP3_VERWALTUNG;
GO

--Erstellt die Tabelle für die Länder
CREATE TABLE LAENDER (
	LID int IDENTITY (1,1)
	,Land varchar(50) NOT NULL
	,CONSTRAINT LAENDER_PK PRIMARY KEY (LID));

--Erstellt die Tabelle für die Genres
CREATE TABLE GENRES (
	GID int IDENTITY (1,1)
	,Genrename varchar(50) NOT NULL
	,CONSTRAINT GENRES_PK PRIMARY KEY (GID));

--Erstellt die Tabelle für die Alben
CREATE TABLE ALBUM (
	AID int IDENTITY (1,1)
	,Albumname varchar(50) NOT NULL
	,Cover varchar(1000) NOT NULL
	,CONSTRAINT ALBUM_PK PRIMARY KEY(AID));

--Erstellt die Tabelle für die Interpretatoren
CREATE TABLE INTERPRETS (
	IID int IDENTITY (1,1)
	,Kuenstlername varchar(50) NOT NULL
	,CONSTRAINT INTERPRET_PK PRIMARY KEY (IID));

--Erstellt die Tabelle für die Adressen
CREATE TABLE ADRESSEN (
	AID int IDENTITY (1,1)
	,Strasse varchar(50) NULL
	,PLZ varchar(50) NULL
	,Ort varchar(50) NULL
	,Land int NOT NULL --Fremdschlüssel zur Tabelle LAENDER
	,CONSTRAINT ADRESSEN_PK PRIMARY KEY (AID)
	,CONSTRAINT BENUTZER_LAND_FK FOREIGN KEY (Land)
	REFERENCES LAENDER (LID));

--Erstellt die Tabelle für die Benutzer
CREATE TABLE BENUTZER(
	BID int IDENTITY (1,1)
	,Benutzername varchar(50) UNIQUE NOT NULL
	,Passwort varchar(50) NOT NULL
	,Email varchar(50) NOT NULL
	,Vorname varchar(50) NULL
	,Nachname varchar(50) NULL
	,Adresse int NULL--Fremdschlüssel zur Tabelle ADRESSEN
	,CONSTRAINT BENUTZER_PK PRIMARY KEY (BID)
	,CONSTRAINT ADRESSE_FK FOREIGN KEY (Adresse)
	REFERENCES ADRESSEN (AID));

--Erstellt die Tabelle für die Songs
CREATE TABLE SONGS (
	SID int IDENTITY (1,1)
	,Songtitel varchar(50) UNIQUE NOT NULL
	,Erscheinungsjahr smallint NOT NULL--kann mit dem Datentyp "date" nicht nur das jahr eingegeben werden 
	,Interpret int NOT NULL--Fremdschlüssel zur Tabelle INTERPRETS
	,Dauer smallint NOT NULL--kann mit dem Datentyp "time" nicht nur in sekunden eingegeben werden
	,Genre int NOT NULL--Fremdschlüssel zur Tabelle GENRES
	,Herkunftsland int NOT NULL--Fremdschlüssel zur Tabelle LAENDER
	,Kaufpreis decimal(4,2) NOT NULL
	,Ersteller int NOT NULL--Fremdschlüssel zur Tabelle BENUTZER
	,CONSTRAINT SONG_PK PRIMARY KEY (SID)
	,CONSTRAINT GENRE_FK FOREIGN KEY (Genre)
	REFERENCES GENRES (GID)
	,CONSTRAINT HERKUNFTS_FK FOREIGN KEY (Herkunftsland)
	REFERENCES LAENDER (LID)
	,CONSTRAINT ERSTELLER_FK FOREIGN KEY (Ersteller)
	REFERENCES BENUTZER (BID)
	,CONSTRAINT INTERPRET_FK FOREIGN KEY (Interpret)
	REFERENCES BENUTZER (BID));

--Erstellt die Tabelle fürs verbinden der Tabellen SONGS und ALBUM 
--Ein Song kann in mehreren Almen vorkommen und in einem Album kommen mehrere Songs vor
CREATE TABLE SONG_ALBUM (
	SID int NOT NULL--Fremdschlüssel zur Tabelle SONGS
	,AID int NOT NULL--Fremdschlüssel zur Tabelle ALBUM
	,CONSTRAINT ALBUM_FK FOREIGN KEY (AID)
	REFERENCES ALBUM (AID)
	,CONSTRAINT SONG_ALBUM_FK FOREIGN KEY (SID)
	REFERENCES SONGS (SID));

--Erstellt die Tabelle fürs verbinden der Tabellen SONGS und BENUTZER
CREATE TABLE KAUF_SONGBESITZ (
	KID int IDENTITY (1,1)
	,BID int NOT NULL--Fremdschlüssel zur Tabelle BENUTZER
	,SID int NOT NULL--Fremdschlüssel zur Tabelle SONGS
	,Kaufdatum date NOT NULL
	,CONSTRAINT SONGBESITZ_PK PRIMARY KEY(KID)
	,CONSTRAINT BENUTZER_FK FOREIGN KEY (BID)
	REFERENCES BENUTZER (BID)
	,CONSTRAINT SONGSBESITZ_FK FOREIGN KEY (SID)
	REFERENCES SONGS (SID));

--Erstellt die Tabelle für die Bewertung von Songs
CREATE TABLE BENUTZERBEWERTUNG (
	KID int NOT NULL --Fremdschlüssel zur Tabelle KAUF_SONGBESITZ
	,SID int NOT NULL --Fremdschlüssel zur Tabelle SONGS
	,Bewertung int CHECK (Bewertung < 10) NOT NULL
	,CONSTRAINT BW_SIB_FK FOREIGN KEY (KID) -- BW_SIB = BenutzerbeWertung_SongInBesitz
	REFERENCES KAUF_SONGBESITZ (KID)
	,CONSTRAINT BW_SONG_FK FOREIGN KEY (SID) 
	REFERENCES SONGS (SID));

--Erstellt die Tabelle für die Benutzer Playlists
CREATE TABLE BENUTZER_PLAYLIST (
	BID int NOT NULL --Fremdschlüssel zur Tabelle BENUTZER
	,KID int NOT NULL --Fremdschlüssel zur Tabelle KAUF_SONGBESITZ
	,Playlistname varchar(50) NOT NULL
	,CONSTRAINT BP_SIB_FK FOREIGN KEY (KID) -- BP_SIB = BenutzerPlaylist_SongInBesitz
	REFERENCES KAUF_SONGBESITZ (KID)
	,CONSTRAINT BP_BENUTZER_FK FOREIGN KEY (BID) 
	REFERENCES BENUTZER (BID));

--Erstellt die Tabelle fürs Probehören
--Damit du die einen Song einmal anhören kannst bevor du ihn kaufst
CREATE TABLE PROBEHOEREN (
	BID int NOT NULL --Fremdschlüssel zur Tabelle BENUTZER
	,SID int NOT NULL --Fremdschlüssel zur Tabelle SONGS
	,CONSTRAINT UC_PROBEHOEREN UNIQUE (BID,SID)
	,CONSTRAINT PH_BENUTZER_FK FOREIGN KEY (BID) 
	REFERENCES BENUTZER (BID)
	,CONSTRAINT PH_SONG_FK FOREIGN KEY (SID) 
	REFERENCES SONGS (SID));

