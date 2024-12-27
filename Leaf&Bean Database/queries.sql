
-- Queries --
-- 1. Retrieve names and prices of all coffee products.
SELECT ProductName, ProductPrice FROM Product
WHERE ProductType = 'Coffee';

-- 2. Identify top 5 most expensive products.
SELECT ProductName, ProductPrice FROM Product
ORDER BY ProductPrice DESC
LIMIT 5;

-- 3. Analyze inventory distribution.
SELECT StoreID, COUNT(*) AS ProductCount, SUM(Availability) AS TotalAvailability
FROM Inventory
GROUP BY StoreID;

-- 4. Assess salary fairness.
SELECT EmployeeID, EmpName, EmpSalary, CASE
    WHEN EmpSalary < 4000 THEN 'Underpaid'
    ELSE 'Fair'
END AS SalaryAssessment
FROM Employee;

-- 5. Identify out-of-stock products.
SELECT ProductID, ProductName FROM Inventory
WHERE Availability = 0;

-- 6. Analyze multi-item orders.
SELECT OrderNumber, COUNT(ProductID) AS ItemCount, SUM(Quantity) AS TotalQuantity
FROM Ordered_Item
GROUP BY OrderNumber
HAVING ItemCount > 1;

-- 7. Follow up with customers who purchased coffee.
SELECT DISTINCT C.CustomerName, C.CustomerPhone FROM Customer C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN Ordered_Item OI ON O.OrderNumber = OI.OrderNumber
JOIN Product P ON OI.ProductID = P.ProductID
WHERE P.ProductType = 'Coffee';

-- 8. Identify pending orders.
SELECT OrderNumber FROM Orders
WHERE OrderStatus = 'Pending';

-- 9. Identify highest-selling products.
SELECT ProductID, SUM(Quantity) AS TotalSold
FROM Ordered_Item
GROUP BY ProductID
ORDER BY TotalSold DESC
LIMIT 3;

-- 10. List all Matcha products below $30.
SELECT ProductName, ProductPrice FROM Product
WHERE ProductType = 'Matcha' AND ProductPrice < 30;
