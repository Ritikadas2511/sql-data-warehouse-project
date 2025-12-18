/*
================================================================
Create Databse and Schemas
================================================================
This script creates a new database 'Datawarehouse' after checking if it already exists.
Additionally the script creates three schemas within the database- bronze, silver & gold.

Warning: Running this script will drop the entire 'Datawarehouse' databse if it exists.
Proceed with caution and ensure that you have proper backups before you run this script.
*/

use master;
go

-- Drop and recreate the 'Datawarehouse' database
If exists(Select 1 from sys.databases where name = 'Datawarehouse')
Begin
	Alter database Datawarehouse Set Single_user with rollback immediate;
	Drop database Datawarehouse;
End;
go

-- Create the 'Datawarehouse' database
Create database Datawarehouse;

use Datawarehouse;

-- Create schemas
create schema bronze;
go

create schema silver;
go

create schema gold;
go
