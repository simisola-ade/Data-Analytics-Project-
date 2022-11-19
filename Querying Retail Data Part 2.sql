-- Playing around page

-- USING AGGREGATE FUNCTIONS to answer...
-- 1. What is the average tax per transaction?
SELECT AVG(Tax)
FROM data_analytics_project_niyo.transactions_v2;
-- 2. How many customers details were collected in this data set?
SELECT COUNT(customer_id)
FROM data_analytics_project_niyo.customer;

-- USING GROUP BY to answer...
-- What is the best performing store?
SELECT SUM(total_amt), Store_type
FROM data_analytics_project_niyo.transactions_v2
GROUP BY Store_type;

-- USING WHERE to answer...
-- On which dates did a male make a return? 
SELECT tran_date, Qty, Gender
FROM data_analytics_project_niyo.transactions_v2 table1
INNER JOIN data_analytics_project_niyo.customer table2
ON table1.cust_id = table2.customer_Id
WHERE Gender = 'M' AND Qty < '0';

-- USING CASE WHEN to...
-- analyse the result daily store performance across all stores 
SELECT tran_date, SUM(total_amt),
CASE
WHEN SUM(total_amt) < 0 THEN 'LOSS'
ELSE 'PROFIT'
END AS 'Daily Performance Across All Stores'
FROM data_analytics_project_niyo.transactions_v2
GROUP BY tran_date;


-- USING JOINS to answer...
-- Which gender spends the most and how much do they spend on average? 
SELECT Gender, SUM(total_amt), AVG(total_amt)
FROM data_analytics_project_niyo.transactions_v2 table1
INNER JOIN data_analytics_project_niyo.customer table2
ON table1.cust_id = table2.customer_Id
GROUP BY Gender
ORDER BY 2 DESC;

-- What is the best selling product?
SELECT SUM(Qty), prod_subcat, prod_cat
FROM data_analytics_project_niyo.transactions_v2 table1
INNER JOIN data_analytics_project_niyo.prod_cat_info table2
WHERE table1.prod_cat_code = table2.prod_cat_code
GROUP BY prod_sub_cat_code
ORDER BY 1 DESC;

-- Which product has the most returns?
SELECT SUM(Qty), prod_subcat, prod_cat
FROM data_analytics_project_niyo.transactions_v2 table1
INNER JOIN data_analytics_project_niyo.prod_cat_info table2
ON table1.prod_cat_code = table2.prod_cat_code
WHERE Qty < 0
GROUP BY prod_subcat
ORDER BY 1;

