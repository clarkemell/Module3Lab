DROP DATABASE IF EXISTS wkrc;
CREATE DATABASE wkrc;
USE wkrc;

DROP TABLE IF EXISTS RequestSongs2NF;
DROP TABLE IF EXISTS Requests2NF;
DROP TABLE IF EXISTS Requests1NF;
DROP TABLE IF EXISTS RequestsFlat;

CREATE TABLE RequestsFlat (
RequestID INT PRIMARY KEY,
ListenerName VARCHAR(100),
ListenerPhone VARCHAR(20),
Song1Title VARCHAR(150),
Song1Artist VARCHAR(100),
Song2Title VARCHAR(150),
Song2Artist VARCHAR(100)
);

INSERT INTO RequestsFlat VALUES
(1, 'Priya Shah', '555-0201', 'Landslide', 'Fleetwood Mac', 'Africa', 'Toto'),
(2, 'Sam Okafor', '555-0202', 'Superstition', 'Stevie Wonder', NULL, NULL),
(3, 'Priya Shah', '555-0201', 'Sweet Dreams', 'Eurythmics', 'Take On Me', 'a-ha');

CREATE TABLE Requests1NF (
RequestID INT,
ListenerName VARCHAR(100),
ListenerPhone VARCHAR(20),
SongTitle VARCHAR(150),
SongArtist VARCHAR(100)
);

INSERT INTO Requests1NF VALUES
(1, 'Priya Shah', '555-0201', 'Landslide', 'Fleetwood Mac'),
(1, 'Priya Shah', '555-0201', 'Africa', 'Toto'),
(2, 'Sam Okafor', '555-0202', 'Superstition', 'Stevie Wonder'),
(3, 'Priya Shah', '555-0201', 'Sweet Dreams', 'Eurythmics'),
(3, 'Priya Shah', '555-0201', 'Take On Me', 'a-ha');

CREATE TABLE Requests2NF (
RequestID INT PRIMARY KEY,
ListenerName VARCHAR(100),
ListenerPhone VARCHAR(20)
);

INSERT INTO Requests2NF VALUES
(1, 'Priya Shah', '555-0201'),
(2, 'Sam Okafor', '555-0202'),
(3, 'Priya Shah', '555-0201');

CREATE TABLE RequestSongs2NF (
RequestSongID INT AUTO_INCREMENT PRIMARY KEY,
RequestID INT,
SongTitle VARCHAR(150),
SongArtist VARCHAR(100),
FOREIGN KEY (RequestID) REFERENCES Requests2NF(RequestID)
);

INSERT INTO RequestSongs2NF (RequestID, SongTitle, SongArtist) VALUES
(1, 'Landslide', 'Fleetwood Mac'),
(1, 'Africa', 'Toto'),
(2, 'Superstition', 'Stevie Wonder'),
(3, 'Sweet Dreams', 'Eurythmics'),
(3, 'Take On Me', 'a-ha');