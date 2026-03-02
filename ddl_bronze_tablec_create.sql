IF OBJECT_ID ('bronze.superstore','U') IS NOT NULL
	DROP TABLE bronze.superstore

CREATE TABLE bronze.superstore(
row_id INT,
order_id NVARCHAR(100),
order_date DATE,
ship_date DATE,
ship_mode NVARCHAR(100),
customer_id NVARCHAR(100),
customer_name NVARCHAR(100),
segment NVARCHAR(100),
country NVARCHAR(100),
city NVARCHAR(100),
state_name NVARCHAR(100),
postal_code NVARCHAR(100),
region NVARCHAR(100),
product_id NVARCHAR(100),
category NVARCHAR(100),
sub_category NVARCHAR(100),
product_name NVARCHAR(1000),
sales FLOAT,
quantity INT,
discount FLOAT,
profit FLOAT
)