# Zepto E-commerce SQL Data Analysis

## Project Overview

This project analyzes a Zepto e-commerce product dataset using MySQL to explore product pricing, discounts, inventory availability, and category-level trends.

The analysis involved data exploration and cleaning, followed by SQL-based queries to identify pricing patterns, highly discounted products, out-of-stock products, category-wise revenue estimates, and inventory characteristics.

## Tools Used

- MySQL
- SQL

## Key Analysis Performed

- Explored the dataset by examining row counts, table structure, product categories, and stock availability.
- Identified products appearing under multiple SKUs.
- Cleaned the dataset by identifying zero-priced products and removing invalid records.
- Converted product prices from paise to rupees for analysis.
- Identified the top 10 products based on discount percentage.
- Analyzed high-MRP products that were out of stock.
- Estimated category-wise revenue using available quantity and discounted selling price.
- Identified high-priced products offering low discounts.
- Compared average discount percentages across product categories.
- Calculated price per gram to evaluate product pricing.
- Classified products into Low, Medium, and Bulk weight categories.
- Calculated total inventory weight by product category.

## SQL Concepts Used

- SELECT
- WHERE
- DISTINCT
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- Aggregate Functions
- CASE WHEN
- ROUND
- UPDATE
- DELETE
- ALTER TABLE

## Project Files

- `zepto_analysis.sql` – Contains the SQL queries used for data exploration, cleaning, and analysis.
