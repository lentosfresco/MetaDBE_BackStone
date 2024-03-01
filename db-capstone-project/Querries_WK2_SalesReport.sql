USE LittleLemonDB;

-- Task #1

CREATE OR REPLACE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
From Orders
WHERE Quantity > 2;


-- Task #2

CREATE OR REPLACE VIEW orders_customers AS
SELECT c.CustomerID, c.FullName, o.Quantity, o.OrderID, o.TotalCost As Cost, o.MenuItemID
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID;

CREATE OR REPLACE VIEW menu_menuitems AS
SELECT i.MenuItemID, m.MenuName, i.Description AS CourseName
FROM  Category c 
				JOIN MenuItems i ON c.CategoryID = i.CategoryID
                JOIN Menu m ON c.MenuID = m.MenuID;

SELECT o.CustomerID, o.FullName, o.OrderID, o.Cost, m.MenuName, m.CourseName
FROM orders_customers o JOIN menu_menuitems m ON o.MenuItemID = m.MenuItemID
WHERE o.Cost > 150 ;

-- Task #3
-- Using subquery (as required)
SELECT MenuName
FROM  menu_menuitems 
WHERE MenuItemID IN (
					SELECT MenuItemID
                    FROM orders_customers
                    WHERE Quantity > 2);

-- Using JOIN (verification)
SELECT MenuName
FROM orders_customers o JOIN menu_menuitems i ON o.MenuItemID = i.MenuItemID
WHERE o.Quantity > 2;







