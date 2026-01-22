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
    NOT EXISTS (
        SELECT 1
        FROM EmployeeTerritory et2
        JOIN Territory t2 ON et2.TerritoryID = t2.TerritoryID
        WHERE et2.EmployeeID = e.EmployeeID
        AND t2.RegionID != 1  
    )
ORDER BY 
    e.EmployeeID;