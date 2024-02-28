show databases;
create database if not exists project;

CREATE TABLE sales(
Invoice_ID VARCHAR(20) NOT NULL PRIMARY KEY,
Branch VARCHAR(5) NOT NULL,
City VARCHAR(20) NOT NULL,
Customer_type VARCHAR(30) NOT NULL,    
Gender VARCHAR(10) NOT NULL, 
Product_line VARCHAR(100) NOT NULL,
Unit_Price DECIMAL(10, 2) NOT NULL,
Quantity INT NOT NULL, 
VAT FLOAT(6, 4) NOT NULL,
Total DECIMAL(10, 2) NOT NULL,
Date  DATE NOT NULL,
Time TIME NOT NULL,
Payment_method DECIMAL(10.2) NOT NULL,
cogs DECIMAL(10, 2) NOT NULL,
Gross_margin_percentage FLOAT(11, 9) NOT NULL,
Gross_income DECIMAL(10, 2) NOT NULL,
Rating FLOAT(2, 1) NOT NULL
);

Alter table sales
Modify Payment_method VARCHAR(15) NOT NULL;



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------FEATURE ENGINEERING-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Time of the day

Alter table sales
ADD COLUMN Time_of_day VARCHAR(10) NOT NULL;

Alter table sales
RENAME COLUMN time_of_day TO Time_of_day;

UPDATE sales
SET Time_of_day=(CASE
	      WHEN `Time` BETWEEN "00:00:00" AND "03:59:59" THEN 'Midnight'
          WHEN `Time` BETWEEN '04:00:00' AND '11:59:59' THEN 'Morning'
		  WHEN `Time` BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
          ELSE 'Evening'
          END);
          

--Day,Month and Year Name

ALTER TABLE sales
ADD COLUMN Day VARCHAR(10);

ALTER TABLE sales
ADD COLUMN Month_Name VARCHAR(10),
ADD COLUMN Year INT;

UPDATE sales
SET Day = DAYNAME(Date) ;

UPDATE sales
SET Month_Name=MONTHNAME(Date),
YEAR= YEAR(Date);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Business Questions To Answer
Generic Question
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*1. How many unique cities does the data have?*/
SELECT COUNT(DISTINCT City)
FROM sales;

/*2. In which city is each branch?*/
SELECT DISTINCT City,Branch
FROM sales;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Product
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*1. How many unique product lines does the data have?*/
SELECT DISTINCT Product_line
FROM sales;

/*2. What is the most common payment method?*/
SELECT Payment_method,count(Payment_method) as MCPM
FROM sales
GROUP BY Payment_method
ORDER BY MCPM DESC
LIMIT 1;

/*3. What is the most selling product line?*/
SELECT Product_line, SUM(Quantity) as total_sold
FROM sales
GROUP BY Product_line
ORDER BY total_sold DESC
LIMIT 1;

/*4. What is the total revenue by month?*/
SELECT Month_Name,SUM(Total) AS Total_revenue
FROM sales
GROUP BY Month_Name
ORDER BY Total_revenue DESC;

/*5. What month had the largest COGS?*/
SELECT Month_Name,SUM(cogs) AS COGS
FROM sales
GROUP BY Month_Name
ORDER BY COGS
LIMIT 1;

/*6. What product line had the largest revenue?*/
SELECT Product_line,SUM(Total) AS REVENUE
FROM sales
GROUP BY Product_line
ORDER BY REVENUE DESC
LIMIT 1;

/*7. What is the city with the largest revenue?*/
SELECT City,SUM(Total) AS REVENUE
FROM sales
GROUP BY City 
ORDER BY REVENUE DESC
LIMIT 1;
/*8. What product line had the largest VAT?*/
SELECT Product_line,AVG(VAT) AS Value_added_tax
FROM sales
GROUP BY Product_line
ORDER BY Value_added_tax DESC
LIMIT 1;

/*9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales*/
SELECT Product_line,
(CASE
	WHEN SUM(Quantity)>(SELECT AVG(Quantity) FROM sales) THEN "GOOD"
    ELSE "BAD"
END) AS Sales_Category
FROM sales
GROUP BY Product_line;
    
/*10. Which branch sold more products than average product sold?*/
SELECT Branch,SUM(Quantity) AS QTY
FROM sales
GROUP BY Branch
HAVING QTY > (SELECT AVG(Quantity) FROM sales);

/*11. What is the most common product line by gender?*/
SELECT Product_line,Gender,COUNT(Product_line) as MCP
FROM sales
GROUP BY Product_line,Gender
ORDER BY MCP DESC;

/*12. What is the average rating of each product line?*/
SELECT Product_line,ROUND(AVG(Rating),1) as Average_Rating
FROM sales
GROUP BY Product_line
ORDER BY Average_Rating DESC;



drop table sales;




