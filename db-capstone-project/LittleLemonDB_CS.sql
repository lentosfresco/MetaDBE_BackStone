-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS LittleLemonDB ;
USE LittleLemonDB ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.Table (
  TableID TINYINT NOT NULL,
  NoOfSeats TINYINT NOT NULL,
  PRIMARY KEY (TableID));

-- -----------------------------------------------------
-- Table LittleLemonDB.Customers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.Customers (
  CustomerID INT NOT NULL AUTO_INCREMENT,
  FullName VARCHAR(150) NOT NULL,
  ContactNumber CHAR(14) NOT NULL,
  Email VARCHAR(75) NOT NULL,
  PRIMARY KEY (CustomerID));

-- -----------------------------------------------------
-- Table LittleLemonDB.Bookings
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.Bookings (
  BookingID INT NOT NULL AUTO_INCREMENT,
  BookingDate DATE NOT NULL,
  TableID TINYINT NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (BookingID),
  CONSTRAINT fk_Bookings_Tables
    FOREIGN KEY (TableID)
    REFERENCES LittleLemonDB.Tables (TableID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Bookings_Customers1
    FOREIGN KEY (CustomerID)
    REFERENCES LittleLemonDB.Customers (CustomerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table LittleLemonDB.Menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.Menu (
  MenuID INT NOT NULL AUTO_INCREMENT,
  MenuName VARCHAR(45) NOT NULL,
  PRIMARY KEY (MenuID));

-- -----------------------------------------------------
-- Table LittleLemonDB.Category
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.Category (
  CategoryID INT NOT NULL AUTO_INCREMENT,
  Description VARCHAR(45) NOT NULL,
  MenuID INT NOT NULL,
  PRIMARY KEY (CategoryID),
  CONSTRAINT fk_Category_Menu1
    FOREIGN KEY (MenuID)
    REFERENCES LittleLemonDB.Menu (MenuID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table LittleLemonDB.MenuItems
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.MenuItems (
  MenuItemID INT NOT NULL AUTO_INCREMENT,
  CategoryID INT NOT NULL,
  PRIMARY KEY (MenuItemID),
  CONSTRAINT fk_MenuItems_Category
    FOREIGN KEY (CategoryID)
    REFERENCES LittleLemonDB.Category (CategoryID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table LittleLemonDB.Staff
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.Staff (
  StaffID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(45) NOT NULL,
  JobDescription VARCHAR(45) NOT NULL,
  PRIMARY KEY (StaffID));

-- -----------------------------------------------------
-- Table LittleLemonDB.Orders
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.Orders (
  OrderID INT NOT NULL AUTO_INCREMENT,
  OrderDate DATE NOT NULL,
  Quantity TINYINT NOT NULL,
  Discount DECIMAL(6,2) NOT NULL,
  TotalCost DECIMAL(6) NOT NULL,
  CustomerID INT NOT NULL,
  MenuItemID INT NOT NULL,
  Staff_StaffID INT NOT NULL,
  PRIMARY KEY (OrderID),
  CONSTRAINT fk_Orders_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES LittleLemonDB.Customers (CustomerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Orders_MenuItems
    FOREIGN KEY (MenuItemID)
    REFERENCES LittleLemonDB.MenuItems (MenuItemID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Orders_Staff
    FOREIGN KEY (Staff_StaffID)
    REFERENCES LittleLemonDB.Staff (StaffID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table LittleLemonDB.DeliveryStatus
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LittleLemonDB.DeliveryStatus (
  OrderID INT NOT NULL,
  DeliveryStatus ENUM('Yes', 'No') NOT NULL,
  StaffID INT NOT NULL,
  PRIMARY KEY (OrderID),
  CONSTRAINT fk_DeliveryStatus_Orders
    FOREIGN KEY (OrderID)
    REFERENCES LittleLemonDB.Orders (OrderID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DeliveryStatus_Staff
    FOREIGN KEY (StaffID)
    REFERENCES LittleLemonDB.Staff (StaffID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

