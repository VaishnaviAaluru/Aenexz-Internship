CREATE DATABASE db1;
USE db1;
CREATE TABLE Customers (CId INT PRIMARY KEY,CName VARCHAR(50));

CREATE TABLE Orders (OId INT PRIMARY KEY,CId INT);
INSERT INTO Customers VALUES(1,'Alice'),(2,'Bob'),(3,'Charlie');
INSERT INTO Orders VALUES(101,1),(102,2);
INSERT INTO Orders VALUES (103,4);
SELECT c.CId,c.CName,o.OId FROM Customers c INNER JOIN Orders o ON c.CId = o.CId;
SELECT c.CId,c.CName,o.OId FROM Customers c LEFT JOIN Orders o ON c.CId = o.CId;
SELECT o.OId,o.CId FROM Orders o LEFT JOIN Customers c ON o.CId = c.CId WHERE c.CId IS NULL;
SELECT c.CId,c.CName,o.OId FROM Customers c LEFT JOIN Orders o ON c.CId = o.CId UNION SELECT c.CId,c.CName,o.OId FROM Customers c RIGHT JOIN Orders o ON c.CId = o.CId;
INSERT INTO Orders VALUES (104,1);
SELECT c.CId,c.CName,COUNT(o.OId) AS TotalOrders FROM Customers c LEFT JOIN Orders o ON c.CId = o.CId GROUP BY c.CId, c.CName;