/*
=============================================================
DDL Script: Create Final Table/s
=============================================================
Script Purpose:
This script creates final table/s in the 'Pizza DB' database, dropping
existing tables if they already exist.

Run this script to re-define the DDL structure of the 'Pizza DB' 
final table/s.
=============================================================
*/

IF OBJECT_ID ('dbo.pizza_sales', 'U') IS NOT NULL
	DROP TABLE dbo.pizza_sales;
	
CREATE TABLE dbo.pizza_sales (
	pizza_id 			int  		 NOT NULL,
	order_id 			int 		 NOT NULL,
	pizza_name_id		varchar (50) NOT NULL,
	quantity 			int 	 	 NOT NULL,
	order_date 			date	     NOT NULL,	-- Now DATE type
	order_time 			time		 NOT NULL,	-- Now TIME type
	unit_price 			decimal(10,2)NOT NULL,
	total_price 		decimal(10,2)NOT NULL,
	pizza_size 			varchar (5) NOT NULL,
	pizza_category 		varchar (50) NOT NULL,
	pizza_ingredients 	varchar (500)NOT NULL,
	pizza_name 			varchar (50) NOT NULL
); 
GO	

