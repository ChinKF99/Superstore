CREATE VIEW gold.fact_sales AS

	SELECT 
	cd.customer_id,
	cd.customer_name,
	cd.order_id,
	pd.category,
	pd.product_name,
	pd.sales
	FROM silver.customer_detail AS cd
	LEFT JOIN silver.product_detail AS pd
	ON cd.order_id = pd.order_id