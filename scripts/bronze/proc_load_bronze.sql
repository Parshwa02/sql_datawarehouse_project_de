/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `COPY` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    CALL bronze.load_bronze()
===============================================================================
*/


CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;

    start_time TIMESTAMP;
    end_time TIMESTAMP;

    row_count BIGINT;

    success_count INTEGER := 0;
    error_count INTEGER := 0;

    root_path TEXT := 'C:\Users\parsh\OneDrive\Desktop\DE roadmap\projects\1\sql-data-warehouse-project-main\datasets\';
BEGIN

    batch_start_time := clock_timestamp();

    RAISE NOTICE '';
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Batch Start Time: %', batch_start_time;
    RAISE NOTICE '';

    -------------------------------------------------------------------------
    -- CRM TABLES
    -------------------------------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------------------------';

    -------------------------------------------------------------------------
    -- CRM CUSTOMER INFO
    -------------------------------------------------------------------------
    BEGIN
        start_time := clock_timestamp();

        RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        RAISE NOTICE '>> Loading Data Into: bronze.crm_cust_info';

        EXECUTE format(
            'COPY bronze.crm_cust_info FROM %L WITH (FORMAT CSV, HEADER TRUE)',
            root_path || 'source_crm\cust_info.csv'
        );

        SELECT COUNT(*)
        INTO row_count
        FROM bronze.crm_cust_info;

        end_time := clock_timestamp();

        success_count := success_count + 1;

        RAISE NOTICE '>> Rows Loaded: %', row_count;
        RAISE NOTICE '>> Load Duration: % seconds',
            ROUND(EXTRACT(EPOCH FROM (end_time - start_time)), 2);
        RAISE NOTICE '>> Status: SUCCESS';
        RAISE NOTICE '>> --------------------------------';

    EXCEPTION
        WHEN OTHERS THEN
            error_count := error_count + 1;

            RAISE NOTICE '>> Status: FAILED';
            RAISE NOTICE '>> Table: bronze.crm_cust_info';
            RAISE NOTICE '>> Error: %', SQLERRM;
            RAISE NOTICE '>> --------------------------------';
    END;

    -------------------------------------------------------------------------
    -- CRM PRODUCT INFO
    -------------------------------------------------------------------------
    BEGIN
        start_time := clock_timestamp();

        RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        RAISE NOTICE '>> Loading Data Into: bronze.crm_prd_info';

        EXECUTE format(
            'COPY bronze.crm_prd_info FROM %L WITH (FORMAT CSV, HEADER TRUE)',
            root_path || 'source_crm\prd_info.csv'
        );

        SELECT COUNT(*)
        INTO row_count
        FROM bronze.crm_prd_info;

        end_time := clock_timestamp();

        success_count := success_count + 1;

        RAISE NOTICE '>> Rows Loaded: %', row_count;
        RAISE NOTICE '>> Load Duration: % seconds',
            ROUND(EXTRACT(EPOCH FROM (end_time - start_time)), 2);
        RAISE NOTICE '>> Status: SUCCESS';
        RAISE NOTICE '>> --------------------------------';

    EXCEPTION
        WHEN OTHERS THEN
            error_count := error_count + 1;

            RAISE NOTICE '>> Status: FAILED';
            RAISE NOTICE '>> Table: bronze.crm_prd_info';
            RAISE NOTICE '>> Error: %', SQLERRM;
            RAISE NOTICE '>> --------------------------------';
    END;
    -------------------------------------------------------------------------
    -- CRM SALES DETAILS
    -------------------------------------------------------------------------
    BEGIN
        start_time := clock_timestamp();

        RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        RAISE NOTICE '>> Loading Data Into: bronze.crm_sales_details';

        EXECUTE format(
            'COPY bronze.crm_sales_details FROM %L WITH (FORMAT CSV, HEADER TRUE)',
            root_path || 'source_crm\sales_details.csv'
        );

        SELECT COUNT(*)
        INTO row_count
        FROM bronze.crm_sales_details;

        end_time := clock_timestamp();

        success_count := success_count + 1;

        RAISE NOTICE '>> Rows Loaded: %', row_count;
        RAISE NOTICE '>> Load Duration: % seconds',
            ROUND(EXTRACT(EPOCH FROM (end_time - start_time)), 2);
        RAISE NOTICE '>> Status: SUCCESS';
        RAISE NOTICE '>> --------------------------------';

    EXCEPTION
        WHEN OTHERS THEN
            error_count := error_count + 1;

            RAISE NOTICE '>> Status: FAILED';
            RAISE NOTICE '>> Table: bronze.crm_sales_details';
            RAISE NOTICE '>> Error: %', SQLERRM;
            RAISE NOTICE '>> --------------------------------';
    END;

    -------------------------------------------------------------------------
    -- ERP TABLES
    -------------------------------------------------------------------------
    RAISE NOTICE '';
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------------------------';

    -------------------------------------------------------------------------
    -- ERP CUSTOMER
    -------------------------------------------------------------------------
    BEGIN
        start_time := clock_timestamp();

        RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        RAISE NOTICE '>> Loading Data Into: bronze.erp_cust_az12';

        EXECUTE format(
            'COPY bronze.erp_cust_az12 FROM %L WITH (FORMAT CSV, HEADER TRUE)',
            root_path || 'source_erp\cust_az12.csv'
        );

        SELECT COUNT(*)
        INTO row_count
        FROM bronze.erp_cust_az12;

        end_time := clock_timestamp();

        success_count := success_count + 1;

        RAISE NOTICE '>> Rows Loaded: %', row_count;
        RAISE NOTICE '>> Load Duration: % seconds',
            ROUND(EXTRACT(EPOCH FROM (end_time - start_time)), 2);
        RAISE NOTICE '>> Status: SUCCESS';
        RAISE NOTICE '>> --------------------------------';

    EXCEPTION
        WHEN OTHERS THEN
            error_count := error_count + 1;

            RAISE NOTICE '>> Status: FAILED';
            RAISE NOTICE '>> Table: bronze.erp_cust_az12';
            RAISE NOTICE '>> Error: %', SQLERRM;
            RAISE NOTICE '>> --------------------------------';
    END;

    -------------------------------------------------------------------------
    -- ERP LOCATION
    -------------------------------------------------------------------------
    BEGIN
        start_time := clock_timestamp();

        RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        RAISE NOTICE '>> Loading Data Into: bronze.erp_loc_a101';

        EXECUTE format(
            'COPY bronze.erp_loc_a101 FROM %L WITH (FORMAT CSV, HEADER TRUE)',
            root_path || 'source_erp\loc_a101.csv'
        );

        SELECT COUNT(*)
        INTO row_count
        FROM bronze.erp_loc_a101;

        end_time := clock_timestamp();

        success_count := success_count + 1;

        RAISE NOTICE '>> Rows Loaded: %', row_count;
        RAISE NOTICE '>> Load Duration: % seconds',
            ROUND(EXTRACT(EPOCH FROM (end_time - start_time)), 2);
        RAISE NOTICE '>> Status: SUCCESS';
        RAISE NOTICE '>> --------------------------------';

    EXCEPTION
        WHEN OTHERS THEN
            error_count := error_count + 1;

            RAISE NOTICE '>> Status: FAILED';
            RAISE NOTICE '>> Table: bronze.erp_loc_a101';
            RAISE NOTICE '>> Error: %', SQLERRM;
            RAISE NOTICE '>> --------------------------------';
    END;
    -------------------------------------------------------------------------
    -- ERP PRODUCT CATEGORY
    -------------------------------------------------------------------------
    BEGIN
        start_time := clock_timestamp();

        RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        RAISE NOTICE '>> Loading Data Into: bronze.erp_px_cat_g1v2';

        EXECUTE format(
            'COPY bronze.erp_px_cat_g1v2 FROM %L WITH (FORMAT CSV, HEADER TRUE)',
            root_path || 'source_erp\px_cat_g1v2.csv'
        );

        SELECT COUNT(*)
        INTO row_count
        FROM bronze.erp_px_cat_g1v2;

        end_time := clock_timestamp();

        success_count := success_count + 1;

        RAISE NOTICE '>> Rows Loaded: %', row_count;
        RAISE NOTICE '>> Load Duration: % seconds',
            ROUND(EXTRACT(EPOCH FROM (end_time - start_time)), 2);
        RAISE NOTICE '>> Status: SUCCESS';
        RAISE NOTICE '>> --------------------------------';

    EXCEPTION
        WHEN OTHERS THEN
            error_count := error_count + 1;

            RAISE NOTICE '>> Status: FAILED';
            RAISE NOTICE '>> Table: bronze.erp_px_cat_g1v2';
            RAISE NOTICE '>> Error: %', SQLERRM;
            RAISE NOTICE '>> --------------------------------';
    END;

    -------------------------------------------------------------------------
    -- BATCH COMPLETE
    -------------------------------------------------------------------------
    batch_end_time := clock_timestamp();

    RAISE NOTICE '';
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Bronze Layer Load Completed';
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Batch Start Time: %', batch_start_time;
    RAISE NOTICE 'Batch End Time  : %', batch_end_time;
    RAISE NOTICE 'Total Duration  : % seconds',
        ROUND(EXTRACT(EPOCH FROM (batch_end_time - batch_start_time)), 2);

    RAISE NOTICE '';
    RAISE NOTICE 'Summary';
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Successful Loads : %', success_count;
    RAISE NOTICE 'Failed Loads     : %', error_count;
    RAISE NOTICE '------------------------------------------------';

    IF error_count = 0 THEN
        RAISE NOTICE 'Overall Status: SUCCESS';
    ELSE
        RAISE NOTICE 'Overall Status: COMPLETED WITH ERRORS';
    END IF;

    RAISE NOTICE '================================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '';
        RAISE NOTICE '================================================';
        RAISE NOTICE 'FATAL ERROR DURING BRONZE LOAD';
        RAISE NOTICE 'Error Message: %', SQLERRM;
        RAISE NOTICE '================================================';
        RAISE;
END;
$$;
