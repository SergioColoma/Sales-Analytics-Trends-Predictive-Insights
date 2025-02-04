SELECT * FROM SupermarketSales.supermarket_sales;
USE SupermarketSales;
SHOW DATABASES;
SHOW TABLES;
SELECT * FROM supermarket_sales LIMIT 10;
-- Calculate the total sales by branch
SELECT Branch, SUM(Total) AS Total_Sales
FROM supermarket_sales
GROUP BY Branch;
-- Calculate total sales by month to identify trends over time
SELECT YEAR(STR_TO_DATE(Date, '%m/%d/%Y')) AS Year,
       MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month,
       SUM(Total) AS Total_Sales
FROM supermarket_sales
GROUP BY YEAR(STR_TO_DATE(Date, '%m/%d/%Y')), MONTH(STR_TO_DATE(Date, '%m/%d/%Y'))
ORDER BY Year, Month;
-- Compare total sales between members and non-members
SELECT `customer type`, SUM(Total) AS Total_Sales
FROM supermarket_sales
GROUP BY `customer type`;
-- Analyze sales by gender and product line
SELECT Gender, `Product line`, SUM(Total) AS Total_Sales
FROM supermarket_sales
GROUP BY Gender, `Product line`
ORDER BY Total_Sales DESC;
-- Count the number of times each payment method was used
SELECT Payment, COUNT(*) AS Payment_Count
FROM supermarket_sales
GROUP BY Payment;
-- Calculate the average gross margin percentage by product line
SELECT `Product line`, AVG(`Gross margin percentage`) AS Avg_Gross_Margin
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY Avg_Gross_Margin DESC;
-- Calculate the average customer rating for each branch
SELECT Branch, AVG(Rating) AS Average_Rating
FROM supermarket_sales
GROUP BY Branch;
-- Compare customer satisfaction based on payment method
SELECT Payment, AVG(Rating) AS Average_Rating
FROM supermarket_sales
GROUP BY Payment;
-- Analyze the price distribution by product line
SELECT `Product line`, MIN(`Unit price`) AS Min_Price, MAX(`Unit price`) AS Max_Price, AVG(`Unit price`) AS Avg_Price
FROM supermarket_sales
GROUP BY `Product line`;
-- Analyze the relationship between unit price and quantity sold
SELECT `Unit price`, SUM(Quantity) AS Total_Quantity_Sold
FROM supermarket_sales
GROUP BY `Unit price`
ORDER BY `Unit price`;

