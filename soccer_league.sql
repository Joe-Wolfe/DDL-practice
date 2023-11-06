DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    mascot TEXT NOT NULL,
    logo TEXT NOT NULL
);

CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL
);

CREATE TABLE game (
    id SERIAL PRIMARY kEY,
    season INTEGER REFERENCES season ON DELETE CASCADE,
    home_team INTEGER REFERENCES teams ON DELETE CASCADE,
    away_team INTEGER REFERENCES teams ON DELETE CASCADE,
    score TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team INTEGER REFERENCES Teams ON DELETE CASCADE,
    salary TEXT NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE CASCADE,
    assist INTEGER REFERENCES players ON DELETE SET NULL,
    game INTEGER REFERENCES game ON DELETE CASCADE
);

CREATE TABLE referee(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    game INTEGER REFERENCES game ON DELETE CASCADE
);

INSERT INTO teams (name, mascot, logo) VALUES
('team1','mascot1', 'logo1'),
('team2','mascot2', 'logo2'),
('team3','mascot3', 'logo3'),
('team4','mascot4', 'logo4'),
('team5','mascot5', 'logo5');

INSERT INTO season(start_date,end_date) VALUES
('2001-01-01','2001-12-31'),
('2002-01-01','2002-12-31'),
('2003-01-01','2003-12-31'),
('2004-01-01','2004-12-31'),
('2005-01-01','2005-12-31');

INSERT INTO game(season, home_team, away_team, score) VALUES
(1,1,2,'1-1'),
(2,2,3,'2-3'),
(3,3,4,'3-4'),
(4,4,5,'4-5'),
(5,5,1,'5-1');

INSERT INTO players(first_name, last_name, team, salary) VALUES
('john1', 'doe1', 1, '$100000'),
('john2', 'doe2', 2, '$200000'),
('john3', 'doe3', 3, '$300000'),
('john4', 'doe4', 4, '$400000'),
('john5', 'doe5', 5, '$500000');

INSERT INTO goals (player, assist, game) VALUES
(1,2,1),
(2,3,2),
(3,4,3),
(4,5,4),
(5,1,5);

INSERT INTO referee (first_name,last_name,game) VALUES
('john1', 'doe1', 1),
('john2', 'doe2', 2),
('john3', 'doe3', 3),
('john4', 'doe4', 4),
('john5', 'doe5', 5);
