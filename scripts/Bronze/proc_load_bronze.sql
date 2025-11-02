/*

---
Stored Procedure: Load Bronze Layer (Source -> Bronze)
---
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK` `INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
---

*/



CREATE OR ALTER PROCEDURE bronz.load_bronze
as begin

begin try
	declare @start_time_batch datetime,@end_time_batch datetime
	set @start_time_batch=GETDATE()
	print '----------------------------------------------'

	print 'Loading the bronze layer'

	print '----------------------------------------------'

	print('loading cm tables')
	print '----------------------------------------------'
  declare @start_time datetime, @end_time datetime;
	print('truncate table bronz.cm_customer_info')
	set @start_time=getdate();

	truncate table bronz.cm_customer_info;
	print('Insert table bronz.cm_customer_info')

	BULK INSERT bronz.cm_customer_info 

	FROM '\datasets\source_crm\cust_info.csv'
	with(firstrow=2,
	FIELDTERMINATOR=',',
	tablock);
	set @end_time=getdate();
	print 'Loading time is ' + cast(datediff(second,@start_time,@end_time) as nvarchar)+ ' secondes'

  print '----------------------------------------------'

	print('truncatetable bronz.cm_sales_details')
	set @start_time=getdate();
	truncate table bronz.cm_sales_details;
	print('Insert table bronz.cm_sales_details')
	bulk insert bronz.cm_sales_details
	from '\source_crm\sales_details.csv'
	with(

	firstrow=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	set @end_time=GETDATE();
	print 'Loading time is ' + cast(datediff(second,@start_time,@end_time) as nvarchar)+ ' secondes'
  print '----------------------------------------------'

	set @start_time=GETDATE()
  print('truncate table bronz.cm_prd_info')
	truncate table bronz.cm_prd_info ;
	print('insert table bronz.cm_prd_info')
	bulk insert bronz.cm_prd_info 
	from  '\datasets\source_crm\prd_info.csv'
	with(firstrow=2,
	FIELDTERMINATOR=',',
	tablock)
	set @end_time=GETDATE();
	print 'Loading time is ' + cast(datediff(second,@start_time,@end_time) as nvarchar)+ ' secondes'


	print '----------------------------------------------'
	print('loading erp tablea')
	print '----------------------------------------------'
	print('truncate table bronz.erp_CUST_AZ12')
	set @start_time=GETDATE()


	truncate table bronz.erp_CUST_AZ12 ;

	print('insert table bronz.erp_CUST_AZ12')

	bulk insert bronz.erp_CUST_AZ12 

	from  '\datasets\source_erp\CUST_AZ12.csv'
	with(firstrow=2,
	FIELDTERMINATOR=',',
	tablock)
	set @end_time=GETDATE();
	print 'Loading time is ' + cast(datediff(second,@start_time,@end_time) as nvarchar)+ ' secondes'

	set @start_time=GETDATE();
	print('truncate table bronz.erp_LOC_A101')
	truncate table bronz.erp_LOC_A101;
	print('insert  table bronz.erp_LOC_A101')

	bulk insert bronz.erp_LOC_A101

	from  'datasets\source_erp\LOC_A101.csv'
	with(firstrow=2,
	FIELDTERMINATOR=',',
	tablock)
	set @end_time=GETDATE()
	print 'Loading time is ' + cast(datediff(second,@start_time,@end_time) as nvarchar)+ ' secondes'

	set @start_time=GETDATE();
	print('truncate table bronz.erp_PX_CAT_G1V2')

	truncate table bronz.erp_PX_CAT_G1V2;
	print('inserting table bronz.erp_PX_CAT_G1V2');

	bulk insert bronz.erp_PX_CAT_G1V2
	from  '\datasets\source_erp\PX_CAT_G1V2.csv'
	with(firstrow=2,
	FIELDTERMINATOR=',',
	tablock)
	set @end_time=GETDATE();
	print 'Loading time is ' + cast(datediff(second,@start_time,@end_time) as nvarchar)+ ' secondes'
  
	set @end_time_batch=GETDATE()
	print '------------------------------'
	print('loading bronze layer is complete')
	print 'Loading time is ' + cast(datediff(second,@start_time_batch,@end_time_batch) as nvarchar)+ ' secondes'
	end try

  
	begin catch 
		print '----------------------------------------------';
		print('	ERORR DURING LOADING BRONZE LAYER')
		print '----------------------------------------------';
	end catch


end
