
CREATE DATABASE NorthwindSample;
GO

USE NorthwindSample;
GO

CREATE TABLE Region (
    RegionID INT PRIMARY KEY, 
    RegionDescription NVARCHAR(MAX) NOT NULL
);

CREATE TABLE Territory (
    TerritoryID NVARCHAR(20) PRIMARY KEY,  
    TerritoryDescription NVARCHAR(MAX) NOT NULL,
    RegionID INT NOT NULL,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    LastName NVARCHAR(MAX) NOT NULL,
    FirstName NVARCHAR(MAX) NOT NULL,
    Title NVARCHAR(MAX),
    TitleOfCourtesy NVARCHAR(MAX),
    BirthDate DATETIME,
    HireDate DATETIME,
    Address NVARCHAR(MAX),
    City NVARCHAR(MAX),
    Region NVARCHAR(MAX),  
    PostalCode NVARCHAR(MAX),
    Country NVARCHAR(MAX),
    HomePhone NVARCHAR(MAX),
    Extension NVARCHAR(MAX),
    Photo VARBINARY(MAX),
    Notes NVARCHAR(MAX),  
    ReportsTo INT,
    PhotoPath NVARCHAR(MAX),
    FOREIGN KEY (ReportsTo) REFERENCES Employee(EmployeeID)
);

CREATE TABLE EmployeeTerritory (
    EmployeeID INT NOT NULL,
    TerritoryID NVARCHAR(20) NOT NULL, 
    PRIMARY KEY (EmployeeID, TerritoryID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID)
);

CREATE TABLE Customer (
    CustomerID NVARCHAR(5) PRIMARY KEY,  
    CompanyName NVARCHAR(MAX) NOT NULL,
    ContactName NVARCHAR(MAX),
    ContactTitle NVARCHAR(MAX),
    Address NVARCHAR(MAX),
    City NVARCHAR(MAX),
    Region NVARCHAR(MAX),
    PostalCode NVARCHAR(MAX),
    Country NVARCHAR(MAX),
    Phone NVARCHAR(MAX),
    Fax NVARCHAR(MAX)
);

CREATE TABLE Shipper (
    ShipperID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName NVARCHAR(MAX) NOT NULL,
    Phone NVARCHAR(MAX)
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(15) NOT NULL,
    Description NTEXT,
    Picture IMAGE
);

CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName NVARCHAR(40) NOT NULL,
    ContactName NVARCHAR(30),
    ContactTitle NVARCHAR(30),
    Address NVARCHAR(60),
    City NVARCHAR(15),
    Region NVARCHAR(15),
    PostalCode NVARCHAR(10),
    Country NVARCHAR(15),
    Phone NVARCHAR(24),
    Fax NVARCHAR(24),
    HomePage NTEXT
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(40) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit NVARCHAR(20),
    UnitPrice MONEY,
    UnitsInStock SMALLINT,
    UnitsOnOrder SMALLINT,
    ReorderLevel SMALLINT,
    Discontinued BIT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID NVARCHAR(5),  
    EmployeeID INT,
    OrderDate DATETIME,
    RequiredDate DATETIME,
    ShippedDate DATETIME,
    ShipVia INT,
    Freight MONEY,
    ShipName NVARCHAR(MAX),
    ShipAddress NVARCHAR(MAX),
    ShipCity NVARCHAR(MAX),
    ShipRegion NVARCHAR(MAX),
    ShipPostalCode NVARCHAR(MAX),
    ShipCountry NVARCHAR(MAX),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ShipVia) REFERENCES Shipper(ShipperID)
);

CREATE TABLE Order_Detail (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    Quantity SMALLINT NOT NULL,
    Discount REAL NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

GO