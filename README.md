# Walmart Sales Data Analysis

## Overview
This project aims to analyze Walmart sales data to gain insights into branch performance, popular products, customer behavior, and revenue trends. The dataset used is from the Kaggle Walmart Sales Forecasting Competition, which includes historical sales data from 45 stores, each with multiple departments and holiday markdown events.

## Purpose
The purpose of this analysis is to provide actionable insights to Walmart for better strategies and optimizations. By understanding sales patterns, product popularity, and customer preferences, Walmart can make informed decisions to improve sales performance and operational efficiency.

## Dataset Description
The dataset contains the following 17 columns:

1. **Invoice_Id**: Invoice of the sales
2. **Branch**: Branch at which sales were made
3. **City**: The location of the branch
4. **Customer_type**: The type of customer
5. **Gender**: Gender of the customer
6. **Product_line**: Product line of the product sold
7. **Unit_price**: Price of each product
8. **Quantity**: Number of products sold
9. **VAT**: The amount of tax of the purchase
10. **Total**: The total cost of the purchase
11. **Date**: Product purchase date
12. **Time**: Product purchase time
13. **Payment_method**: Mode of payment
14. **Cogs**: Cost of Goods sold
15. **Gross_margin_percentage**: Gross margin percentage
16. **Gross_income**: Gross income
17. **Rating**: Rating

## Steps

### 1. Data Wrangling
- Inspection of data to ensure no missing or NULL values.
- Building database and creating tables.

### 2. Feature Engineering
- Addition of new columns:
  1. `time_of_day`: Insight into sales in the Morning, Afternoon, and Evening.
  2. `day_name`: Extraction of days of the week to determine busiest days for each branch.
  3. `month_name`: Extraction of months to identify peak sales months.

## Business Questions Answered
### Generic Questions
1. Number of unique cities in the data.
2. City of each branch.

### Product
1. Number of unique product lines.
2. Most common payment method.
3. Most selling product line.
4. Total revenue by month.
5. Month with the largest COGS.
6. Product line with the largest revenue.
7. City with the largest revenue.
8. Product line with the largest VAT.
9. Product line categorization as "Good" or "Bad" based on average sales.
10. Branches with more products sold than the average.
11. Most common product line by gender.
12. Average rating of each product line.

### Sales
1. Number of sales made in each time of the day per weekday.
2. Customer type bringing the most revenue.
3. City with the largest tax percent/VAT.
4. Customer type paying the most in VAT.

### Customer
1. Number of unique customer types.
2. Number of unique payment methods.
3. Most common customer type.
4. Customer type buying the most.
5. Gender distribution of customers.
6. Gender distribution per branch.
7. Time of the day customers give most ratings.
8. Time of the day customers give most ratings per branch.
9. Day of the week with the best average ratings.
10. Day of the week with the best average ratings per branch.

## Revenue and Profit Calculations
1. COGS: `unit_price x quantity`
2. VAT: 5% of COGS
3. Total Revenue (gross sales): VAT + COGS
4. Gross Income: Total Revenue - COGS
5. Gross Margin Percentage: Gross Income / Total Revenue

## Conclusion
This analysis provides valuable insights for Walmart to enhance sales strategies and operations. By leveraging the findings on product performance, customer behavior, and revenue trends, Walmart can optimize its business processes and drive growth.
