DROP DATABASE med_ctr_db;
CREATE DATABASE med_ctr_db;

\c med_ctr_db;


CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    malady TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diag_patients (
    id SERIAL PRIMARY KEY,
    diag_id INTEGER REFERENCES diagnoses ON DELETE CASCADE,
    pat_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    pat_id INTEGER REFERENCES patients ON DELETE CASCADE,
    doc_id INTEGER REFERENCES doctors ON DELETE CASCADE
);


CREATE TABLE med_facility (
    id SERIAL PRIMARY KEY,
    fac_name VARCHAR(10) UNIQUE NOT NULL,
    street_address VARCHAR(30) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip INTEGER NOT NULL CHECK (zip > 0 AND zip < 99999)
);

CREATE TABLE medical_center_doctors (
    id SERIAL PRIMARY KEY,
    fac_id INTEGER REFERENCES med_facility ON DELETE CASCADE,
    doc_id INTEGER REFERENCES doctors ON DELETE CASCADE
);



INSERT INTO diagnoses (malady)
VALUES
('COVID19'),
('Mumps'),
('Measles'),
('Cooties'),
('Germs');

INSERT INTO patients (first_name, last_name)
VALUES
('Ronald', 'McDonald'),
('Melissa', 'Jones'),
('Patty', 'Silverman'),
('Jeremy', 'Fitzgerald'),
('Gene', 'Simmons');

INSERT INTO diag_patients (diag_id, pat_id)
VALUES
(2, 1),
(4, 4),
(4, 3),
(2, 2),
(1, 5);

INSERT INTO doctors (first_name, last_name)
VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Sal', 'Dali'),
('Joey', 'White'),
('Diane', 'Smith');

INSERT INTO doctors_patients (pat_id, doc_id)
VALUES
(2, 1),
(4, 1),
(1, 3),
(2, 2),
(5, 5);

INSERT INTO med_facility (fac_name, street_address, city, state, zip)
VALUES
('MGH', '35 Fruit St', 'Boston', 'MA', 01234),
('Lowell Gen', '100 Main St', 'Lowell', 'MA', 01810);

INSERT INTO medical_center_doctors (fac_id, doc_id)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 2),
(2, 5);



