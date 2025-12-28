USE NorthwindSample;
GO

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