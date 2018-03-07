/*
Projekt Kick-Off
Auftrag-Alpha
"eingeschränkt mehrbenutzerfähige MP3-Verwaltung" für Softwarehersteller erstellen.
von Team Alpha2
Nowlan Birbaumer und David Lehmann
*/

USE MP3_VERWALTUNG;
GO

SELECT MAX(Kaufpreis) FROM SONGS;

SELECT MIN(Kaufpreis) FROM SONGS;

SELECT AVG(Kaufpreis) FROM SONGS;



SELECT Songtitel, Kaufpreis FROM SONGS
WHERE Kaufpreis = (SELECT MAX(Kaufpreis)FROM SONGS);



SELECT * FROM SONGS
ORDER BY Kaufpreis DESC; 
--SELECT * FROM SONGS

SELECT MIN(Kaufpreis) FROM SONGS;

SELECT AVG(Kaufpreis) FROM SONGS;

SELECT * FROM SONGS 
WHERE Interpret = '';

SELECT * FROM SONGS 
JOIN GENRES ON Genrename=Genre
WHERE Genrename = '';

SELECT * FROM SONGS 
JOIN LAENDER ON Herkunftsland=LID
WHERE Land = '';

SELECT Songtitel, Bewertung FROM SONGS AS s 
LEFT JOIN (SELECT SID, AVG(Bewertung) AS Bewertung FROM BENUTZERBEWERTUNG
GROUP BY SID) AS b ON b.SID=s.SID
ORDER BY Bewertung DESC;

/*Zusatz




*/
