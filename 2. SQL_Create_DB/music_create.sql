CREATE TABLE IF NOT EXISTS genres (
           id SERIAL PRIMARY KEY,
         name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS singers (
	       id SERIAL PRIMARY KEY,
         name VARCHAR(30) NOT NULL	
);

CREATE TABLE IF NOT EXISTS albums (
	       id SERIAL PRIMARY KEY,
	     name VARCHAR(30) NOT NULL,
 year_release INTEGER
);

CREATE TABLE IF NOT EXISTS tracks (
	       id SERIAL PRIMARY KEY,
	     name VARCHAR(30) NOT NULL,
     duration INTEGER,
     id_album INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS collections (
 	       id SERIAL PRIMARY KEY,
 	     name VARCHAR(30) NOT NULL,
 year_release INTEGER
);

CREATE TABLE IF NOT EXISTS genre_singer (
     id_genre INTEGER REFERENCES genres(id),
    id_singer INTEGER REFERENCES singers(id),
   CONSTRAINT gs PRIMARY KEY (id_genre,  id_singer)
);

CREATE TABLE IF NOT EXISTS album_singer (
     id_album INTEGER REFERENCES albums(id),
    id_singer INTEGER REFERENCES singers(id),
   CONSTRAINT a_s PRIMARY KEY (id_album,  id_singer)
);

CREATE TABLE IF NOT EXISTS collection_track (
id_collection INTEGER REFERENCES collections(id),
    id_track INTEGER REFERENCES tracks(id),
   CONSTRAINT ct PRIMARY KEY (id_collection,  id_track)
);