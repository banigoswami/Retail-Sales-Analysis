# Retail Sales Analysis

## About the Project

This is a retail sales analytics project I built to understand how a business is performing across different products, customers, regions, and sales channels.

I started with the raw sales data, analyzed it using SQL, and then used Power BI to create an interactive dashboard.

The main goal was to move from raw data to useful business insights that could help with understanding sales and profitability.

## Tools Used

- MySQL
- SQL
- Power BI
- DAX

## Business Questions

The main questions I wanted to answer were:

- How much revenue and profit is the business generating?
- How are sales changing month by month?
- Which sales channels perform the best?
- Which customer segments contribute the most?
- Which states generate the most revenue and profit?
- Which product categories perform well?
- Which products generate the highest profit?
- How do discounts affect profitability?
- How are returns affecting the business?
- How does delivery performance vary?

## Data

The dataset contains retail order information such as:

- Order details
- Customer details
- Product details
- Customer segment
- Sales channel
- Payment method
- Revenue
- Cost
- Profit
- Discounts
- Delivery information
- Return information
- City and state

The SQL dataset contains:

- 11,340 order-line records
- 8,490 unique orders
- 575 unique customers

## SQL Analysis

I used MySQL to explore the data and answer different business questions.

Some of the analysis includes:

- Overall revenue and profit
- Monthly revenue and profit
- Sales channel performance
- Customer segment performance
- State-wise performance
- Product category performance
- Top products by revenue and profit
- Payment method performance
- Order status analysis
- Return analysis
- Discount and profit margin analysis
- Delivery performance
- Quarterly performance

I also used SQL functions such as:

- `GROUP BY`
- `ORDER BY`
- `COUNT`
- `COUNT DISTINCT`
- `SUM`
- `AVG`
- `CASE`
- `HAVING`
- `LIMIT`

## Power BI Dashboard

I created a 3-page Power BI dashboard to make the analysis easier to explore.

### Page 1 - Overview

This page gives a quick view of the overall sales performance.

It includes:

- Revenue
- Profit
- Orders
- Customers
- Profit Margin
- Average Order Value
- Monthly Revenue Trend
- Revenue by State
- Revenue by Sales Channel

### Page 2 - Customer & Regional Analysis

This page focuses on customer and regional performance.

It includes:

- Revenue by Customer Segment
- Profit by Customer Segment
- Profit by State
- Profit Margin by Customer Segment
- Customers by Acquisition Channel

### Page 3 - Product & Profitability

This page focuses on product-level performance.

It includes:

- Revenue by Product Category
- Profit by Product Category
- Profit by Product
- Profit Margin by Category
- Revenue vs Profit by Category

## Key Numbers From the SQL Analysis

Based on the order-line data:

- Total records: 11,340
- Unique orders: 8,490
- Unique customers: 575
- Total revenue: ₹411.30M
- Total profit: ₹58.98M
- Overall profit margin: 14.34%

The delivered orders generated approximately ₹392.06M in revenue and ₹60.62M in profit.

Returned orders generated approximately ₹19.23M in revenue and resulted in a negative profit contribution.

## What I Learned

Working on this project helped me get more comfortable with SQL and Power BI.

I practiced working with raw sales data, writing SQL queries, creating business metrics, using DAX measures, and building an interactive dashboard.

One thing I found useful was comparing different ways of looking at the same data. For example, total records and unique orders are different because the dataset contains order-line level records.

This also helped me understand why it is important to clearly define business metrics before using them in a report.

## Project Structure

Retail-Sales-Analytics/

├── retail_sales_analysis.sql
├── README.md
└── Retail_Sales_Dashboard.pbix

## Conclusion

This project gave me practical experience with the complete analytics process, from working with raw sales data and analyzing it using SQL to creating a Power BI dashboard and looking at the results from a business perspective.

I built this project to improve my practical skills in SQL, Power BI, DAX, and business analysis.