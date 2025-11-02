-- =============================================
-- Create Database and Schemas
-- =============================================

-- Script Purpose:
--     This script creates a new database named 'DataWarehouse' after checking if it already exists.
--     If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
--     within the database: 'bronze', 'silver', and 'gold'.

-- WARNING:
--     Running this script will drop the entire 'DataWarehouse' database if it exists.
--     All data in the database will be permanently deleted. Proceed with caution
--     and ensure you have proper backups before running this script.

-- =============================================
-- Drop and recreate the 'DataWarehouse' database  
-- =============================================
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')  
BEGIN  
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  
    DROP DATABASE DataWarehouse;  
END;  
GO

-- =============================================
-- Create the database
-- =============================================
CREATE DATABASE DataWarehouse;
GO

-- =============================================
-- Switch to the new database and create schemas
-- =============================================
USE DataWarehouse;

-- Create Bronze schema for raw data ingestion
CREATE SCHEMA Bronz;
GO 

-- Create Silver schema for cleaned and processed data
CREATE SCHEMA Sliver;
GO

-- Create Gold schema for business-ready aggregated data
CREATE SCHEMA Gold;
GO
