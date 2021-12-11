-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE star
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE moon
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE planets_star 
(
  id SERIAL PRIMARY KEY,
  p_id INTEGER REFERENCES planets ON DELETE CASCADE,
  s_id INTEGER REFERENCES star ON DELETE CASCADE
);

CREATE TABLE planets_moon 
(
  id SERIAL PRIMARY KEY,
  p_id INTEGER REFERENCES planets ON DELETE CASCADE,
  m_id INTEGER REFERENCES moon ON DELETE CASCADE
);

CREATE TABLE planets_star_galaxy 
(
  id SERIAL PRIMARY KEY,
  p_id INTEGER REFERENCES planets ON DELETE CASCADE,
  s_id INTEGER REFERENCES star ON DELETE CASCADE,
  g_id INTEGER REFERENCES galaxy ON DELETE CASCADE
);


INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);

INSERT INTO star
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxy
  (name)
VALUES
  ('Milky Way');

INSERT INTO moon
  (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('roteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');


INSERT INTO planets_star
  (p_id, s_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 3);

INSERT INTO planets_moon
  (p_id, m_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3),
  (4, 4),
  (4, 5),
  (4, 6),
  (4, 7),
  (4, 8),
  (4, 9),
  (4, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14);

INSERT INTO planets_star_galaxy
  (p_id, s_id, g_id)
VALUES
  (1, 1, 1),
  (2, 1, 1),
  (3, 1, 1),
  (4, 2, 1),
  (5, 3, 1);