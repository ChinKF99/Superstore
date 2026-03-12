--CREATE or ALTER PROCEDURE silver.create_load_silver AS

IF OBJECT_ID ('silver.customer_dim','U') IS NOT NULL
	DROP TABLE silver.customer_dim;

IF OBJECT_ID ('silver.product_dim','U') IS NOT NULL
	DROP TABLE silver.product_dim;

IF OBJECT_ID ('silver.product_fact','U') IS NOT NULL
	DROP TABLE silver.product_fact;

BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE()
		PRINT '========================================================';
		PRINT 'Creating & Loading data into silver.customer_dim';
		PRINT '========================================================';

		SET @start_time = GETDATE();

		SELECT DISTINCT 
			customer_id,
			customer_name
		INTO silver.customer_dim
		FROM bronze.superstore;

		SET @end_time = GETDATE();

		PRINT '>> Successfully create and load silver.customer_dim';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';


		PRINT '========================================================';
		PRINT 'Creating & Loading data into silver.product_dim';
		PRINT '========================================================';

		SET @start_time = GETDATE();

		SELECT DISTINCT 
			product_id,
			category,
			product_name
		INTO silver.product_dim
		FROM bronze.superstore;

		SET @end_time = GETDATE();

		PRINT '>> Successfully create and load silver.product_dim';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';


		PRINT '========================================================';
		PRINT 'Creating & Loading data into silver.product_fact';
		PRINT '========================================================';

		SET @start_time = GETDATE();

		SELECT DISTINCT 
			product_id,
			sales,
			profit
		INTO silver.product_fact
		FROM bronze.superstore;

		SET @end_time = GETDATE();

		PRINT '>> Successfully create and load silver.product_fact';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';

		SET @batch_end_time = GETDATE()
			PRINT '>> Creating and loading silver layer is complete';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';
	END TRY

	BEGIN CATCH
		PRINT '========================================================';
		PRINT 'ERROR OCCURED DURING CREATING AND LOADING SILVER LAYER';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
	END CATCH
END