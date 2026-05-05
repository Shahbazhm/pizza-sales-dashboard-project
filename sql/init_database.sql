/* 
========================================================================
Create New Database 
========================================================================

Script Purpose:
	- This script creates a new database named 'Pizza DB' after checking if it already exists.
	- If the database exists, it is dropped and recreated. 
	
Warning:
	- Running this script drops the entire 'Pizza DB' database if it exists.
	- All data in the database will be permanently deleted. 
	- Proceed with caution and ensure that you have proper backups before running this script.
*/


USE master;
GO

--Drop and recreate the 'Pizza DB' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Pizza DB')
BEGIN
	ALTER DATABASE 'Pizza DB' SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE 'Pizza DB';
END;
GO

-- Create Database 'Pizza DB'

CREATE DATABASE 'Pizza DB';
GO

USE 'Pizza DB';
GO



