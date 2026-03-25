EXEC silver.create_load_silver

CREATE or ALTER PROCEDURE silver.create_load_silver AS

	IF OBJECT_ID ('silver.customer_detail','U') IS NOT NULL
		DROP TABLE silver.customer_detail;

	IF OBJECT_ID ('silver.product_detail','U') IS NOT NULL
		DROP TABLE silver.product_detail;


	BEGIN
		DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
		BEGIN TRY
			SET @batch_start_time = GETDATE()
			PRINT '========================================================';
			PRINT 'Creating & Loading data into silver.customer_detail';
			PRINT '========================================================';

			SET @start_time = GETDATE();

			SELECT DISTINCT 
				customer_id,
				customer_name,
				order_id
			INTO silver.customer_detail
			FROM bronze.superstore;

			SET @end_time = GETDATE();

			PRINT '>> Successfully create and load silver.customer_detail';
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
			PRINT '>> ----------';


			PRINT '========================================================';
			PRINT 'Creating & Loading data into silver.product_detail';
			PRINT '========================================================';

			SET @start_time = GETDATE();

			SELECT DISTINCT 
				order_id,
				product_id,
				category,
				product_name,
				sales
			INTO silver.product_detail
			FROM bronze.superstore;

			SET @end_time = GETDATE();

			PRINT '>> Successfully create and load silver.product_detail';
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