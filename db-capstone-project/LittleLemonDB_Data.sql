-- Insert into Tables
INSERT INTO Tables (TableID, NoOfSeats) VALUES 
  (1, 4),
  (2, 6),
  (3, 6),
  (4, 3),
  (5, 2),
  (6, 6),
  (20, 4),
  (21, 4);

-- Insert into Customers
INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email) VALUES 
  (1, 'Alice Johnson', '+1 555-1234', 'alice.johnson@email.com'),
  (2, 'Michael Davis', '+1 555-5678', 'michael.davis@email.com'),
  (3, 'Emily Smith', '+1 555-9876', 'emily.smith@email.com'),
  (4, 'Joshua Miller', '+1 555-4321', 'joshua.miller@email.com'),
  (5, 'Sophia White', '+1 555-8765', 'sophia.white@email.com'),
  (15, 'Scott Roseworn', '1 905 664 9876', 'scott.roseworn@cmail.com'),
  (16, 'Jon Stewart', '669 654 5841', 'jon.stewart@cmail.com');

-- Insert into Bookings
INSERT INTO Bookings (BookingDate, TableID, CustomerID) VALUES 
  ('2022-10-10', 1, 1),  -- BookingID: 1, TableNumber: 5, CustomerID: 1
  ('2022-11-12', 2, 3),  -- BookingID: 2, TableNumber: 3, CustomerID: 3
  ('2022-10-11', 3, 2),  -- BookingID: 3, TableNumber: 2, CustomerID: 2
  ('2022-10-13', 4, 1),  -- BookingID: 4, TableNumber: 2, CustomerID: 1
  ('2023-06-17', 5, 1),  -- BookingID: 5, TableNumber: 6, CustomerID: 1
  ('2023-12-18', 6, 15), -- BookingID: 7, TableNumber: 20, CustomerID: 15
  ('2023-12-29', 7, 16); -- BookingID: 8, TableNumber: 21, CustomerID: 16
  
-- Insert into Menus
INSERT INTO menus (MenuID, MenuName) VALUES 
  (1, 'Moussaka'),
  (2, 'Manti');

-- Insert into Categories
INSERT INTO Categories (Description, MenuID) VALUES 
  ('Appetizers_1', 1),    -- CategoryID: 1, MenuID: 1
  ('Main Course_1', 2),    -- CategoryID: 2, MenuID: 2
  ('Desserts_1', 1),       -- CategoryID: 3, MenuID: 1
  ('Drinks_1', 1),         -- CategoryID: 4, MenuID: 1
  ('Appetizers_2', 2),     -- CategoryID: 5, MenuID: 2
  ('Main Course_2', 2),    -- CategoryID: 6, MenuID: 2
  ('Desserts_2', 2),       -- CategoryID: 7, MenuID: 2
  ('Drinks_2', 2);         -- CategoryID: 8, MenuID: 2

-- Insert into MenuItems
INSERT INTO MenuItems (MenuItemID, Description, CategoryID) VALUES 
  (1, 'Green Salad Skewers', 1),
  (2, 'Hummus with Pita Bread', 1),
  (3, 'Spanakopita (Spinach Pie)', 1),
  (4, 'Grilled Lemon Herb Chicken', 2),
  (5, 'Seafood Paella', 2),
  (6, 'Eggplant Moussaka', 2),
  (7, 'Baklava', 3),
  (8, 'Tiramisu', 3),
  (9, 'Orange Blossom Panna Cotta', 3),
  (10, 'Mint Lemonade', 4),
  (11, 'Pomegranate Mojito', 4),
  (12, 'Tzatziki Yogurt Smoothie', 4);

-- Insert into Orders
INSERT INTO Orders (OrderID, OrderDate, Quantity, Discount, TotalCost, CustomerID, MenuItemID, Staff_StaffID) VALUES 
  (1, '2023-08-19', 4, 0, 150, 5, 3, 3),
  (2, '2023-10-14', 2, 0, 255, 3, 1, 1),
  (3, '2023-06-18', 5, 0, 250, 2, 3, 4),
  (4, '2023-06-19', 3, 0, 200, 4, 6, 4),
  (5, '2023-11-20', 2, 0, 260, 1, 2, 2);
  
-- Insert into Staff
INSERT INTO Staff (StaffID, Name, JobDescription) VALUES 
  (1, 'John Smith', 'Manager'),
  (2, 'Joan', 'Staff'),
  (3, 'Dan', 'Staff'),
  (4, 'Ron', 'Shipper');

 -- Insert into DeliveryStatus
INSERT INTO DeliveryStatus (OrderID, DeliveryStatus, StaffID) VALUES 
  (3, 'Yes', 4),
  (4, 'Yes', 4);


