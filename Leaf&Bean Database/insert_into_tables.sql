
-- Insert Into Tables --
INSERT INTO Employee (EmployeeID, EmpName, EmpPosition, EmpSalary) VALUES
(1, 'John Doe', 'Manager', 5000.00),
(2, 'Jane Smith', 'Barista', 3000.00);

INSERT INTO Store (StoreID, StoreEmail, StorePhone) VALUES
(1, 'store1@leafandbean.com', '123-456-7890'),
(2, 'store2@leafandbean.com', '123-456-7891');

INSERT INTO Product (ProductID, ProductName, ProductPrice, ProductType, MatchaOrigin, MatchaType, CoffeeOrigin, RoastLevel, Category, Manufacturer) VALUES
(1, 'Matcha A', 20.00, 'Matcha', 'Japan', 'Ceremonial', NULL, NULL, NULL, NULL),
(2, 'Coffee B', 15.00, 'Coffee', NULL, NULL, 'Ethiopia', 'Medium', NULL, NULL);

INSERT INTO Inventory (ProductID, StoreID, Availability) VALUES
(1, 1, 50),
(2, 2, 30);

INSERT INTO Orders (OrderNumber, OrderStatus) VALUES
(101, 'Pending'),
(102, 'Completed');

INSERT INTO Ordered_Item (ProductID, OrderNumber, Quantity) VALUES
(1, 101, 2),
(2, 102, 1);

INSERT INTO Invoice (InvoiceID, TotalAmount, InvoiceDate, OrderNumber) VALUES
(1001, 40.00, '2024-12-28', 101),
(1002, 15.00, '2024-12-28', 102);

INSERT INTO Customer (CustomerID, CustomerName, CustomerPhone, CustomerAddress_Country, CustomerAddress_City, CustomerAddress_Street) VALUES
(1, 'Alice Brown', '987-654-3210', 'Saudi Arabia', 'Jeddah', 'King Road'),
(2, 'Bob White', '987-654-3211', 'Saudi Arabia', 'Riyadh', 'Main Street');
