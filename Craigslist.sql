DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY kEY,
    name TEXT NOT NULL,
    time_zone TEXT NOT NULL
);

CREATE TABLE username (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL, 
    region_pref INTEGER REFERENCES regions ON DELETE SET NULL
);



CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    region INTEGER REFERENCES regions ON DELETE CASCADE,
    username INTEGER REFERENCES username ON DELETE SET NULL,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    category TEXT NOT NULL
);


INSERT INTO regions (name, time_zone) VALUES
('New England', 'EST'),
('Texas', 'CST');



INSERT INTO username (username,password,region_pref) VALUES
('User1', 'password', 1),
('User2', 'qwertyuiop', 2);

INSERT INTO post (region, username,title,text, category) VALUES
(1,1, 'Fresh blueberries', 'taste good!', 'food'),
(2,2, 'Duststorms!', 'There is sand everywhere', 'weather');

