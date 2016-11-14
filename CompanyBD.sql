--exercise6
--Maryna Salii

--CREATE QUERIES

CREATE DATABASE	CompanyDB;

USE CompanyDB;

CREATE TABLE Plant
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Plant varchar(255)
);

CREATE TABLE Employee
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	FirstName varchar(255),
	LastName varchar(255),
	City varchar(255),
	Street varchar(255),
	PostalCode varchar(255),
	PhoneNumber int,
	PlantID int FOREIGN KEY REFERENCES Plant(ID)
);

CREATE TABLE Vehicle
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	VehicleType varchar(255)
);

CREATE TABLE PartType
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	PartType varchar(255)
);

CREATE TABLE VehiclePart
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	PartNumber varchar(255),
	VehicleID int FOREIGN KEY REFERENCES Vehicle(ID),
	PartTypeID int FOREIGN KEY REFERENCES PartType(ID)
);

CREATE TABLE Customer
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	CustomerName varchar(255)
);

CREATE TABLE PartOrder
(
	ID int IDENTITY(1,1) PRIMARY KEY,
	CustomerID int FOREIGN KEY REFERENCES Customer(ID),
	PartID int FOREIGN KEY REFERENCES VehiclePart(ID),
	EmployeeID int FOREIGN KEY REFERENCES Employee(ID),
	Time int 
);

--INSERT QUERIES

INSERT INTO Plant(Plant)
VALUES ('Guelph');

INSERT INTO Plant(Plant)
VALUES ('Waterloo');

INSERT INTO Employee(FirstName, LastName, City, Street, PostalCode, PhoneNumber, PlantID)
VALUES ('Joe', 'Glushchenko', 'Kitchener', 'Ashley Crt', 'NE4 TH5', 098765587, 1);

INSERT INTO Employee(FirstName, LastName, City, Street, PostalCode, PhoneNumber, PlantID)
VALUES ('Frank', 'Bosenko', 'Kitchener', 'Doon Valley', 'TE4 TH5', 577655987, 2);

INSERT INTO Employee(FirstName, LastName, City, Street, PostalCode, PhoneNumber, PlantID)
VALUES ('Mary', 'Reechardson', 'Waterloo', 'Hightlight', 'KR5 TH5', 897655987, 2);

INSERT INTO Employee(FirstName, LastName, City, Street, PostalCode, PhoneNumber, PlantID)
VALUES ('Gary', 'Bosenko', 'Kitchener', 'Doon Valley', 'TE4 TH5', 577655987, 1);

INSERT INTO Employee(FirstName, LastName, City, Street, PostalCode, PhoneNumber, PlantID)
VALUES ('John', 'Camp', 'Kitchener', 'Doon Valley', 'TE4 TH5', 897655987, 2);

INSERT INTO Vehicle(VehicleType)
VALUES ('car');

INSERT INTO Vehicle(VehicleType)
VALUES ('motorcycle');

INSERT INTO PartType (PartType)
VALUES ('crankshaft');

INSERT INTO PartType (PartType)
VALUES ('piston');

INSERT INTO PartType (PartType)
VALUES ('exhaust');

INSERT INTO VehiclePart(PartNumber, VehicleID, PartTypeID)
VALUES ('MOTO001', 2, 1);

INSERT INTO VehiclePart(PartNumber, VehicleID, PartTypeID)
VALUES ('MOTO002', 2, 2);

INSERT INTO VehiclePart(PartNumber, VehicleID, PartTypeID)
VALUES ('CAR001', 1, 2);

INSERT INTO VehiclePart(PartNumber, VehicleID, PartTypeID)
VALUES ('CAR002', 1, 3);

INSERT INTO VehiclePart(PartNumber, VehicleID, PartTypeID)
VALUES ('MOTO003', 2, 3);

INSERT INTO VehiclePart(PartNumber, VehicleID, PartTypeID)
VALUES ('CAR003', 1, 1);

INSERT INTO Customer(CustomerName)
VALUES ('Suzuki');

INSERT INTO Customer(CustomerName)
VALUES ('BMW');

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (1, 1, 1, 45);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (1, 1, 2, 40);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (1, 2, 1, 20);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (1, 3, 3, 15);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (2, 3, 3, 20);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (2, 2, 3, 10);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (1, 2, 4, 65);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (2, 4, 4, 110);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (1, 5, 5, 45);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (1, 6, 5, 25);

INSERT INTO PartOrder(CustomerID, PartID, EmployeeID, Time)
VALUES (2, 6, 2, 45);

--SELECT QUERIES

SELECT * FROM PartOrder
WHERE CustomerID = 1;

SELECT * FROM PartOrder
WHERE EmployeeID IN (
				SELECT ID FROM Employee
				WHERE PlantID IN (
								  SELECT ID FROM Plant
								  WHERE Plant = 'Waterloo'
								  )
				 );