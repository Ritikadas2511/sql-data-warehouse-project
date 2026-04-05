
/*
===============================================================================
DML Script: Build Silver Layer
===============================================================================
Script Purpose:
Run this script to clean and transform raw data.
===============================================================================
*/

-- Check for Nulls or Duplicates in primary key column.

Select 
cst_id, count(*)
from bronze.crm_cust_info
group by cst_id
having count(*)>1 or cst_id is null;

-- Check for unwanted spaces in string columns.

Select cst_firstname
from bronze.crm_cust_info
where cst_firstname != TRIM(cst_firstname);

Select cst_lastname
from bronze.crm_cust_info
where cst_lastname != TRIM(cst_lastname);

-- Data standardization & consistency.

Select distinct cst_gndr
from bronze.crm_cust_info;

Select distinct cst_marital_status
from bronze.crm_cust_info;

