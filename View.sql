USE NorthwindSample;
GO

CREATE OR ALTER VIEW ViewCompaniesOver10Orders
AS
SELECT 
    c.CustomerID,
    c.CompanyName,
    COUNT(o.OrderID) AS NumarComenzi
FROM 
    Customer c
INNER JOIN 
    [Order] o ON c.CustomerID = o.CustomerID
WHERE 
    YEAR(o.OrderDate) = YEAR(GETDATE())
GROUP BY 
    c.CustomerID, 
    c.CompanyName
HAVING 
    COUNT(o.OrderID) > 10;
GO

CREATE OR ALTER VIEW ViewBestSellingProduct
AS
SELECT TOP 1
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS CantitateTotalaVanduta
FROM 
    Product p
INNER JOIN 
    Order_Detail od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductID, 
    p.ProductName
ORDER BY 
    CantitateTotalaVanduta DESC;
GO

CREATE OR ALTER VIEW ViewEmployeesRegion1OrNoTerritory
AS
SELECT DISTINCT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Title,
    t.TerritoryID,
    t.TerritoryDescription,
    r.RegionID,
    r.RegionDescription
FROM 
    Employee e
LEFT JOIN 
    EmployeeTerritory et ON e.EmployeeID = et.EmployeeID
LEFT JOIN 
    Territory t ON et.TerritoryID = t.TerritoryID
LEFT JOIN 
    Region r ON t.RegionID = r.RegionID
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM EmployeeTerritory et2
        JOIN Territory t2 ON et2.TerritoryID = t2.TerritoryID
        WHERE et2.EmployeeID = e.EmployeeID
        AND t2.RegionID != 1  
    )
ORDER BY 
    e.EmployeeID;
GO