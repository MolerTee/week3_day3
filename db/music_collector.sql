DROP TABLE IF EXISTS albums , artists;

CREATE TABLE artists (
  id serial8 primary key,
  name VARCHAR (255)
);

CREATE TABLE albums (
  id serial8 primary key,
  name VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT8 references artists(id)
);