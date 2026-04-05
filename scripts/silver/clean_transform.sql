
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


-- Check for Nulls or Duplicates in primary key column.

Select 
prd_key, count(*)
from bronze.crm_prd_info
group by prd_key
having count(*)>1 or prd_key is null;

-- Check for unwanted spaces in string columns.

Select prd_nm
from bronze.crm_prd_info
where prd_nm != TRIM(prd_nm);

-- Check for Nulls or Negative values.

Select prd_cost
from bronze.crm_prd_info
where prd_cost<0 or prd_cost is null;

-- Data standardization & consistency.

Select distinct prd_line
from bronze.crm_prd_info;

-- Check for invalid date orders.

Select *
from bronze.crm_prd_info
where prd_end_dt < prd_start_dt;
