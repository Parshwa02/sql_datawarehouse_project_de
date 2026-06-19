/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates new schemas named bronze, silver, gold respectively if not exist already. If exists then it will drop the whole schemas with its tables and all and creates new schemas.
	
WARNING:
    Running this script will drop the entire Schemas if it exists. 
    All data in the Schemas will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/


DROP SCHEMA IF EXISTS bronze CASCADE;
CREATE SCHEMA bronze;

DROP SCHEMA IF EXISTS silver CASCADE;
CREATE SCHEMA silver;

DROP SCHEMA IF EXISTS gold CASCADE;
CREATE SCHEMA gold;
