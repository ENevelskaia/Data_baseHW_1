SELECT Album_name, release_year  FROM Album_list
WHERE release_year = 2018;

SELECT Trek_name, trek_length FROM Trek_list
ORDER by trek_length DESC
LIMIT 1;

SELECT Trek_name FROM Trek_list
WHERE trek_length >= '3:30:00';

SELECT Collection_name FROM Collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT Musician_name FROM Musician_list
WHERE Musician_name NOT LIKE '% %';

SELECT Trek_name FROM Trek_list
WHERE Trek_name LIKE 'My %';
