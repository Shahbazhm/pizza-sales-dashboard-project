/*
=============================================================
DDL Script: Create Staging Table/s
=============================================================
Script Purpose:
This script creates staging table/s in the 'Pizza DB' database, dropping
existing tables if they already exist.

Run this script to re-define the DDL structure of the 'Pizza DB' 
staging table/s.
=============================================================
*/

IF OBJECT_ID ('dbo.pizza_sales_staging', 'U') IS NOT NULL
	DROP TABLE dbo.pizza_sales_staging;
	
CREATE TABLE dbo.pizza_sales_staging (
	pizza_id 			int  		 NOT NULL,
	order_id 			int 		 NOT NULL,
	pizza_name_id		varchar (50) NOT NULL,
	quantity 			tinyint 	 NOT NULL,
	order_date 			VARCHAR(20)  NOT NULL,	-- Import as VARCHAR
	order_time 			VARCHAR(20)	 NOT NULL,	-- Import as VARCHAR
	unit_price 			float 		 NOT NULL,
	total_price 		float 		 NOT NULL,
	pizza_size 			varchar (50) NOT NULL,
	pizza_category 		varchar (50) NOT NULL,
	pizza_ingredients 	varchar (200)NOT NULL,
	pizza_name 			varchar (50) NOT NULL
); 
GO	
