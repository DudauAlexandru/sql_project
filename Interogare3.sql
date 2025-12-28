USE NorthwindSample;
GO

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
    r.RegionID = 1 OR r.RegionID IS NULL
ORDER BY 
    e.EmployeeID;