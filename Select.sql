
-- Задание 2

SELECT name_track, time_track
FROM track
ORDER BY time_track DESC
LIMIT 1;

SELECT name_track, time_track
FROM track
WHERE time_track >= '00:03:30';

SELECT name_collection, year_issue 
FROM collection
WHERE EXTRACT(YEAR FROM year_issue) between 2018 and 2020;

SELECT name_artist
FROM artist
WHERE name_artist NOT LIKE '% %';

SELECT name_track
FROM track
WHERE name_track LIKE '%мой%' OR name_track LIKE '%my%';

-- Задание 3

SELECT COUNT(*) as total_tracks
FROM track
JOIN album ON track.id_album = album.id_album
WHERE extract(year from album.year_album) BETWEEN 2019 AND 2022;

SELECT album.id_album, album.name_album, AVG(track.time_track) as average_duration
FROM track
JOIN album ON track.id_album = album.id_album
GROUP BY album.id_album, album.name_album;

SELECT artist.name_artist
FROM artist
WHERE artist.id_artist NOT IN (
    SELECT album.id_album
    FROM album
    WHERE extract(YEAR from album.year_album) = 2020
);


SELECT collection.name_collection
FROM collection
JOIN collection_track ON collection.id_collection = collection_track.id_collection
JOIN track ON collection_track.id_track = track.id_track
JOIN album ON track.id_album = album.id_album
JOIN artist ON album.id_album = artist.id_artist
WHERE artist.name_artist = 'Фредди Меркьюри';

