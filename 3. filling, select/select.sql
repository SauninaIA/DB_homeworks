SELECT name, year_release FROM albums
WHERE year_release = 2018;

SELECT name, duration FROM tracks
ORDER BY duration DESC
LIMIT 1;

SELECT name FROM tracks
WHERE duration >= 210;

SELECT name FROM collections
WHERE year_release BETWEEN 2018 AND 2020;

SELECT name FROM singers
WHERE (LENGTH(name) - LENGTH(replace(name, ' ', ''))) = 0;

SELECT name FROM tracks
WHERE LOWER(tracks.name) LIKE '%my%' OR name LIKE '%мой%';