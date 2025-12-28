USE NorthwindSample;
GO

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
    COUNT(o.OrderID) > 10
ORDER BY 
    NumarComenzi DESC;