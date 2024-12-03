CREATE OR REPLACE FUNCTION get_warehouse_timing(p_warehouse_id NUMBER)
RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT OPENING_TIME, CLOSING_TIME
        FROM USER18GP.WAREHOUSE
        WHERE WAREHOUSE_ID = p_warehouse_id;
    RETURN v_cursor;
END;
/
