-- Create Database
CREATE DATABASE PendroPharma;
USE PendroPharma;

-- Drug Store Table
CREATE TABLE Drug_Store (
    Store_ID INT(4) PRIMARY KEY,
    Location_Address VARCHAR(100),
    No_of_Employees INT(10)
);

-- Employee Table
CREATE TABLE Employee (
    Employee_ID INT(6) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Date_of_Birth DATE,
    Joining_Year YEAR,
    Contact_Number VARCHAR(20),
    Address VARCHAR(100),
    Job_Desc VARCHAR(100),
    Salary INT(10),
    Store_ID INT(4),
    FOREIGN KEY (Store_ID) REFERENCES Drug_Store(Store_ID)
);

-- Customer Table
CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Contact_Number VARCHAR(20),
    Address VARCHAR(100)
);

-- Supplier Table
CREATE TABLE Supplier (
    Supplier_ID INT(6) PRIMARY KEY,
    Company_Name VARCHAR(50),
    Contact_No VARCHAR(20),
    Address VARCHAR(100)
);

-- Drug Table
CREATE TABLE Drug (
    Drug_ID INT(10) PRIMARY KEY,
    Drug_Name VARCHAR(50),
    Drug_Category VARCHAR(50),
    Storage_Temperature DOUBLE(3,2),
    No_of_Unit_in_Package INT(6),
    Drug_Manufacturer VARCHAR(50),
    Unit_Price INT(6),
    Storage_Location VARCHAR(50)
);

-- Stored Drug Table
CREATE TABLE Stored_Drug (
    Batch_No VARCHAR(20) PRIMARY KEY,
    Manufacturing_Date DATE,
    Quantity_Available INT(10),
    Expiry_Date DATE,
    Date_Of_Entry DATE,
    Drug_ID INT(10),
    FOREIGN KEY (Drug_ID) REFERENCES Drug(Drug_ID)
);

-- Sale Invoice Table
CREATE TABLE Sale_Invoice (
    Sale_Invoice_ID INT(5) PRIMARY KEY,
    Payment_Type VARCHAR(50),
    Total_Amount INT(10),
    Amount_Payed INT(10),
    Amount_Remaining INT(10),
    Sale_Date DATE,
    Employee_ID INT(6),
    Customer_ID INT,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- On Sale Invoice Table (junction)
CREATE TABLE On_Sale_Invoice (
    Drug_ID INT(10),
    Batch_No VARCHAR(20),
    Sale_Invoice_ID INT(5),
    Sold_Drug_Quantity INT(6),
    Sold_Drug_Name VARCHAR(30),
    PRIMARY KEY (Batch_No, Drug_ID, Sale_Invoice_ID),
    FOREIGN KEY (Drug_ID) REFERENCES Drug(Drug_ID),
    FOREIGN KEY (Batch_No) REFERENCES Stored_Drug(Batch_No),
    FOREIGN KEY (Sale_Invoice_ID) REFERENCES Sale_Invoice(Sale_Invoice_ID)
);

-- Purchase Invoice Table
CREATE TABLE Purchase_Invoice (
    Purchase_Invoice_ID INT(5) PRIMARY KEY,
    Payment_Type VARCHAR(50),
    Total_Amount INT(10),
    Amount_Payed INT(10),
    Amount_Remaining INT(10),
    Purchase_Date DATE,
    Employee_ID INT(6),
    Supplier_ID INT(6),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- On Purchase Invoice Table (junction)
CREATE TABLE On_Purchase_Invoice (
    Drug_ID INT(10),
    Batch_No VARCHAR(20),
    Purchase_Invoice_ID INT(5),
    Purchased_Drug_Quantity INT(6),
    Purchased_Drug_Total_Price INT(8),
    PRIMARY KEY (Batch_No, Drug_ID, Purchase_Invoice_ID),
    FOREIGN KEY (Drug_ID) REFERENCES Drug(Drug_ID),
    FOREIGN KEY (Batch_No) REFERENCES Stored_Drug(Batch_No),
    FOREIGN KEY (Purchase_Invoice_ID) REFERENCES Purchase_Invoice(Purchase_Invoice_ID)
);
