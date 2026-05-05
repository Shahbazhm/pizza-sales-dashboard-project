/*
==================================================================
Stored Prcedure: Load Database Tables (Staging -> Final)
==================================================================
Script Purpose:
This stored procedure performs the ETL (Extract, Transform, Load)
process to populate the 'final' table/s from the 'staging'
table/s.
It performs the following actions:
- Truncate the final table/s.
- Inserts Transformed and Cleansed data from staging into final
table/s.

Paramaters:
None.
This stored procedure does not accept any parameters or RETURN
any values.

Usage Example: EXEC dbo.load_final;
*/

CREATE OR ALTER PROCEDURE dbo.load_final AS

BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;	

	BEGIN TRY
	
		SET @batch_start_time = GETDATE ();
	
		PRINT '----------------------------------------';
		PRINT 'Loading Final Tables';
		PRINT '----------------------------------------';
		
		SET @start_time = GETDATE ();
		
		PRINT '>> Truncating Table: dbo.pizza_sales';	
		TRUNCATE TABLE dbo.pizza_sales;
		
		PRINT '>> Insering Data Into: dbo.pizza_sales';
		INSERT INTO dbo.pizza_sales
		SELECT 
			pizza_id,
			order_id,
			pizza_name_id,
			quantity,
			CONVERT(DATE, order_date, 105) AS order_date,  -- Specify DD-MM-YYYY format
			CONVERT(TIME, order_time) AS order_time,
			unit_price,
			total_price,
			pizza_size,
			pizza_category,
			pizza_ingredients,
			pizza_name
		FROM dbo.pizza_sales_staging;
		
		SET @end_time = GETDATE ();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '-------------';
						
		SET @batch_end_time = GETDATE ();
		PRINT '========================================';
		PRINT 'Loading Final Tables is Completed';
		PRINT '  - Total Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' Seconds';
		PRINT '========================================';
		
	END TRY
	
	BEGIN CATCH
    PRINT '========================================';
    PRINT 'ERROR OCCURED DURING LOADING FINAL TABLES';
    PRINT ERROR_MESSAGE();
    PRINT CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT CAST(ERROR_STATE() AS NVARCHAR);
    PRINT '========================================';
END CATCH

END