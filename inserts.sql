-- Insert into Supplier
INSERT INTO Supplier (Supplier_ID, Company_Name, Contact_No, Address)
VALUES 
(100001, 'Beximco Pharma', '021-999999', 'Dhaka, Bangladesh'),
(100002, 'Square Pharma', '021-888888', 'Dhaka, Bangladesh'),
(100003, 'Pfizer', '021-777777', 'New York, USA'),
(100004, 'Cipla', '021-666666', 'Mumbai, India'),
(100005, 'AstraZeneca', '021-555555', 'London, UK');

-- Insert into Drug
INSERT INTO Drug (Drug_ID, Drug_Name, Drug_Category, Storage_Temperature, No_of_Unit_in_Package, Drug_Manufacturer, Unit_Price, Storage_Location)
VALUES
(200000001, 'Paracetamol', 'Analgesic', 25.00, 20, 'Beximco', 5, 'Shelf A'),
(200000002, 'Amoxicillin', 'Antibiotic', 18.00, 10, 'Square Pharma', 12, 'Shelf B'),
(200000003, 'Atorvastatin', 'Cardiovascular', 20.00, 30, 'Pfizer', 22, 'Shelf C'),
(200000004, 'Omeprazole', 'Gastrointestinal', 22.00, 15, 'Cipla', 18, 'Shelf D'),
(200000005, 'Metformin', 'Antidiabetic', 24.00, 25, 'AstraZeneca', 20, 'Shelf E'),
(200000006, 'Ibuprofen', 'Analgesic', 26.00, 50, 'Pfizer', 8, 'Shelf F'),
(200000007, 'Azithromycin', 'Antibiotic', 19.00, 10, 'Square Pharma', 15, 'Shelf G');

-- Insert into Customer
INSERT INTO Customer (First_Name, Last_Name, Contact_Number, Address)
VALUES
('John', 'Doe', '0450-123456', 'Melbourne, Australia'),
('Mary', 'Smith', '0450-654321', 'Sydney, Australia'),
('Rahul', 'Patel', '0987-111222', 'Mumbai, India'),
('Alice', 'Brown', '0321-555666', 'London, UK'),
('Michael', 'Johnson', '0312-777888', 'New York, USA');

-- Insert into Employee
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Date_of_Birth, Joining_Year, Contact_Number, Address, Job_Desc, Salary, Store_ID)
VALUES
(300001, 'Ali', 'Rahman', '1995-05-10', 2020, '0450-111222', 'Dhaka', 'Cashier', 40000, 1),
(300002, 'Sara', 'Khan', '1990-08-21', 2018, '0450-222333', 'Melbourne', 'Pharmacist', 60000, 1),
(300003, 'David', 'Miller', '1985-02-15', 2015, '0450-333444', 'Sydney', 'Inventory Manager', 75000, 2),
(300004, 'Emily', 'Clark', '1993-11-05', 2021, '0450-444555', 'London', 'Sales Assistant', 35000, 3),
(300005, 'James', 'Wilson', '1988-07-30', 2017, '0450-555666', 'New York', 'Pharmacist', 65000, 4);
