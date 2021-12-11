DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;

\c craigslist_db;


CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    region VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL
);

CREATE TABLE users_region (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(500) NOT NULL,
    location VARCHAR(50) NOT NULL,
    region_id INTEGER REFERENCES region ON DELETE SET NULL         
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    cat_name VARCHAR(12) UNIQUE NOT NULL
);

CREATE TABLE posts_categories (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    cat_id INTEGER REFERENCES categories ON DELETE CASCADE
);



INSERT INTO region (region)
VALUES
('Metro-Boston'),
('Lower-Silesia'),
('Bavaria'),
('Northern-VT'),
('Dolomites');

INSERT INTO users (username, password)
VALUES
('jsmith012', 'blah1234*'),
('burritoluvr98', '785df&sdE'),
('silverwolf01', 'kittens123'),
('rmcdonald124', 'worst_password_ever'),
('catz_1984', '1984MJK*');

INSERT INTO users_region (user_id, region_id)
VALUES
(2, 1),
(4, 4),
(4, 3),
(2, 2),
(1, 5);

INSERT INTO posts (user_id, title, content, location, region_id)
VALUES
(2, 'Rabbit needs home', 'Found a rabbit. Needs a home. Call 999-999-9999 for details.', 'Wellesley', 1),
(1, 'Free nintendo', 'Pick up only', 'Arlington', 1),
(4, 'Bartenders Needed - Make $3k Per night!', 'Looking for experienced waitstaff at 4-star restaurant', 'Berlin', 4),
(4, 'Looking for lost aligator', 'My aligator escaped, here is a picture. Please call 999-999-9999 if found', 'Burlington', 4),
(3, 'Didgeridoo player wanted', 'We are looking for a didgeridoo player to add to our band. Only experienced professionals preferred.', 'Wroclaw', 2);

INSERT INTO categories (cat_name)
VALUES
('Pets'),
('Free Things'),
('Jobs'),
('Gigs');

INSERT INTO posts_categories (post_id, cat_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4);



