CREATE OR REPLACE FUNCTION browse_products_by_warehouse(
    p_warehouse_id NUMBER
) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
    SELECT PRODUCT_ID, PRODUCT_NAME, SELLING_PRICE
    FROM PRODUCTS
    WHERE WAREHOUSE_WAREHOUSE_ID = p_warehouse_id
      AND UPPER(IS_ACTIVE) = 'Y' -- Handles case-sensitivity
      AND check_stock_availability(PRODUCT_ID, 1) IN ('In Stock', 'Low Stock');
      
    RETURN v_cursor;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- Gracefully handle no results
END browse_products_by_warehouse;
