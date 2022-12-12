CREATE TABLE IF NOT EXISTS Music_genre_list (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(30) NOT NULL
	);

CREATE TABLE IF NOT EXISTS Musician_list (
	musician_id SERIAL PRIMARY KEY,
	musician_name VARCHAR(30) NOT NULL
	);

CREATE TABLE IF NOT EXISTS Genre_musician (
	genre_id INTEGER REFERENCES Music_genre_list(genre_id),
	musician_id INTEGER REFERENCES Musician_list(musician_id),
	CONSTRAINT Gen_mus_ID PRIMARY KEY (genre_id, musician_id)
    );

CREATE TABLE IF NOT EXISTS Album_list (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(50) NOT null,
	release_year INTEGER NOT null
	);

CREATE TABLE IF NOT EXISTS Musician_album (
	album_id INTEGER REFERENCES Album_list(album_id),
	musician_id INTEGER REFERENCES Musician_list(musician_id),
	CONSTRAINT Mus_Al_ID PRIMARY KEY (album_id, musician_id)
	);

CREATE TABLE IF NOT EXISTS Trek_list (
	trek_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Album_list (album_id),
	trek_name VARCHAR(50) NOT null,
	trek_length TIME NOT null
	);

CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(50) NOT null,
	release_year INTEGER NOT null
	);

CREATE TABLE IF NOT EXISTS Collection_trek (
	collection_id INTEGER REFERENCES Collection (collection_id),
	trek_id INTEGER REFERENCES Trek_list(trek_id),
	CONSTRAINT Coll_tr_ID PRIMARY KEY (collection_id, trek_id)
	);
