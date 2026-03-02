CREATE or ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '======================';
		PRINT 'Lading Bronze Layer';
		PRINT '======================';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table:bronze.superstore';
		TRUNCATE TABLE bronze.superstore;
		PRINT '>> Inserting Data Into:bronze.superstore';
		BULK INSERT bronze.superstore
		FROM 'C:\Users\Khai Foong\Desktop\Data Analyst Project\Project_1_superstore\modified_superstore.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';
	END TRY
	BEGIN CATCH
		PRINT '============================'
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);

	END CATCH
END