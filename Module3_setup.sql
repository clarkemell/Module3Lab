CREATE DATABASE IF NOT EXISTS northern_grounds;
USE northern_grounds;
DROP TABLE IF EXISTS Purchase;
DROP TABLE IF EXISTS Drink;
DROP TABLE IF EXISTS Shop;
CREATE TABLE Shop (
ShopID INT AUTO_INCREMENT PRIMARY KEY,
ShopName VARCHAR(100),
Neighborhood VARCHAR(100)
);
CREATE TABLE Drink (
DrinkID INT AUTO_INCREMENT PRIMARY KEY,
DrinkName VARCHAR(100),
Price DECIMAL(8,2),
ShopID INT,
FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);
CREATE TABLE Purchase (
PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
DrinkID INT,
PurchaseDate DATE,
Quantity INT,
FOREIGN KEY (DrinkID) REFERENCES Drink(DrinkID)
);
INSERT INTO Shop (ShopName, Neighborhood) VALUES
('Uptown Roasters', 'Uptown'),
('Dinkytown Drip', 'Dinkytown'),
('Grand Avenue Grind', 'Grand Avenue');
INSERT INTO Drink (DrinkName, Price, ShopID) VALUES
('Drip Coffee', 2.50, 1),
('Latte', 4.00, 1),
('Cold Brew', 3.75, 2),
('Mocha', 4.50, 2),
('Chai Latte', 4.25, 3),
('Americano', 3.00, 3);
INSERT INTO Purchase (DrinkID, PurchaseDate, Quantity) VALUES
(1, '2026-06-01', 12),
(1, '2026-06-02', 8),
(2, '2026-06-01', 15),
(3, '2026-06-01', 10),
(4, '2026-06-02', 20),
(5, '2026-06-01', 5),
(5, '2026-06-02', 9),
(6, '2026-06-02', 14);