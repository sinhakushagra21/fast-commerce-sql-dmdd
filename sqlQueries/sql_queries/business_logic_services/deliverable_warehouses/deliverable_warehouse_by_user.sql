SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION get_nearest_warehouse_for_user(p_user_id IN NUMBER) 
RETURN NUMBER 
IS
    v_location locations%ROWTYPE;
    v_warehouse_id NUMBER;
    v_warehouses_address VARCHAR2(1000);
BEGIN
    -- Step 1: Get user location using the normalized tables
    v_location := get_user_location_details(p_user_id);

    -- Step 2: Fetch nearby warehouses and get the warehouse details
    v_warehouses_address := find_nearest_warehouse(
        v_location.latitude, 
        v_location.longitude, 
        v_warehouses_address, 
        v_warehouse_id
    );

    -- Return the warehouse ID
    RETURN v_warehouse_id;

EXCEPTION
    WHEN OTHERS THEN
        -- Handle any unexpected errors
        RAISE_APPLICATION_ERROR(-20002, 'Error finding nearest warehouse for user ID: ' || p_user_id || 
                                '. Error: ' || SQLERRM);
END;
/

-- -- Example usage to verify the function
-- DECLARE
--     v_nearest_warehouse_id NUMBER;
-- BEGIN
--     v_nearest_warehouse_id := get_nearest_warehouse_for_user(1);
--     DBMS_OUTPUT.PUT_LINE('Nearest Warehouse ID: ' || v_nearest_warehouse_id);
-- END;