/*
==================================================================
Stored Prcedure: Load Database Tables (Source -> Staging)
==================================================================
Script Purpose:
This stored procedure loads data into the 'staging' table/s from CSV
file/s.
It performs the following actions:
- Truncate the existing tables before loading data.
- Use 'BULK INSERT' command to load data from CSV files to 'staging' 
table/s.

Paramaters:
None.
This stored procedure does not accept any parameters or RETURN
any values.

Usage Example: EXEC dbo.load_staging;
*/

CREATE OR ALTER PROCEDURE dbo.load_staging AS

BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;	

	BEGIN TRY
	
		SET @batch_start_time = GETDATE ();
	
		PRINT '----------------------------------------';
		PRINT 'Loading Staging Tables';
		PRINT '----------------------------------------';
		
		SET @start_time = GETDATE ();
		
		PRINT '>> Truncating Table: dbo.pizza_sales_staging';	
		TRUNCATE TABLE dbo.pizza_sales_staging;
		
		PRINT '>> Insering Data Into: dbo.pizza_sales_staging';
		BULK INSERT dbo.pizza_sales_staging
		FROM 'C:\Users\shahb\Downloads\END TO END PORTFOLIO PROJECTS\Pizza Sales Dashboard\data\pizza_sales.csv'
		WITH (
			FORMAT = 'CSV',  -- Use this if SQL Server 2017+
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		
		SET @end_time = GETDATE ();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '-------------';
						
		SET @batch_end_time = GETDATE ();
		PRINT '========================================';
		PRINT 'Loading Staging Tables is Completed';
		PRINT '  - Total Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' Seconds';
		PRINT '========================================';
		
	END TRY
	
	BEGIN CATCH
    PRINT '========================================';
    PRINT 'ERROR OCCURED DURING LOADING STAGING TABLES';
    PRINT ERROR_MESSAGE();
    PRINT CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT CAST(ERROR_STATE() AS NVARCHAR);
    PRINT '========================================';
END CATCH

END