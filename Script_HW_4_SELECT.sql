1

SELECT genre_name, COUNT (Musician_id) FROM music_genre_list mgl
LEFT JOIN Genre_musician gm ON gm.genre_id = mgl.genre_id
GROUP BY mgl.genre_id;

2 

SELECT COUNT (Trek_id) FROM Trek_list tl
WHERE Album_id IN (SELECT Album_id FROM Album_list
       WHERE release_year IN ('2019', '2020'));

3

SELECT album_name, AVG (trek_length) FROM album_list al
JOIN trek_list tl ON al.album_id = tl.album_id
GROUP BY al.Album_id;

4
          
SELECT DISTINCT Musician_name FROM Musician_list ml
LEFT JOIN musician_album ma ON ma.musician_id  = ml.musician_id
LEFT JOIN Album_list al ON al.album_id = ma.album_id
WHERE release_year != 2020;
      
5

SELECT DISTINCT collection_name FROM Collection c
LEFT JOIN Collection_trek ct ON ct.collection_id = c.collection_id
LEFT JOIN trek_list tl ON tl.trek_id = ct.trek_id
LEFT JOIN musician_album ma ON ma.album_id = tl.album_id
LEFT JOIN musician_list ml ON ml.musician_id = ma.musician_id
WHERE musician_name ILIKE 'Ella F';
            
6
            
SELECT album_name FROM album_list al 
LEFT JOIN musician_album ma ON ma.album_id = al.album_id
LEFT JOIN genre_musician gm ON gm.musician_id = ma.musician_id
GROUP BY al.album_id
HAVING COUNT (DISTINCT genre_id) > 1; 

7
 
SELECT trek_name FROM trek_list tl
LEFT JOIN collection_trek cl ON cl.trek_id = tl.trek_id
WHERE cl.trek_id IS NULL; 

8
     
SELECT musician_name, trek_length FROM musician_list ml
LEFT JOIN musician_album ma ON ma.musician_id = ml.musician_id
LEFT JOIN trek_list tl ON tl.album_id = ma.album_id
WHERE trek_length IN (SELECT min (trek_length) FROM trek_list);
    

9

SELECT album_name FROM album_list
WHERE album_id in (
    SELECT album_id FROM trek_list
    GROUP BY album_id
    HAVING COUNT(trek_id) = (
        SELECT COUNT(trek_id) FROM trek_list
        GROUP BY album_id
        ORDER BY count(trek_id) 
        LIMIT 1)); 
        
SELECT album_name, COUNT(trek_id) FROM album_list al
JOIN trek_list tl ON tl.album_id = al.album_id
GROUP BY album_name, al.album_id 
HAVING COUNT(tl.trek_id) = (
        SELECT COUNT(trek_id) FROM trek_list
        GROUP BY album_id
        ORDER BY count(trek_id) 
        LIMIT 1);
       



      
