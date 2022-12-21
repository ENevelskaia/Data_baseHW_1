CREATE TABLE IF NOT EXISTS Music_genre_list (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(30) NOT NULL UNIQUE
	);

CREATE TABLE IF NOT EXISTS Musician_list (
	Musician_id SERIAL PRIMARY KEY,
	Musician_name VARCHAR(30) NOT NULL
	);

CREATE TABLE IF NOT EXISTS Genre_musician (
	genre_id INTEGER REFERENCES Music_genre_list(genre_id),
	musician_id INTEGER REFERENCES Musician_list(Musician_id),
	CONSTRAINT Gen_mus_ID PRIMARY KEY (genre_id, musician_id)
    );

CREATE TABLE IF NOT EXISTS Album_list (
	Album_id SERIAL PRIMARY KEY,
	Album_name VARCHAR(50) NOT null,
	release_year INTEGER CHECK (release_year between 1900 and 2022) NOT null
	);

CREATE TABLE IF NOT EXISTS Musician_album (
	album_id INTEGER REFERENCES Album_list(Album_id),
	musician_id INTEGER REFERENCES Musician_list(Musician_id),
	CONSTRAINT Mus_Al_ID PRIMARY KEY (album_id, musician_id)
	);

CREATE TABLE IF NOT EXISTS Trek_list (
	Trek_id SERIAL PRIMARY KEY,
	Album_id INTEGER NOT NULL REFERENCES Album_list (Album_id),
	Trek_name VARCHAR(50) NOT null,
	trek_length TIME CHECK (trek_length between 00:00:01 and 01:00:00) NOT null
	);

CREATE TABLE IF NOT EXISTS Collection (
	Collection_id SERIAL PRIMARY KEY,
	Collection_name VARCHAR(50) NOT null,
	release_year INTEGER CHECK (release_year between 1900 and 2022) NOT null
	);

CREATE TABLE IF NOT EXISTS Collection_trek (
	collection_id INTEGER REFERENCES Collection (Collection_id),
	trek_id INTEGER REFERENCES Trek_list(Trek_id),
	CONSTRAINT Coll_tr_ID PRIMARY KEY (collection_id, trek_id)
	);
