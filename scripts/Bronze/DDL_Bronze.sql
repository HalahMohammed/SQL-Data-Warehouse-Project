
/*
=============================
DDL Script: Create Bronze Tables
=============================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables if they already exist.
    Run this script to re-define the DDL structure of 'bronze' Tables
=============================
*/


use DataWarehouse

if OBJECT_ID(' bronz.cm_customer_info','U') is not null
	drop table bronz.cm_customer_info;



-- Drop from bronze schema, create in bronze schema
IF OBJECT_ID('bronz.cm_customer_info', 'U') IS NOT NULL
    DROP TABLE bronz.cm_customer_info;
GO

CREATE TABLE bronz.cm_customer_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(100),
    cst_lastname VARCHAR(200),
    cst_marital_status VARCHAR(200),
    cst_gndr VARCHAR(200),
    cst_create_date DATE
);


-- Drop from bronze schema, create in bronze schema
IF OBJECT_ID('bronz.cm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronz.cm_sales_details;
GO
create table bronz.cm_sales_details(
	sls_ord_num varchar(100),
	sls_prd_key varchar(100)
	,sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,sls_quantity int,
	sls_price int)

-- Drop from bronze schema, create in bronze schema

IF OBJECT_ID('bronz.cm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronz.cm_prd_info;
GO

create table bronz.cm_prd_info(

prd_id int,
prd_key varchar(100),
prd_nm varchar(200),
prd_cost int,
prd_line varchar(5),
prd_start_dt date,
prd_end_dt date);

IF OBJECT_ID('bronz.erp_CUST_AZ12', 'U') IS NOT NULL
    DROP TABLE bronz.erp_CUST_AZ12;
GO

create table bronz.erp_CUST_AZ12
(CID varchar(200)
,BDATE date,
GEN varchar(50)
)

IF OBJECT_ID('bronz.erp_LOC_A101', 'U') IS NOT NULL
    DROP TABLE bronz.erp_LOC_A101;
GO
create table bronz.erp_LOC_A101(
CID varchar(200),CNTRY varchar(150)
)

IF OBJECT_ID('bronz.erp_PX_CAT_G1V2', 'U') IS NOT NULL
    DROP TABLE bronz.erp_PX_CAT_G1V2;
GO
create table bronz.erp_PX_CAT_G1V2(

ID varchar(150),
CAT varchar(150),
SUBCAT varchar(150),
MAINTENANCE varchar(150)
)

