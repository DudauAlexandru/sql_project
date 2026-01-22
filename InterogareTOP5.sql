SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) as TotalVandut
FROM Order_Detail od
INNER JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING (
    SELECT COUNT(*)
    FROM (
        SELECT ProductID, SUM(Quantity) as Total
        FROM Order_Detail
        GROUP BY ProductID
    ) t
    WHERE t.Total > SUM(od.Quantity)
) < 5
ORDER BY SUM(od.Quantity) DESC;