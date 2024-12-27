
-- Creating Tables --
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    EmpPosition VARCHAR(100),
    EmpSalary DECIMAL(10, 2)
);

CREATE TABLE Store (
    StoreID INT PRIMARY KEY,
    StoreEmail VARCHAR(100),
    StorePhone VARCHAR(15)
);

CREATE TABLE Inventory (
    ProductID INT,
    StoreID INT,
    Availability INT,
    PRIMARY KEY (ProductID, StoreID),
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductPrice DECIMAL(10, 2),
    ProductType VARCHAR(50),
    MatchaOrigin VARCHAR(100),
    MatchaType VARCHAR(50),
    CoffeeOrigin VARCHAR(100),
    RoastLevel VARCHAR(50),
    Category VARCHAR(50),
    Manufacturer VARCHAR(100)
);

CREATE TABLE Ordered_Item (
    ProductID INT,
    OrderNumber INT,
    Quantity INT,
    PRIMARY KEY (ProductID, OrderNumber),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Orders (
    OrderNumber INT PRIMARY KEY,
    OrderStatus VARCHAR(50)
);

CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    TotalAmount DECIMAL(10, 2),
    InvoiceDate DATE,
    OrderNumber INT,
    FOREIGN KEY (OrderNumber) REFERENCES Orders(OrderNumber)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerPhone VARCHAR(15),
    CustomerAddress_Country VARCHAR(50),
    CustomerAddress_City VARCHAR(50),
    CustomerAddress_Street VARCHAR(100)
);
