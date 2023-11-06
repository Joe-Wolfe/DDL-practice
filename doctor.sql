DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    contact TEXT NOT NULL
);

CREATE TABLE patient (
    id SERIAL PRIMARY kEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    contact TEXT NOT NULL
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    symptoms TEXT NOT NULL,
    treatments TEXT NOT NULL
);

CREATE TABLE doctors_visit (
    id SERIAL PRIMARY KEY ,
    doctor_id INTEGER REFERENCES doctor ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patient ON DELETE CASCADE,
    diagnosis INTEGER REFERENCES diagnosis ON DELETE SET NULL
);

INSERT INTO DOCTOR (first_name, last_name, contact) VALUES
('Dr.', 'Worm', 'apple@AOL.com'),
('Dr.', 'Who', '911');

INSERT INTO patient(first_name, last_name, contact) VALUES
('John', 'Doe', '333-123-1234'),
('Jane', 'Smith', 'UNKOWN');

INSERT INTO diagnosis(name, symptoms, treatments) VALUES
('flu', 'aches and pains, fever, fatigue', 'vitamin C'),
('Death', 'No pulse, Heart rate 0bpm', 'Prayer');

INSERT INTO doctors_visit (doctor_id, patient_id, diagnosis) VALUES
(2,1,2),
(1,2,1);