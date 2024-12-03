SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION is_warehouse_open(user_id NUMBER)
RETURN VARCHAR2
IS
    v_location locations%ROWTYPE;
    v_warehouse_id NUMBER;
    v_warehouse_address VARCHAR2(1000);
    v_opening_time VARCHAR2(5);
    v_closing_time VARCHAR2(5);
    v_current_time TIMESTAMP;
    v_open_time TIMESTAMP;
    v_close_time TIMESTAMP;
    v_cursor SYS_REFCURSOR;
    v_row_fetched BOOLEAN := FALSE;
BEGIN
   
    v_location := get_user_location_details(user_id);

    -- Fetch the nearest warehouse ID and address based on location
    v_warehouse_address := find_nearest_warehouse(v_location.latitude, v_location.longitude, v_warehouse_address, v_warehouse_id);
    DBMS_OUTPUT.PUT_LINE('warehouse address' ||v_warehouse_address);
    
    v_cursor := get_warehouse_timing(v_warehouse_id);
    FETCH v_cursor INTO v_opening_time, v_closing_time;
    IF v_opening_time IS NOT NULL AND v_closing_time IS NOT NULL THEN
        v_row_fetched := TRUE; 
    END IF;
    CLOSE v_cursor;
    
    -- Check if data was fetched
    IF NOT v_row_fetched THEN
        RETURN 'Warehouse ID not found';  
    END IF;
    
    v_current_time := CURRENT_TIMESTAMP;
    
    -- Combine current date with opening and closing times for comparison
    v_open_time := TO_TIMESTAMP(TO_CHAR(v_current_time, 'YYYY-MM-DD') || ' ' || v_opening_time, 'YYYY-MM-DD HH24:MI');
    v_close_time := TO_TIMESTAMP(TO_CHAR(v_current_time, 'YYYY-MM-DD') || ' ' || v_closing_time, 'YYYY-MM-DD HH24:MI');
    
    -- Compare the current time with warehouse opening times
    IF v_current_time BETWEEN v_open_time AND v_close_time THEN
        RETURN 'Open';
    ELSE
        RETURN 'Closed';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Warehouse ID not found';  
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;  
END;
/

SELECT is_warehouse_open(1) FROM dual;
