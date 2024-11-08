BEGIN
    BEGIN
        INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_TYPE_ID, ITEM_QUANTITY, MRP, SELLING_PRICE, DISCOUNTS, WAREHOUSE_WAREHOUSE_ID, IS_ACTIVE) 
        VALUES (101, 'Damsung', 1, 50, 700, 650, 5.00, 1, 'Y');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_TYPE_ID, ITEM_QUANTITY, MRP, SELLING_PRICE, DISCOUNTS, WAREHOUSE_WAREHOUSE_ID, IS_ACTIVE) 
        VALUES (102, 'Sofa', 2, 20, 1500, 1200, 10.00, 2, 'Y');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_TYPE_ID, ITEM_QUANTITY, MRP, SELLING_PRICE, DISCOUNTS, WAREHOUSE_WAREHOUSE_ID, IS_ACTIVE) 
        VALUES (103, 'yPhone', 1, 20, 800, 750, 6.25, 1, 'Y');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_TYPE_ID, ITEM_QUANTITY, MRP, SELLING_PRICE, DISCOUNTS, WAREHOUSE_WAREHOUSE_ID, IS_ACTIVE) 
        VALUES (104, 'Desk', 2, 15, 200, 180, 10.00, 2, 'Y');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_TYPE_ID, ITEM_QUANTITY, MRP, SELLING_PRICE, DISCOUNTS, WAREHOUSE_WAREHOUSE_ID, IS_ACTIVE) 
        VALUES (105, 'T-Shirt', 3, 100, 20, 18, 10.00, 3, 'Y');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_TYPE_ID, ITEM_QUANTITY, MRP, SELLING_PRICE, DISCOUNTS, WAREHOUSE_WAREHOUSE_ID, IS_ACTIVE) 
        VALUES (106, 'Soccer Ball', 7, 50, 25, 22, 12.00, 4, 'Y');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_TYPE_ID, ITEM_QUANTITY, MRP, SELLING_PRICE, DISCOUNTS, WAREHOUSE_WAREHOUSE_ID, IS_ACTIVE) 
        VALUES (107, 'Haxe Spray', 8, 80, 15, 14, 6.67, 5, 'Y');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;
END;
/
