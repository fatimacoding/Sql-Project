
-- Procedures --
-- 1. Update inventory upon transaction.
CREATE PROCEDURE UpdateInventory(
    IN ProductID INT,
    IN StoreID INT
)
BEGIN
    UPDATE Inventory
    SET Availability = Availability - 1
    WHERE ProductID = ProductID AND StoreID = StoreID;
END;

-- 2. Update employee salaries.
CREATE PROCEDURE UpdateEmployeeSalary(
    IN EmployeeID INT,
    IN NewSalary DECIMAL(10, 2)
)
BEGIN
    UPDATE Employee
    SET EmpSalary = NewSalary
    WHERE EmployeeID = EmployeeID;
END;

-- 3. Calculate and update invoice totals.
CREATE PROCEDURE CalculateInvoiceTotal(
    IN InvoiceID INT
)
BEGIN
    UPDATE Invoice
    SET TotalAmount = (
        SELECT SUM(P.ProductPrice * OI.Quantity)
        FROM Ordered_Item OI
        JOIN Product P ON OI.ProductID = P.ProductID
        WHERE OI.OrderNumber = Invoice.OrderNumber
    )
    WHERE InvoiceID = InvoiceID;
END;

-- 4. Check product availability.
CREATE PROCEDURE CheckProductAvailability(
    IN ProductID INT,
    OUT IsAvailable BOOLEAN
)
BEGIN
    SELECT CASE
        WHEN Availability > 0 THEN TRUE
        ELSE FALSE
    END INTO IsAvailable
    FROM Inventory
    WHERE ProductID = ProductID;
END;
