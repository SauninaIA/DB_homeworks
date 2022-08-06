--количество исполнителей в каждом жанре;
SELECT name, COUNT(*) 
  FROM genres AS g
	   JOIN genre_singer AS gs 
	     ON g.id = gs.id_genre
 GROUP BY name
 ORDER BY COUNT(*);

--количество треков, вошедших в альбомы 2018-2020 годов
SELECT COUNT(*) 
  FROM tracks AS t
       JOIN albums AS a 
         ON a.id = t.id_album
 WHERE year_release BETWEEN 2018 AND 2020;

--средняя продолжительность треков по каждому альбому;
SELECT a.name, AVG(duration) 
  FROM tracks AS t
       JOIN albums AS a 
         ON a.id = t.id_album
 GROUP BY a.name;

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT s.name 
  FROM album_singer AS a_s
       JOIN albums AS a 
         ON a_s.id_album = a.id
       JOIN singers AS s 
         ON a_s.id_singer = s.id
 WHERE year_release != 2020
 GROUP BY s.name;

--названия сборников, в которых присутствует Terry Adams;
SELECT c.name 
  FROM collection_track AS ct
       JOIN collections AS c 
         ON ct.id_collection = c.id
       JOIN tracks AS t 
         ON ct.id_track = t.id
       JOIN album_singer AS as2 
         ON t.id_album = as2.id_album
       JOIN singers AS s 
         ON as2.id_singer = s.id
 WHERE s.name = 'Terry Adams'
 GROUP BY c.name, s.name;

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.name
  FROM albums AS a
       JOIN album_singer AS as2 
         ON a.id = as2.id_album
       JOIN singers AS s 
         ON as2.id_singer = s.id
       JOIN genre_singer AS gs 
         ON s.id = gs.id_singer
       JOIN genres AS g 
         ON gs.id_genre = g.id
 GROUP BY a.name
HAVING COUNT(g.name) > 1;
       
--наименование треков, которые не входят в сборники;
SELECT t.name 
  FROM tracks AS t
       LEFT JOIN collection_track AS ct 
              ON t.id = ct.id_track
 WHERE ct.id_track IS NULL;
 
--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT t.name, duration, s.name 
  FROM tracks AS t 
       JOIN albums AS a 
         ON t.id_album = a.id
       JOIN album_singer AS as2 
         ON a.id = as2.id_album
       JOIN singers AS s 
         ON s.id = as2.id_singer
 WHERE duration = (SELECT MIN(duration) FROM tracks);

--название альбомов, содержащих наименьшее количество треков
SELECT a.name, COUNT(t.name) 
  FROM tracks AS t 
       JOIN albums AS a 
         ON t.id_album = a.id
 GROUP BY a.name
HAVING COUNT(t.name) = (
       SELECT COUNT(a.name) 
         FROM tracks AS t 
              JOIN albums AS a 
                ON t.id_album = a.id
        GROUP BY a.name
        ORDER BY COUNT(t.name) 
        LIMIT 1);