-- Checking for null or duplicates in the primary key (Customer_id as Primary Key)
-- Expectation: No result
SELECT
customer_id,
count(*)
FROM
bronze.superstore
GROUP BY customer_id
HAVING count(*) > 1 or customer_id IS NULL

-- Check for unwanted spaces
-- Expectation: No result
SELECT
ship_mode
FROM bronze.superstore
where TRIM(ship_mode) != ship_mode


-- Check for distinct values
SELECT
DISTINCT(CUSTOMER_ID)
FROM bronze.superstore

