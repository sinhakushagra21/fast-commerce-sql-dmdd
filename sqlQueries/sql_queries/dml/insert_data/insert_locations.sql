BEGIN
    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (1, 42.36, -71.05, '123 Main St', 100, '02118', 'user', 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (2, 42.37, -71.06, '456 Elm St', 101, '02119', 'user', 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (3, 42.38, -71.07, '789 Oak St', 102, '02120', 'warehouse', 3);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (4, 42.39, -71.08, '101 Pine St', 103, '02121', 'user', 4);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (5, 42.40, -71.09, '202 Cedar St', 104, '02122', 'user', 5);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (6, 42.41, -71.10, '303 Birch St', 105, '02123', 'user', 6);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (7, 42.42, -71.11, '404 Maple St', 106, '02124', 'user', 7);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (8, 42.43, -71.12, '505 Ash St', 107, '02125', 'user', 8);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (9, 42.44, -71.13, '606 Walnut St', 108, '02126', 'user', 9);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (10, 42.45, -71.14, '707 Cherry St', 109, '02127', 'user', 10);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."LOCATIONS" (LOCATION_ID, LATITUDE, LONGITUDE, ADDRESS, CITY_CODE, ZIP_CODE, LOCATION_TYPE, WAREHOUSE_WAREHOUSE_ID) 
        VALUES (11, 42.46, -71.15, '808 Poplar St', 110, '02128', 'user', 11);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;
END;
/
