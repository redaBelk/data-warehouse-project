/*
=============================================================
Create Database and Schemas
=============================================================
This script creates a new database named 'DataWH' (and replaces it if it already exists), 
it also creates three schemas 'bronze', 'silver', and 'gold'.
	
WARNING:
Running this script will drop the entire 'DataWH' database if it already exists. 
*/    

USE master;
GO

-- if DataWH already exists, make it single user after immediately kicking all other connected users, then drop it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWH')
BEGIN
    ALTER DATABASE DataWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWH;
END;
GO

-- Create the 'DataWH' database
CREATE DATABASE DataWarehouse;
GO

USE DataWH;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
