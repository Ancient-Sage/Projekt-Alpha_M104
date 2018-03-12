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


--
INSERT INTO ALBUM
(Albumname, Cover)
VALUES
('Chuck Norris on Fire','http://i0.kym-cdn.com/entries/icons/original/000/000/244/nope.jpg'),
('Diluted Blood','http://www.yomiuri.co.jp/adv/chuo/photo/research/201500205aEn.gif'),
('Deus lo vult','https://s-media-cache-ak0.pinimg.com/originals/ae/91/3e/ae913e6677a952cfe1300d3a04b67b88.jpg'),
('Never again','http://2.bp.blogspot.com/-nUi0QN_mW5o/VTC2NZoFKFI/AAAAAAAALIA/wJ7VgWjek5k/s1600/Never%2BAgain.jpg'),
('Happy go Lucky','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfcCi1PiLF_5nrB-WcICkxe84SyrzN7om4m8tYLTJZXuBlp4dxIQ'),
('Not the Bees!','https://images.lookhuman.com/render/standard/0060100806096648/mug11oz-whi-z1-t-not-the-bees.png');

GO


--
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

GO


--
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

GO


--
INSERT INTO ADRESSEN
(Strasse, PLZ, Ort, Land)
VALUES
('Marienstrasse 99','3462','Unterkappelen',(SELECT LID FROM LAENDER WHERE Land = 'Schweiz'))
,('Adamsriesenweg 12','7548','Deathington',(SELECT LID FROM LAENDER WHERE Land = 'USA'))
,('Beeway 65','5235','Teadrinkin',(SELECT LID FROM LAENDER WHERE Land = 'England'))
,('Pizzapelati 74','3920','Lassangnna',(SELECT LID FROM LAENDER WHERE Land = 'Italien'))
,('Norbetsstrasse 15','9065','Bieringen',(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'))
,('Hotsmokeway 420','420','Weedfield',(SELECT LID FROM LAENDER WHERE Land = 'Jamaika'));

GO


--
INSERT INTO BENUTZER
(Benutzername, Passwort, Email, Vorname, Nachname, Adresse)
VALUES
('IloveSongs','Azeg778iOOT','remember@dont.com','Alissa','Weber','1')
,('xX360NoScopeXx','420_BlazeIt','360_420@maxi.weed','Maximilian','Lumber','2')
,('PlayIt','12345','musicforreal@tonedeaf.com','Norton','Normie','3')
,('AnotherOne','543216789','deadmemes@lonelylive.de','Markus','Hindenburg','5')
,('Neveragain','NoLife03','DoIt@now.com','Sirius','Huenniger','4')
,('The_Godfather','Praise_the_weed','Highasakite@joint.raggae','Charlie','Monroe','6');

GO


--
INSERT INTO INTERPRETS
(Kuenstlername)
VALUES
('Abdol_Kitler')
,('Lord of the Notes')
,('Dread-Knife')
,('Trollmaster');

GO


--
INSERT INTO SONGS
(Songtitel, Erscheinungsjahr, Interpret, Dauer, Genre, Herkunftsland, Kaufpreis, Ersteller)
VALUES
('Ich will dich Jetzt!','1945',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Abdol_Kitler'),'250',(SELECT GID FROM GENRES WHERE Genrename = 'Heavy-Metal'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'5.1',(SELECT BID FROM BENUTZER WHERE Benutzername = 'Neveragain'))
,('Mucho Gracias','2001',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Lord of the Notes'),'182',(SELECT GID FROM GENRES WHERE Genrename = 'Klassisch'),(SELECT LID FROM LAENDER WHERE Land = 'Italien'),'3.5',(SELECT BID FROM BENUTZER WHERE Benutzername = 'Neveragain'))
,('Neun Leben Reichen Nicht!','1946',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Abdol_Kitler'),'125',(SELECT GID FROM GENRES WHERE Genrename = 'Heavy-Metal'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'4.8',(SELECT BID FROM BENUTZER WHERE Benutzername = 'Neveragain'))
,('3 Problems but life aint one','2012',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Trollmaster'),'432',(SELECT GID FROM GENRES WHERE Genrename = 'Pop'),(SELECT LID FROM LAENDER WHERE Land = 'USA'),'9.20',(SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt'))
,('No More Resistance','2015',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Dread-Knife'),'220',(SELECT GID FROM GENRES WHERE Genrename = 'Metal'),(SELECT LID FROM LAENDER WHERE Land = 'England'),'2.5',(SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'))
,('Fight back!','2015',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Dread-Knife'),'212',(SELECT GID FROM GENRES WHERE Genrename = 'Metal'),(SELECT LID FROM LAENDER WHERE Land = 'England'),'2.65',(SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'))
,('Lost Will','2016',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Dread-Knife'),'201',(SELECT GID FROM GENRES WHERE Genrename = 'Metal'),(SELECT LID FROM LAENDER WHERE Land = 'England'),'2.35',(SELECT BID FROM BENUTZER WHERE Benutzername = 'IloveSongs'))
,('Vorwaerts Marsch!','1947',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Abdol_Kitler'),'168',(SELECT GID FROM GENRES WHERE Genrename = 'Heavy-Metal'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'4.6',(SELECT BID FROM BENUTZER WHERE Benutzername = 'Neveragain'))
,('Mein Panzer ist groesser als Deiner!','1946',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Abdol_Kitler'),'145',(SELECT GID FROM GENRES WHERE Genrename = 'Heavy-Metal'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'3.0',(SELECT BID FROM BENUTZER WHERE Benutzername = 'Neveragain'))
,('Für das Vaterland!','1947',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Abdol_Kitler'),'139',(SELECT GID FROM GENRES WHERE Genrename = 'Heavy-Metal'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'3.9',(SELECT BID FROM BENUTZER WHERE Benutzername = 'Neveragain'))
,('Pas les abeilles','2002',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Lord of the Notes'),'184',(SELECT GID FROM GENRES WHERE Genrename = 'Pop'),(SELECT LID FROM LAENDER WHERE Land = 'Frankreich'),'3.2',(SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt'))
,('刺身','2001',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Lord of the Notes'),'186',(SELECT GID FROM GENRES WHERE Genrename = 'J-Pop'),(SELECT LID FROM LAENDER WHERE Land = 'Japan'),'3.4',(SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt'))
,('Korea times two','2002',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Lord of the Notes'),'168',(SELECT GID FROM GENRES WHERE Genrename = 'K-Pop'),(SELECT LID FROM LAENDER WHERE Land = 'Korea'),'3.0',(SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt'))
,('Beyond Dreams and Perception','2008',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Trollmaster'),'162',(SELECT GID FROM GENRES WHERE Genrename = 'Trance'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'3.2',(SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'))
,('Dreaming 1','2009',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Trollmaster'),'345',(SELECT GID FROM GENRES WHERE Genrename = 'Trance'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'3.3',(SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'))
,('Dreaming 2','2009',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Trollmaster'),'327',(SELECT GID FROM GENRES WHERE Genrename = 'Trance'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'3.3',(SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'))
,('Dreaming 3','2010',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Trollmaster'),'309',(SELECT GID FROM GENRES WHERE Genrename = 'Trance'),(SELECT LID FROM LAENDER WHERE Land = 'Deutschland'),'3.3',(SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'))
,('Ich gegen das Urheberrecht','2011',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Trollmaster'),'245',(SELECT GID FROM GENRES WHERE Genrename = 'Pop'),(SELECT LID FROM LAENDER WHERE Land = 'USA'),'7.2',(SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt'))
,('Dominanz des Urheberrechts','2013',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Trollmaster'),'306',(SELECT GID FROM GENRES WHERE Genrename = 'Pop'),(SELECT LID FROM LAENDER WHERE Land = 'USA'),'5.2',(SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt'));

GO


--
INSERT INTO SONG_ALBUM
(SID, AID)
VALUES
((SELECT SID FROM SONGS WHERE Songtitel = 'No More Resistance'),(SELECT AID FROM ALBUM WHERE Albumname = 'Deus lo vult'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Fight back!'),(SELECT AID FROM ALBUM WHERE Albumname = 'Deus lo vult'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Lost Will'),(SELECT AID FROM ALBUM WHERE Albumname = 'Deus lo vult'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Ich will dich Jetzt!'),(SELECT AID FROM ALBUM WHERE Albumname = 'Diluted Blood'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Neun Leben Reichen Nicht!'),(SELECT AID FROM ALBUM WHERE Albumname = 'Diluted Blood'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Vorwaerts Marsch!'),(SELECT AID FROM ALBUM WHERE Albumname = 'Diluted Blood'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Mein Panzer ist groesser als Deiner!'),(SELECT AID FROM ALBUM WHERE Albumname = 'Diluted Blood'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Für das Vaterland!'),(SELECT AID FROM ALBUM WHERE Albumname = 'Diluted Blood'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Mucho Gracias'),(SELECT AID FROM ALBUM WHERE Albumname = 'Not the Bees!'))
,((SELECT SID FROM SONGS WHERE Songtitel = 'Pas les abeilles'),(SELECT AID FROM ALBUM WHERE Albumname = 'Not the Bees!'));

GO


--Hier Wird erfasst welchem Benutzer welcher Song gehört und seit wann
INSERT INTO KAUF_SONGBESITZ
(BID, SID, Kaufdatum)
VALUES
((SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt'),(SELECT SID FROM SONGS WHERE Songtitel = 'No More Resistance'),'2016-01-01')
,((SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather'),(SELECT SID FROM SONGS WHERE Songtitel = 'No More Resistance'),'2016-01-10')
,((SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather'),(SELECT SID FROM SONGS WHERE Songtitel = 'Lost Will'),'2016-01-11')
,((SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather'),(SELECT SID FROM SONGS WHERE Songtitel = 'Fight back!'),'2016-01-20')
,((SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'),(SELECT SID FROM SONGS WHERE Songtitel = 'Neun Leben Reichen Nicht!'),'2016-01-21');

GO


--Hiermit werden die Songbewertungen abgegeben
INSERT INTO BENUTZERBEWERTUNG
(KID, Bewertung)
VALUES
((SELECT KID FROM KAUF_SONGBESITZ WHERE BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx') AND SID = (SELECT SID FROM SONGS WHERE Songtitel = 'Neun Leben Reichen Nicht!')),1)
,((SELECT KID FROM KAUF_SONGBESITZ WHERE BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather') AND SID = (SELECT SID FROM SONGS WHERE Songtitel = 'Lost Will')),8)
,((SELECT KID FROM KAUF_SONGBESITZ WHERE BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather') AND SID = (SELECT SID FROM SONGS WHERE Songtitel = 'No More Resistance')),6)
,((SELECT KID FROM KAUF_SONGBESITZ WHERE BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather') AND SID = (SELECT SID FROM SONGS WHERE Songtitel = 'Fight back!')),9)
,((SELECT KID FROM KAUF_SONGBESITZ WHERE BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'PlayIt') AND SID = (SELECT SID FROM SONGS WHERE Songtitel = 'No More Resistance')),8);

GO


--Hier werden neue Playlists erstellt
INSERT INTO PLAYLISTS
(Playlistname, BID)
VALUES
('Playlist1',(SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather'));

GO


--Hier werden die Song im Besitz des Benutzers in die Playlists eingefügt
INSERT INTO BENUTZER_PLAYLIST
(PID, KID)
VALUES
((SELECT PID FROM PLAYLISTS WHERE Playlistname = 'Playlist1' AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather')),(SELECT KID FROM KAUF_SONGBESITZ WHERE SID = (SELECT SID FROM SONGS WHERE Songtitel = 'Lost Will') AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather')))
,((SELECT PID FROM PLAYLISTS WHERE Playlistname = 'Playlist1' AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather')),(SELECT KID FROM KAUF_SONGBESITZ WHERE SID = (SELECT SID FROM SONGS WHERE Songtitel = 'No More Resistance') AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather')))
,((SELECT PID FROM PLAYLISTS WHERE Playlistname = 'Playlist1' AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather')),(SELECT KID FROM KAUF_SONGBESITZ WHERE SID = (SELECT SID FROM SONGS WHERE Songtitel = 'Fight back!') AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather')));

GO


--Hiermit können Songs aus den Playlists gelöscht werden
/*
DELETE FROM BENUTZER_PLAYLIST
WHERE PID = (SELECT PID FROM PLAYLISTS WHERE Playlistname = '' 
	AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = ''))
AND KID = (SELECT KID FROM KAUF_SONGBESITZ WHERE BID = (SELECT BID FROM BENUTZER WHERE Benutzername = '')
	AND SID = (SELECT SID FROM SONGS WHERE Songtitel = ''));
*/


--Hiermit können die Namen der Playlists geändert werden
/*
UPDATE PLAYLISTS
SET Playlistname = 'Uberhyperultrafunk'
WHERE Playlistname = 'Playlist1' AND BID = (SELECT BID FROM BENUTZER WHERE Benutzername = 'The_Godfather')
*/


--Hier wird das Probehören erfasst
INSERT INTO PROBEHOEREN
( BID, SID)
VALUES
((SELECT BID FROM BENUTZER WHERE Benutzername = 'xX360NoScopeXx'),(SELECT SID FROM SONGS WHERE Songtitel = 'Neun Leben Reichen Nicht!'))
,((SELECT BID FROM BENUTZER WHERE Benutzername = 'IloveSongs'),(SELECT SID FROM SONGS WHERE Songtitel = 'Mucho Gracias'));

GO


--Um direkt einen neuen Song zu registrieren mit zugehörigen teilen.
--Um ein zugehöriges Interpret einzufügen
INSERT INTO INTERPRETS
(Kuenstlername)
VALUES
('Darth Vater');
--Für das Album
INSERT INTO ALBUM
(Albumname, Cover)
VALUES
('League of Iron','https://www.some_random_link.jpg');
--Sollte es ein neues Genre haben, kann man hier noch eines einfügen.
INSERT INTO GENRES
(Genrename)
VALUES
('Pop-Rock');
--Sollte es in einem Land produziert worden sein das bisher nicht in der Tabelle eingefügt wurde, so kann man dies hier tun.
INSERT INTO LAENDER
(Land)
VALUES
('Bolivien');
--Den Song selbst erstellen
INSERT INTO SONGS
(Songtitel, Erscheinungsjahr, Interpret, Dauer, Genre, Herkunftsland, Kaufpreis, Ersteller)
VALUES
('Phoenix from the Ashes','2012',(SELECT IID FROM INTERPRETS WHERE Kuenstlername = 'Darth Vater'),'184',(SELECT GID FROM GENRES WHERE Genrename = 'Pop-Rock'),(SELECT LID FROM LAENDER WHERE Land = 'Bolivien'),'2.3',(SELECT BID FROM BENUTZER WHERE Benutzername = 'Neveragain'));
--Den Song dem neuen Album zufügen
INSERT INTO SONG_ALBUM
(SID, AID)
VALUES
((SELECT SID FROM SONGS WHERE Songtitel = 'Phoenix from the Ashes'),(SELECT AID FROM ALBUM WHERE Albumname = 'League of Iron'));

/*
SELECT * FROM PLAYLISTS;
SELECT * FROM PROBEHOEREN;
SELECT * FROM ALBUM;
SELECT * FROM BENUTZER;
SELECT * FROM SONGS;
SELECT * FROM KAUF_SONGBESITZ;
*/