DROP DATABASE IF EXISTS retro_replay;
CREATE DATABASE retro_replay;
USE retro_replay;

DROP TABLE IF EXISTS TradeIn;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Console;

CREATE TABLE Console (
ConsoleID INT AUTO_INCREMENT PRIMARY KEY,
ConsoleName VARCHAR(100),
Manufacturer VARCHAR(100),
ReleaseYear INT
);

CREATE TABLE Game (
GameID INT AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR(150),
Genre VARCHAR(50),
Price DECIMAL(6,2),
ConsoleID INT,
FOREIGN KEY (ConsoleID) REFERENCES Console(ConsoleID)
);

CREATE TABLE TradeIn (
TradeInID INT AUTO_INCREMENT PRIMARY KEY,
GameID INT,
CustomerName VARCHAR(100),
TradeInDate DATE,
CreditAmount DECIMAL(6,2),
FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

INSERT INTO Console (ConsoleName, Manufacturer, ReleaseYear) VALUES
('Super Nintendo', 'Nintendo', 1991),
('Sega Genesis', 'Sega', 1989),
('PlayStation', 'Sony', 1994);

INSERT INTO Game (Title, Genre, Price, ConsoleID) VALUES
('Chrono Trigger', 'RPG', 45.00, 1),
('Super Metroid', 'Platformer', 40.00, 1),
('Duck Hunt', 'Shooter', 12.00, 1),
('Street Fighter II', 'Fighting', 30.00, 1),
('Sonic the Hedgehog', 'Platformer', 20.00, 2),
('Final Fantasy VII', 'RPG', 50.00, 3);

INSERT INTO TradeIn (GameID, CustomerName, TradeInDate, CreditAmount) VALUES
(1, 'Maya Chen', '2026-08-01', 15.00),
(4, 'Devon Brooks', '2026-08-03', 10.00);