
-- Lesson 2: DDL and DML Commands

-- Basic-Level Tasks
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Ali', 6500.00);
INSERT INTO Employees (EmpID, Name, Salary) VALUES (2, 'Laylo', 6000.00), (3, 'Temur', 5500.00);

UPDATE Employees SET Salary = 7000 WHERE EmpID = 1;

DELETE FROM Employees WHERE EmpID = 2;

-- DELETE: Removes specific rows, can use WHERE.
-- TRUNCATE: Removes all rows, faster, no WHERE.
-- DROP: Deletes the table completely.

ALTER TABLE Employees ALTER COLUMN Name VARCHAR(100);

ALTER TABLE Employees ADD Department VARCHAR(50);

ALTER TABLE Employees ALTER COLUMN Salary FLOAT;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

TRUNCATE TABLE Employees;

-- Intermediate-Level Tasks
CREATE TABLE TempDepartments (ID INT, Name VARCHAR(50));
INSERT INTO TempDepartments VALUES (1, 'HR'), (2, 'IT'), (3, 'Marketing'), (4, 'Finance'), (5, 'Operations');

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT ID, Name FROM TempDepartments;

UPDATE Employees SET Department = 'Management' WHERE Salary > 5000;

TRUNCATE TABLE Employees;

ALTER TABLE Employees DROP COLUMN Department;

EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;

-- Advanced-Level Tasks
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Description VARCHAR(100)
);

ALTER TABLE Products ADD CONSTRAINT chk_Price CHECK (Price > 0);

ALTER TABLE Products ADD StockQuantity INT DEFAULT 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description) VALUES 
(1, 'Laptop', 'Electronics', 1500.00, 'Gaming laptop'),
(2, 'Mouse', 'Electronics', 25.00, 'Wireless mouse'),
(3, 'Table', 'Furniture', 100.00, 'Wooden table'),
(4, 'Chair', 'Furniture', 45.00, 'Office chair'),
(5, 'Pen', 'Stationery', 1.50, 'Blue ink pen');

SELECT * INTO Products_Backup FROM Products;

EXEC sp_rename 'Products', 'Inventory';

ALTER TABLE Inventory ALTER COLUMN Price FLOAT;

ALTER TABLE Inventory ADD ProductCode INT IDENTITY(1000, 5);
