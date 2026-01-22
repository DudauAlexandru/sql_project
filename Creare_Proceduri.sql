USE NorthwindSample;
GO

CREATE OR ALTER PROCEDURE ProcRegionInsert
    @RegionID INT,
    @RegionDescription NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Region (RegionID, RegionDescription)
    VALUES (@RegionID, @RegionDescription);
END
GO

CREATE OR ALTER PROCEDURE ProcRegionUpdate
    @RegionID INT,
    @RegionDescription NVARCHAR(MAX)
AS
BEGIN
    UPDATE Region
    SET RegionDescription = @RegionDescription
    WHERE RegionID = @RegionID;
END
GO

CREATE OR ALTER PROCEDURE ProcRegionDelete
    @RegionID INT
AS
BEGIN
    DELETE FROM Region WHERE RegionID = @RegionID;
END
GO

CREATE OR ALTER PROCEDURE ProcRegionSelect
    @RegionID INT = NULL
AS
BEGIN
    IF @RegionID IS NULL
        SELECT * FROM Region;
    ELSE
        SELECT * FROM Region WHERE RegionID = @RegionID;
END
GO

CREATE OR ALTER PROCEDURE ProcTerritoryInsert
    @TerritoryID NVARCHAR(20),
    @TerritoryDescription NVARCHAR(MAX),
    @RegionID INT
AS
BEGIN
    INSERT INTO Territory (TerritoryID, TerritoryDescription, RegionID)
    VALUES (@TerritoryID, @TerritoryDescription, @RegionID);
END
GO

CREATE OR ALTER PROCEDURE ProcTerritoryUpdate
    @TerritoryID NVARCHAR(20),
    @TerritoryDescription NVARCHAR(MAX),
    @RegionID INT
AS
BEGIN
    UPDATE Territory
    SET TerritoryDescription = @TerritoryDescription,
        RegionID = @RegionID
    WHERE TerritoryID = @TerritoryID;
END
GO

CREATE OR ALTER PROCEDURE ProcTerritoryDelete
    @TerritoryID NVARCHAR(20)
AS
BEGIN
    DELETE FROM Territory WHERE TerritoryID = @TerritoryID;
END
GO

CREATE OR ALTER PROCEDURE ProcTerritorySelect
    @TerritoryID NVARCHAR(20) = NULL
AS
BEGIN
    IF @TerritoryID IS NULL
        SELECT * FROM Territory;
    ELSE
        SELECT * FROM Territory WHERE TerritoryID = @TerritoryID;
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeInsert
    @LastName NVARCHAR(MAX),
    @FirstName NVARCHAR(MAX),
    @Title NVARCHAR(MAX) = NULL,
    @TitleOfCourtesy NVARCHAR(MAX) = NULL,
    @BirthDate DATETIME = NULL,
    @HireDate DATETIME = NULL,
    @Address NVARCHAR(MAX) = NULL,
    @City NVARCHAR(MAX) = NULL,
    @Region NVARCHAR(MAX) = NULL,
    @PostalCode NVARCHAR(MAX) = NULL,
    @Country NVARCHAR(MAX) = NULL,
    @HomePhone NVARCHAR(MAX) = NULL,
    @Extension NVARCHAR(MAX) = NULL,
    @Photo VARBINARY(MAX) = NULL,
    @Notes NVARCHAR(MAX) = NULL,
    @ReportsTo INT = NULL,
    @PhotoPath NVARCHAR(MAX) = NULL
AS
BEGIN
    INSERT INTO Employee (LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, 
                         Address, City, Region, PostalCode, Country, HomePhone, Extension, 
                         Photo, Notes, ReportsTo, PhotoPath)
    VALUES (@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, 
            @Address, @City, @Region, @PostalCode, @Country, @HomePhone, @Extension, 
            @Photo, @Notes, @ReportsTo, @PhotoPath);
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeUpdate
    @EmployeeID INT,
    @LastName NVARCHAR(MAX),
    @FirstName NVARCHAR(MAX),
    @Title NVARCHAR(MAX) = NULL,
    @TitleOfCourtesy NVARCHAR(MAX) = NULL,
    @BirthDate DATETIME = NULL,
    @HireDate DATETIME = NULL,
    @Address NVARCHAR(MAX) = NULL,
    @City NVARCHAR(MAX) = NULL,
    @Region NVARCHAR(MAX) = NULL,
    @PostalCode NVARCHAR(MAX) = NULL,
    @Country NVARCHAR(MAX) = NULL,
    @HomePhone NVARCHAR(MAX) = NULL,
    @Extension NVARCHAR(MAX) = NULL,
    @Photo VARBINARY(MAX) = NULL,
    @Notes NVARCHAR(MAX) = NULL,
    @ReportsTo INT = NULL,
    @PhotoPath NVARCHAR(MAX) = NULL
AS
BEGIN
    UPDATE Employee
    SET LastName = @LastName,
        FirstName = @FirstName,
        Title = @Title,
        TitleOfCourtesy = @TitleOfCourtesy,
        BirthDate = @BirthDate,
        HireDate = @HireDate,
        Address = @Address,
        City = @City,
        Region = @Region,
        PostalCode = @PostalCode,
        Country = @Country,
        HomePhone = @HomePhone,
        Extension = @Extension,
        Photo = @Photo,
        Notes = @Notes,
        ReportsTo = @ReportsTo,
        PhotoPath = @PhotoPath
    WHERE EmployeeID = @EmployeeID;
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeDelete
    @EmployeeID INT
AS
BEGIN
    DELETE FROM Employee WHERE EmployeeID = @EmployeeID;
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeSelect
    @EmployeeID INT = NULL
AS
BEGIN
    IF @EmployeeID IS NULL
        SELECT * FROM Employee;
    ELSE
        SELECT * FROM Employee WHERE EmployeeID = @EmployeeID;
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeTerritoryInsert
    @EmployeeID INT,
    @TerritoryID NVARCHAR(20)
AS
BEGIN
    INSERT INTO EmployeeTerritory (EmployeeID, TerritoryID)
    VALUES (@EmployeeID, @TerritoryID);
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeTerritoryUpdate
    @OldEmployeeID INT,
    @OldTerritoryID NVARCHAR(20),
    @NewEmployeeID INT,
    @NewTerritoryID NVARCHAR(20)
AS
BEGIN
    DELETE FROM EmployeeTerritory 
    WHERE EmployeeID = @OldEmployeeID AND TerritoryID = @OldTerritoryID;
    
    INSERT INTO EmployeeTerritory (EmployeeID, TerritoryID)
    VALUES (@NewEmployeeID, @NewTerritoryID);
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeTerritoryDelete
    @EmployeeID INT,
    @TerritoryID NVARCHAR(20)
AS
BEGIN
    DELETE FROM EmployeeTerritory 
    WHERE EmployeeID = @EmployeeID AND TerritoryID = @TerritoryID;
END
GO

CREATE OR ALTER PROCEDURE ProcEmployeeTerritorySelect
    @EmployeeID INT = NULL,
    @TerritoryID NVARCHAR(20) = NULL
AS
BEGIN
    SELECT * FROM EmployeeTerritory
    WHERE (@EmployeeID IS NULL OR EmployeeID = @EmployeeID)
    AND (@TerritoryID IS NULL OR TerritoryID = @TerritoryID);
END
GO

CREATE OR ALTER PROCEDURE ProcCustomerInsert
    @CustomerID NVARCHAR(5),
    @CompanyName NVARCHAR(MAX),
    @ContactName NVARCHAR(MAX) = NULL,
    @ContactTitle NVARCHAR(MAX) = NULL,
    @Address NVARCHAR(MAX) = NULL,
    @City NVARCHAR(MAX) = NULL,
    @Region NVARCHAR(MAX) = NULL,
    @PostalCode NVARCHAR(MAX) = NULL,
    @Country NVARCHAR(MAX) = NULL,
    @Phone NVARCHAR(MAX) = NULL,
    @Fax NVARCHAR(MAX) = NULL
AS
BEGIN
    INSERT INTO Customer (CustomerID, CompanyName, ContactName, ContactTitle, Address, 
                         City, Region, PostalCode, Country, Phone, Fax)
    VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, 
            @City, @Region, @PostalCode, @Country, @Phone, @Fax);
END
GO

CREATE OR ALTER PROCEDURE ProcCustomerUpdate
    @CustomerID NVARCHAR(5),
    @CompanyName NVARCHAR(MAX),
    @ContactName NVARCHAR(MAX) = NULL,
    @ContactTitle NVARCHAR(MAX) = NULL,
    @Address NVARCHAR(MAX) = NULL,
    @City NVARCHAR(MAX) = NULL,
    @Region NVARCHAR(MAX) = NULL,
    @PostalCode NVARCHAR(MAX) = NULL,
    @Country NVARCHAR(MAX) = NULL,
    @Phone NVARCHAR(MAX) = NULL,
    @Fax NVARCHAR(MAX) = NULL
AS
BEGIN
    UPDATE Customer
    SET CompanyName = @CompanyName,
        ContactName = @ContactName,
        ContactTitle = @ContactTitle,
        Address = @Address,
        City = @City,
        Region = @Region,
        PostalCode = @PostalCode,
        Country = @Country,
        Phone = @Phone,
        Fax = @Fax
    WHERE CustomerID = @CustomerID;
END
GO

CREATE OR ALTER PROCEDURE ProcCustomerDelete
    @CustomerID NVARCHAR(5)
AS
BEGIN
    DELETE FROM Customer WHERE CustomerID = @CustomerID;
END
GO

CREATE OR ALTER PROCEDURE ProcCustomerSelect
    @CustomerID NVARCHAR(5) = NULL
AS
BEGIN
    IF @CustomerID IS NULL
        SELECT * FROM Customer;
    ELSE
        SELECT * FROM Customer WHERE CustomerID = @CustomerID;
END
GO

CREATE OR ALTER PROCEDURE ProcShipperInsert
    @CompanyName NVARCHAR(MAX),
    @Phone NVARCHAR(MAX) = NULL
AS
BEGIN
    INSERT INTO Shipper (CompanyName, Phone)
    VALUES (@CompanyName, @Phone);
END
GO

CREATE OR ALTER PROCEDURE ProcShipperUpdate
    @ShipperID INT,
    @CompanyName NVARCHAR(MAX),
    @Phone NVARCHAR(MAX) = NULL
AS
BEGIN
    UPDATE Shipper
    SET CompanyName = @CompanyName,
        Phone = @Phone
    WHERE ShipperID = @ShipperID;
END
GO

CREATE OR ALTER PROCEDURE ProcShipperDelete
    @ShipperID INT
AS
BEGIN
    DELETE FROM Shipper WHERE ShipperID = @ShipperID;
END
GO

CREATE OR ALTER PROCEDURE ProcShipperSelect
    @ShipperID INT = NULL
AS
BEGIN
    IF @ShipperID IS NULL
        SELECT * FROM Shipper;
    ELSE
        SELECT * FROM Shipper WHERE ShipperID = @ShipperID;
END
GO

CREATE OR ALTER PROCEDURE ProcCategoryInsert
    @CategoryName NVARCHAR(15),
    @Description NTEXT = NULL,
    @Picture IMAGE = NULL
AS
BEGIN
    INSERT INTO Category (CategoryName, Description, Picture)
    VALUES (@CategoryName, @Description, @Picture);
END
GO

CREATE OR ALTER PROCEDURE ProcCategoryUpdate
    @CategoryID INT,
    @CategoryName NVARCHAR(15),
    @Description NTEXT = NULL,
    @Picture IMAGE = NULL
AS
BEGIN
    UPDATE Category
    SET CategoryName = @CategoryName,
        Description = @Description,
        Picture = @Picture
    WHERE CategoryID = @CategoryID;
END
GO

CREATE OR ALTER PROCEDURE ProcCategoryDelete
    @CategoryID INT
AS
BEGIN
    DELETE FROM Category WHERE CategoryID = @CategoryID;
END
GO

CREATE OR ALTER PROCEDURE ProcCategorySelect
    @CategoryID INT = NULL
AS
BEGIN
    IF @CategoryID IS NULL
        SELECT * FROM Category;
    ELSE
        SELECT * FROM Category WHERE CategoryID = @CategoryID;
END
GO

CREATE OR ALTER PROCEDURE ProcSupplierInsert
    @CompanyName NVARCHAR(40),
    @ContactName NVARCHAR(30) = NULL,
    @ContactTitle NVARCHAR(30) = NULL,
    @Address NVARCHAR(60) = NULL,
    @City NVARCHAR(15) = NULL,
    @Region NVARCHAR(15) = NULL,
    @PostalCode NVARCHAR(10) = NULL,
    @Country NVARCHAR(15) = NULL,
    @Phone NVARCHAR(24) = NULL,
    @Fax NVARCHAR(24) = NULL,
    @HomePage NTEXT = NULL
AS
BEGIN
    INSERT INTO Supplier (CompanyName, ContactName, ContactTitle, Address, City, Region, 
                         PostalCode, Country, Phone, Fax, HomePage)
    VALUES (@CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, 
            @PostalCode, @Country, @Phone, @Fax, @HomePage);
END
GO

CREATE OR ALTER PROCEDURE ProcSupplierUpdate
    @SupplierID INT,
    @CompanyName NVARCHAR(40),
    @ContactName NVARCHAR(30) = NULL,
    @ContactTitle NVARCHAR(30) = NULL,
    @Address NVARCHAR(60) = NULL,
    @City NVARCHAR(15) = NULL,
    @Region NVARCHAR(15) = NULL,
    @PostalCode NVARCHAR(10) = NULL,
    @Country NVARCHAR(15) = NULL,
    @Phone NVARCHAR(24) = NULL,
    @Fax NVARCHAR(24) = NULL,
    @HomePage NTEXT = NULL
AS
BEGIN
    UPDATE Supplier
    SET CompanyName = @CompanyName,
        ContactName = @ContactName,
        ContactTitle = @ContactTitle,
        Address = @Address,
        City = @City,
        Region = @Region,
        PostalCode = @PostalCode,
        Country = @Country,
        Phone = @Phone,
        Fax = @Fax,
        HomePage = @HomePage
    WHERE SupplierID = @SupplierID;
END
GO

CREATE OR ALTER PROCEDURE ProcSupplierDelete
    @SupplierID INT
AS
BEGIN
    DELETE FROM Supplier WHERE SupplierID = @SupplierID;
END
GO

CREATE OR ALTER PROCEDURE ProcSupplierSelect
    @SupplierID INT = NULL
AS
BEGIN
    IF @SupplierID IS NULL
        SELECT * FROM Supplier;
    ELSE
        SELECT * FROM Supplier WHERE SupplierID = @SupplierID;
END
GO

CREATE OR ALTER PROCEDURE ProcProductInsert
    @ProductName NVARCHAR(40),
    @SupplierID INT = NULL,
    @CategoryID INT = NULL,
    @QuantityPerUnit NVARCHAR(20) = NULL,
    @UnitPrice MONEY = NULL,
    @UnitsInStock SMALLINT = NULL,
    @UnitsOnOrder SMALLINT = NULL,
    @ReorderLevel SMALLINT = NULL,
    @Discontinued BIT
AS
BEGIN
    INSERT INTO Product (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, 
                        UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
    VALUES (@ProductName, @SupplierID, @CategoryID, @QuantityPerUnit, @UnitPrice, 
            @UnitsInStock, @UnitsOnOrder, @ReorderLevel, @Discontinued);
END
GO

CREATE OR ALTER PROCEDURE ProcProductUpdate
    @ProductID INT,
    @ProductName NVARCHAR(40),
    @SupplierID INT = NULL,
    @CategoryID INT = NULL,
    @QuantityPerUnit NVARCHAR(20) = NULL,
    @UnitPrice MONEY = NULL,
    @UnitsInStock SMALLINT = NULL,
    @UnitsOnOrder SMALLINT = NULL,
    @ReorderLevel SMALLINT = NULL,
    @Discontinued BIT
AS
BEGIN
    UPDATE Product
    SET ProductName = @ProductName,
        SupplierID = @SupplierID,
        CategoryID = @CategoryID,
        QuantityPerUnit = @QuantityPerUnit,
        UnitPrice = @UnitPrice,
        UnitsInStock = @UnitsInStock,
        UnitsOnOrder = @UnitsOnOrder,
        ReorderLevel = @ReorderLevel,
        Discontinued = @Discontinued
    WHERE ProductID = @ProductID;
END
GO

CREATE OR ALTER PROCEDURE ProcProductDelete
    @ProductID INT
AS
BEGIN
    DELETE FROM Product WHERE ProductID = @ProductID;
END
GO

CREATE OR ALTER PROCEDURE ProcProductSelect
    @ProductID INT = NULL
AS
BEGIN
    IF @ProductID IS NULL
        SELECT * FROM Product;
    ELSE
        SELECT * FROM Product WHERE ProductID = @ProductID;
END
GO

CREATE OR ALTER PROCEDURE ProcOrderInsert
    @CustomerID NVARCHAR(5) = NULL,
    @EmployeeID INT = NULL,
    @OrderDate DATETIME = NULL,
    @RequiredDate DATETIME = NULL,
    @ShippedDate DATETIME = NULL,
    @ShipVia INT = NULL,
    @Freight MONEY = NULL,
    @ShipName NVARCHAR(MAX) = NULL,
    @ShipAddress NVARCHAR(MAX) = NULL,
    @ShipCity NVARCHAR(MAX) = NULL,
    @ShipRegion NVARCHAR(MAX) = NULL,
    @ShipPostalCode NVARCHAR(MAX) = NULL,
    @ShipCountry NVARCHAR(MAX) = NULL
AS
BEGIN
    INSERT INTO [Order] (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, 
                        ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, 
                        ShipPostalCode, ShipCountry)
    VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, 
            @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, 
            @ShipPostalCode, @ShipCountry);
END
GO

CREATE OR ALTER PROCEDURE ProcOrderUpdate
    @OrderID INT,
    @CustomerID NVARCHAR(5) = NULL,
    @EmployeeID INT = NULL,
    @OrderDate DATETIME = NULL,
    @RequiredDate DATETIME = NULL,
    @ShippedDate DATETIME = NULL,
    @ShipVia INT = NULL,
    @Freight MONEY = NULL,
    @ShipName NVARCHAR(MAX) = NULL,
    @ShipAddress NVARCHAR(MAX) = NULL,
    @ShipCity NVARCHAR(MAX) = NULL,
    @ShipRegion NVARCHAR(MAX) = NULL,
    @ShipPostalCode NVARCHAR(MAX) = NULL,
    @ShipCountry NVARCHAR(MAX) = NULL
AS
BEGIN
    UPDATE [Order]
    SET CustomerID = @CustomerID,
        EmployeeID = @EmployeeID,
        OrderDate = @OrderDate,
        RequiredDate = @RequiredDate,
        ShippedDate = @ShippedDate,
        ShipVia = @ShipVia,
        Freight = @Freight,
        ShipName = @ShipName,
        ShipAddress = @ShipAddress,
        ShipCity = @ShipCity,
        ShipRegion = @ShipRegion,
        ShipPostalCode = @ShipPostalCode,
        ShipCountry = @ShipCountry
    WHERE OrderID = @OrderID;
END
GO

CREATE OR ALTER PROCEDURE ProcOrderDelete
    @OrderID INT
AS
BEGIN
    DELETE FROM [Order] WHERE OrderID = @OrderID;
END
GO

CREATE OR ALTER PROCEDURE ProcOrderSelect
    @OrderID INT = NULL
AS
BEGIN
    IF @OrderID IS NULL
        SELECT * FROM [Order];
    ELSE
        SELECT * FROM [Order] WHERE OrderID = @OrderID;
END
GO

CREATE OR ALTER PROCEDURE ProcOrder_DetailInsert
    @OrderID INT,
    @ProductID INT,
    @UnitPrice MONEY,
    @Quantity SMALLINT,
    @Discount REAL
AS
BEGIN
    INSERT INTO Order_Detail (OrderID, ProductID, UnitPrice, Quantity, Discount)
    VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount);
END
GO

CREATE OR ALTER PROCEDURE ProcOrder_DetailUpdate
    @OrderID INT,
    @ProductID INT,
    @UnitPrice MONEY,
    @Quantity SMALLINT,
    @Discount REAL
AS
BEGIN
    UPDATE Order_Detail
    SET UnitPrice = @UnitPrice,
        Quantity = @Quantity,
        Discount = @Discount
    WHERE OrderID = @OrderID AND ProductID = @ProductID;
END
GO

CREATE OR ALTER PROCEDURE ProcOrder_DetailDelete
    @OrderID INT,
    @ProductID INT
AS
BEGIN
    DELETE FROM Order_Detail 
    WHERE OrderID = @OrderID AND ProductID = @ProductID;
END
GO

CREATE OR ALTER PROCEDURE ProcOrder_DetailSelect
    @OrderID INT = NULL,
    @ProductID INT = NULL
AS
BEGIN
    SELECT * FROM Order_Detail
    WHERE (@OrderID IS NULL OR OrderID = @OrderID)
    AND (@ProductID IS NULL OR ProductID = @ProductID);
END
GO