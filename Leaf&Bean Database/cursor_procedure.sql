
-- Cursor Procedure --
CREATE PROCEDURE RetrieveEmployeesByStore(
    IN StoreID INT
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE empID INT;
    DECLARE empName VARCHAR(100);
    DECLARE empPosition VARCHAR(100);
    DECLARE empSalary DECIMAL(10, 2);

    DECLARE empCursor CURSOR FOR
    SELECT EmployeeID, EmpName, EmpPosition, EmpSalary
    FROM Employee
    WHERE StoreID = StoreID;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN empCursor;

    read_loop: LOOP
        FETCH empCursor INTO empID, empName, empPosition, empSalary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Output or process employee details here
        SELECT empID AS EmployeeID, empName AS Name, empPosition AS Position, empSalary AS Salary;
    END LOOP;

    CLOSE empCursor;
END;
