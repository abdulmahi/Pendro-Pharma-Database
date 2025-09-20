-- 1. Employees and customers served on a given date
SELECT e.First_Name, e.Last_Name, c.First_Name, c.Last_Name, s.Sale_Date
FROM Employee e
JOIN Sale_Invoice s ON e.Employee_ID = s.Employee_ID
JOIN Customer c ON c.Customer_ID = s.Customer_ID
WHERE s.Sale_Date = '2023-07-15';

-- 2. Drugs available in storage with expiry
SELECT d.Drug_Name, sd.Batch_No, sd.Quantity_Available, sd.Expiry_Date
FROM Drug d
JOIN Stored_Drug sd ON d.Drug_ID = sd.Drug_ID;

-- 3. Check availability of a certain drug considering expiry
SELECT d.Drug_Name, SUM(sd.Quantity_Available) AS Total_Stock
FROM Drug d
JOIN Stored_Drug sd ON d.Drug_ID = sd.Drug_ID
WHERE d.Drug_Name = 'Paracetamol' AND sd.Expiry_Date > CURDATE()
GROUP BY d.Drug_Name;

-- 4. Profitability of selling a drug
SELECT d.Drug_Name, (osi.Sold_Drug_Quantity * d.Unit_Price) AS Revenue
FROM Drug d
JOIN On_Sale_Invoice osi ON d.Drug_ID = osi.Drug_ID
JOIN Sale_Invoice si ON si.Sale_Invoice_ID = osi.Sale_Invoice_ID
WHERE d.Drug_Name = 'Amoxicillin';

-- 5. Profit calculation (simplified)
SELECT d.Drug_Name,
       (osi.Sold_Drug_Quantity * d.Unit_Price) - opi.Purchased_Drug_Total_Price AS Profit
FROM Drug d
JOIN On_Sale_Invoice osi ON d.Drug_ID = osi.Drug_ID
JOIN On_Purchase_Invoice opi ON d.Drug_ID = opi.Drug_ID;
