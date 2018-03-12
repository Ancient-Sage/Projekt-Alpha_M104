/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschränkt mehrbenutzerfähige MP3-Verwaltung" für Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
*/

USE MP3_VERWALTUNG;
GO

--Titel und Preis des teuersten Songs anzeigen
SELECT Songtitel, Kaufpreis FROM SONGS
WHERE Kaufpreis = (SELECT MAX(Kaufpreis) AS "teuerster Song" FROM SONGS);

--Auflistung von Titel und Preisen vom teuersten zum billigsten Song
SELECT Songtitel, Kaufpreis FROM SONGS
ORDER BY Kaufpreis DESC; 


--Titel und Preis des billigsten Songs anzeigen
SELECT Songtitel, Kaufpreis FROM SONGS
WHERE Kaufpreis = (SELECT MIN(Kaufpreis) AS "billigster Song" FROM SONGS);

--Auflistung von Titel und Preisen vom billigsten zum teuersten Song
SELECT Songtitel, Kaufpreis FROM SONGS
ORDER BY Kaufpreis; 


--Den Durchschnittlichen Kaufpreis anzeigen
SELECT AVG(Kaufpreis) AS "Durchschnitlicher Songpreis" FROM SONGS;


--Listen Abfrage der Songs nach Interpret(Kuenstlername) anzeigen
SELECT Kuenstlername, Songtitel FROM SONGS 
JOIN INTERPRETS ON IID=Interpret
--WHERE  Kuenstlername = ''/*Abfrage nach Bestimmtem Interpret*/
ORDER BY Kuenstlername;


--Abfrage der Songs nach Genres anzeigen
SELECT Songtitel, Genrename FROM SONGS 
JOIN GENRES ON GID=Genre
--WHERE Genrename = ''/*Abfrage nach Bestimmtem Genre*/
ORDER BY Genrename;


--Abfrage der Songs nach Herkunftsland anzeigen
SELECT Songtitel, Land FROM SONGS 
JOIN LAENDER ON Herkunftsland=LID
--WHERE Land = ''/*Abfrage nach Bestimmtem Land*/
ORDER BY Land;


--Abfrage der Songs nach best bewertetsten anzeigen
SELECT Songtitel, Bewertung FROM SONGS AS s
LEFT JOIN (SELECT SID, AVG(Bewertung) AS Bewertung FROM KAUF_SONGBESITZ AS k
LEFT JOIN BENUTZERBEWERTUNG AS b ON b.KID=k.KID
GROUP BY SID) AS b ON b.SID=s.SID
--WHERE Songtitel = 'Lost Will'
ORDER BY Bewertung DESC;


--Persönliche Bewertungen der Benutzer für Songs anzeigen
SELECT Benutzername, Songtitel, Bewertung FROM BENUTZER AS b
JOIN KAUF_SONGBESITZ AS k ON b.BID=k.BID
JOIN SONGS AS s ON k.SID=s.SID
JOIN BENUTZERBEWERTUNG AS w ON w.KID=k.KID


/*Zusätzlich*/

--Playlists mit dazu gehörigen Songs
SELECT Playlistname, Songtitel FROM PLAYLISTS AS p
JOIN BENUTZER_PLAYLIST AS bp ON bp.PID=p.PID
JOIN KAUF_SONGBESITZ AS k ON k.KID=bp.KID
JOIN SONGS AS s ON k.SID=s.SID


--Benutzer samt Adressen anzeigen
SELECT Benutzername, Email, Vorname, Nachname, Strasse, PLZ, Ort, l.Land FROM BENUTZER
LEFT JOIN ADRESSEN AS a ON Adresse=AID
JOIN  LAENDER AS l ON a.Land=l.LID


--Alle Songs mit dazu gehörigen JOINs
SELECT Songtitel, Erscheinungsjahr, Kuenstlername AS Interpret, Dauer AS "Dauer in Sek", Genrename AS Genre, Land, Kaufpreis, Benutzername AS Ersteller, Bewertung FROM SONGS AS s
LEFT JOIN INTERPRETS ON Interpret=IID
LEFT JOIN GENRES ON Genre=GID
LEFT JOIN LAENDER ON Herkunftsland=LID
LEFT JOIN BENUTZER ON Ersteller=BID
LEFT JOIN (SELECT SID, AVG(Bewertung) AS Bewertung FROM KAUF_SONGBESITZ AS k
LEFT JOIN BENUTZERBEWERTUNG AS b ON b.KID=k.KID
GROUP BY SID) AS b ON b.SID=s.SID;







/*
SELECT * FROM INTERPRETS
SELECT * FROM GENRES
SELECT * FROM KAUF_SONGBESITZ
SELECT * FROM SONGS
SELECT * FROM ALBUM
SELECT * FROM ADRESSEN
SELECT * FROM LAENDER
SELECT * FROM PLAYLISTS
SELECT * FROM BENUTZER
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
SELECT * FROM 
*/
