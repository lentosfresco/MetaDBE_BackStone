

-- Task #1

INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1);


-- Task #2

-- Create the prepared statement

-- Create the prepared statement
PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost AS Cost 
FROM Orders 
WHERE OrderID = ?';

-- Declare a variable
SET @id = 3;

-- Execute the prepared statement
EXECUTE GetOrderDetail USING @id;

-- Deallocate the prepared statement
DEALLOCATE PREPARE GetOrderDetail;


INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1);

