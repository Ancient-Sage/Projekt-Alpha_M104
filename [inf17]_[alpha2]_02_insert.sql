/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschränkt mehrbenutzerfähige MP3-Verwaltung" für Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
Inserts
*/

USE MP3_VERWALTUNG;
GO



INSERT INTO ALBUM
(Albumname, Cover)
VALUES
('Chuck Norris on Fire','http://i0.kym-cdn.com/entries/icons/original/000/000/244/nope.jpg'),
('Diluted Blood','http://www.yomiuri.co.jp/adv/chuo/photo/research/201500205aEn.gif'),
('Deus lo vult','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/GA_Ordre_du_Saint-S%C3%A9pulcre.svg/330px-GA_Ordre_du_Saint-S%C3%A9pulcre.svg.png'),
('Never again','http://2.bp.blogspot.com/-nUi0QN_mW5o/VTC2NZoFKFI/AAAAAAAALIA/wJ7VgWjek5k/s1600/Never%2BAgain.jpg'),
('Happy go Lucky','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfcCi1PiLF_5nrB-WcICkxe84SyrzN7om4m8tYLTJZXuBlp4dxIQ'),
('Not the Bees!','https://images.lookhuman.com/render/standard/0060100806096648/mug11oz-whi-z1-t-not-the-bees.png');


INSERT INTO LAENDER
(Land)
VALUES
('Schweiz'),
('Deutschland'),
('Österreich'),
('Italien'),
('Frankreich'),
('England'),
('USA'),
('Mexiko'),
('Jamaika'),
('Japan'),
('China'),
('Korea');


INSERT INTO GENRES
(Genrename)
VALUES
('Rock'),
('Pop'),
('J-Pop'),
('K-Pop'),
('Trance'),
('Orchestral'),
('Metal'),
('Heavy-Metal'),
('Nightcore'),
('Raggae'),
('Folk'),
('Jazz'),
('Klassisch');


INSERT INTO ADRESSEN
(Strasse, PLZ, Ort, Land)
VALUES
('Marienstrasse 99','3462','Unterkappelen',(SELECT LID FROM LAENDER WHERE Land = 'Schweiz'))
,('','','',(SELECT LID FROM LAENDER WHERE Land = ''))
,('','','',(SELECT LID FROM LAENDER WHERE Land = ''))
,('','','',(SELECT LID FROM LAENDER WHERE Land = ''))
,('','','',(SELECT LID FROM LAENDER WHERE Land = ''))
,('','','',(SELECT LID FROM LAENDER WHERE Land = ''));


INSERT INTO BENUTZER
(Benutzername, Passwort, Email, Vorname, Nachname, Adresse)
VALUES
('IloveSongs','Azeg778iOOT','','','','')
,('','','','','','')
,('','','','','','')
,('','','','','','')
,('','','','','','')
,('','','','','','')
,('','','','','','');


INSERT INTO SONGS
(Songtitel, Erscheinungsjahr, Interpret, Dauer, Genre, Herkunftsland, Kaufpreis, Ersteller)
VALUES
('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''))
,('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''))
,('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''))
,('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''))
,('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''))
,('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''))
,('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''))
,('','','','',(SELECT GID FROM GENRES WHERE Genrename = ''),(SELECT LID FROM LAENDER WHERE Land = ''),'',(SELECT BID FROM BENUTZER WHERE Benutzername = ''));


INSERT INTO SONG_ALBUM
(SID, AID)
VALUES
((SELECT SID FROM SONGS WHERE Songtitel = ''),(SELECT AID FROM ALBUM WHERE Albumname = ''))
,((SELECT SID FROM SONGS WHERE Songtitel = ''),(SELECT AID FROM ALBUM WHERE Albumname = ''))
,((SELECT SID FROM SONGS WHERE Songtitel = ''),(SELECT AID FROM ALBUM WHERE Albumname = ''))
,((SELECT SID FROM SONGS WHERE Songtitel = ''),(SELECT AID FROM ALBUM WHERE Albumname = ''))
,((SELECT SID FROM SONGS WHERE Songtitel = ''),(SELECT AID FROM ALBUM WHERE Albumname = ''));


INSERT INTO KAUF_SONGBESITZ
(BID, SID, Kaufdatum)
VALUES
((SELECT BID FROM BENUTZER WHERE Benutzername = ''),(SELECT SID FROM SONGS WHERE Songtitel = ''),'')
,((SELECT BID FROM BENUTZER WHERE Benutzername = ''),(SELECT SID FROM SONGS WHERE Songtitel = ''),'')
,((SELECT BID FROM BENUTZER WHERE Benutzername = ''),(SELECT SID FROM SONGS WHERE Songtitel = ''),'')
,((SELECT BID FROM BENUTZER WHERE Benutzername = ''),(SELECT SID FROM SONGS WHERE Songtitel = ''),'')
,((SELECT BID FROM BENUTZER WHERE Benutzername = ''),(SELECT SID FROM SONGS WHERE Songtitel = ''),'');


INSERT INTO BENUTZERBEWERTUNG
(KID, SID, Bewertung)
VALUES
('','','');


INSERT INTO BENUTZER_PLAYLIST
(Playlistname, BID, KID)
VALUES
('','','');

INSERT INTO PROBEHOEREN
( BID, SID)
VALUES
((SELECT BID FROM BENUTZER WHERE Benutzername = ''),(SELECT SID FROM SONGS WHERE Songtitel = ''));



