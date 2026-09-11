drop table if exists zepto;
USE zepto_sql_project;

CREATE TABLE zepto (
    sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);

ALTER TABLE zepto
ADD COLUMN sku_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- data exploration 
-- count of rows
SELECT COUNT(*) FROM zepto;
SELECT* FROM zepto
LIMIT 10;
DESCRIBE zepto;

-- null values 
SELECT * FROM zepto
WHERE name IS NULL
OR
ï»¿Category IS NULL
OR
 mrp IS NULL
OR
discountpercent IS NULL
OR
discountedSellingPrice IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product catgories
SELECT DISTINCT ï»¿category
FROM zepto
ORDER BY ï»¿category;

-- product in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times 
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id)> 1
ORDER BY count(sku_id) DESC;

-- data cleaning

-- products with price= 0
SELECT * FROM zepto
WHERE mrp = 0 
OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE sku_id = 3447;

-- convert paise to rupees
SET SQL_SAFE_UPDATES = 0;

UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

SET SQL_SAFE_UPDATES = 1;

SELECT mrp, discountedSellingPrice
FROM zepto;

-- 	Q1. Find the top 10 best-value products based on the discount percentage.
 SELECT DISTINCT name, mrp, discountPercent 
 FROM zepto
 ORDER BY discountPercent DESC
 LIMIT 10;
 
 -- Q2. What are the Products with High MRP but Out of Stock 
 SELECT DISTINCT name, mrp
 FROM zepto
 WHERE mrp > 300
 AND outOfStock = TRUE
 ORDER BY mrp DESC;
 
 -- Q3. Calculate Estimated Revenue for each category
 SELECT  ï»¿category, SUM(availableQuantity * discountedSellingPrice) as total_revenue
 FROM zepto
 GROUP BY ï»¿category
 ORDER BY total_revenue;
 
 -- Q4. Find all products where MRP is greatrer than 500 rupees and discount is less than 10%.
 SELECT DISTINCT name, mrp, discountPercent 
 FROM zepto 
 WHERE mrp > 500 AND discountPercent < 10 
 ORDER BY mrp DESC, discountPercent DESC;
 
 -- Q5. Identify the top 5 categories offering the highest average discount percentage.
 SELECT ï»¿category,
 ROUND(AVG(discountPercent),2) AS avg_discount
 FROM zepto
 GROUP BY ï»¿category
 ORDER BY avg_discount DESC
 LIMIT 5;
 
 -- Q6. Find the price per gram for products above 100g and sort by best value.
 SELECT DISTINCT name, weightInGms, discountedSellingPrice, 
 ROUND(discountedSellingPrice/weightInGms, 2) AS price_per_gram
 FROM zepto 
 WHERE weightInGms >= 100
 ORDER BY price_per_gram DESC;
 
 -- Q7. Group the productss into categories like Low, Medium, Bulk.
 SELECT DISTINCT name, weightInGms, 
 CASE WHEN weightInGms < 1000 THEN 'Low'
      WHEN weightInGms < 5000 THEN 'Medium'
      ELSE 'Bulk'
      END AS weight_category
FROM zepto;
 
 -- Q8. What is the Total Inventory Weight Per Category
 SELECT ï»¿category, 
 SUM(weightInGms * availableQuantity) AS total_weight
 FROM zepto
 GROUP BY ï»¿category
 ORDER BY total_weight;
 