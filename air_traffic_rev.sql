-- from the terminal run:
-- psql < air_traffic_rev.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL  
);


CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  airline TEXT UNIQUE NOT NULL
);


CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  city TEXT UNIQUE NOT NULL
);


CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  country TEXT UNIQUE NOT NULL
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  psgr_id INTEGER REFERENCES passengers ON DELETE CASCADE,
  airline_id INTEGER REFERENCES airline ON DELETE CASCADE,
  from_city INTEGER REFERENCES city ON DELETE CASCADE,
  from_country INTEGER REFERENCES country ON DELETE CASCADE,
  to_city INTEGER REFERENCES city ON DELETE CASCADE,
  to_country INTEGER REFERENCES country ON DELETE CASCADE
);



INSERT INTO passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');


INSERT INTO airline (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO city (city)
VALUES
  ('Washington DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Sao Paolo'),
  ('London'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Casablanca'),
  ('Beijing'),
  ('Chicago'),
  ('New Orleans'),
  ('Santiago');

INSERT INTO country (country)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');


INSERT INTO tickets
  (seat, departure, arrival, psgr_id, airline_id, from_city, from_country, to_city, to_country)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 1, 4, 1),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 2, 11, 6),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 3, 1, 12, 1),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 4, 3, 4, 1, 13, 7),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5, 4, 5, 3, 14, 8),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 6, 5, 6, 4, 15, 9),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 1, 7, 1, 9, 1),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 8, 6, 8, 1, 16, 1),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 9, 6, 9, 1, 17, 1),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 10, 7, 10, 5, 18, 10);