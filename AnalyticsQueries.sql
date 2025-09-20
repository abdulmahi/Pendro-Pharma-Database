-- Top-selling drugs by revenue

SELECT d.Drug_Name,
       SUM(osi.Sold_Drug_Quantity * d.Unit_Price) AS Total_Revenue
FROM Drug d
JOIN On_Sale_Invoice osi ON d.Drug_ID = osi.Drug_ID
JOIN Sale_Invoice si ON osi.Sale_Invoice_ID = si.Sale_Invoice_ID
GROUP BY d.Drug_Name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Supplier contribution to stock value

SELECT s.Company_Name,
       SUM(opi.Purchased_Drug_Quantity * opi.Purchased_Drug_Total_Price) AS Supplier_Value
FROM Supplier s
JOIN Purchase_Invoice pi ON s.Supplier_ID = pi.Supplier_ID
JOIN On_Purchase_Invoice opi ON pi.Purchase_Invoice_ID = opi.Purchase_Invoice_ID
GROUP BY s.Company_Name
ORDER BY Supplier_Value DESC;


-- Drugs nearing expiry (next 60 days)
SELECT d.Drug_Name, sd.Batch_No, sd.Expiry_Date, sd.Quantity_Available
FROM Stored_Drug sd
JOIN Drug d ON sd.Drug_ID = d.Drug_ID
WHERE sd.Expiry_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 60 DAY)
ORDER BY sd.Expiry_Date ASC;


--Profit margin per drug
SELECT d.Drug_Name,
       SUM(osi.Sold_Drug_Quantity * d.Unit_Price) AS Revenue,
       SUM(opi.Purchased_Drug_Total_Price) AS Cost,
       (SUM(osi.Sold_Drug_Quantity * d.Unit_Price) - SUM(opi.Purchased_Drug_Total_Price)) AS Profit,
       ROUND(((SUM(osi.Sold_Drug_Quantity * d.Unit_Price) - SUM(opi.Purchased_Drug_Total_Price)) 
               / SUM(opi.Purchased_Drug_Total_Price)) * 100, 2) AS Profit_Margin_Percent
FROM Drug d
JOIN On_Sale_Invoice osi ON d.Drug_ID = osi.Drug_ID
JOIN On_Purchase_Invoice opi ON d.Drug_ID = opi.Drug_ID
GROUP BY d.Drug_Name
ORDER BY Profit_Margin_Percent DESC;


-- Employee sales performance
SELECT e.First_Name, e.Last_Name,
       COUNT(DISTINCT si.Sale_Invoice_ID) AS Total_Transactions,
       SUM(osi.Sold_Drug_Quantity * d.Unit_Price) AS Total_Sales
FROM Employee e
JOIN Sale_Invoice si ON e.Employee_ID = si.Employee_ID
JOIN On_Sale_Invoice osi ON si.Sale_Invoice_ID = osi.Sale_Invoice_ID
JOIN Drug d ON osi.Drug_ID = d.Drug_ID
GROUP BY e.Employee_ID
ORDER BY Total_Sales DESC;


-- Customer purchase frequency & spend
SELECT c.First_Name, c.Last_Name,
       COUNT(DISTINCT si.Sale_Invoice_ID) AS Purchases,
       SUM(osi.Sold_Drug_Quantity * d.Unit_Price) AS Total_Spent
FROM Customer c
JOIN Sale_Invoice si ON c.Customer_ID = si.Customer_ID
JOIN On_Sale_Invoice osi ON si.Sale_Invoice_ID = osi.Sale_Invoice_ID
JOIN Drug d ON osi.Drug_ID = d.Drug_ID
GROUP BY c.Customer_ID
ORDER BY Total_Spent DESC;
