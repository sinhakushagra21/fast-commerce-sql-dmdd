SET SERVEROUTPUT ON;
DECLARE
    v_user_id NUMBER;
    v_location locations%ROWTYPE;
    v_warehouse_address VARCHAR2(1000);
    v_warehouse_id NUMBER;
    v_warehouse_name VARCHAR2(100);
    v_warehouse VARCHAR2(1000);
BEGIN

    -- Step 1: Get user location using the normalized tables
    v_location := get_user_location_details(2);


    -- Step 2: Fetch nearby warehouses
    v_warehouse := find_nearest_warehouse(v_location.latitude, v_location.longitude,v_warehouse_address, v_warehouse_id);

    DBMS_OUTPUT.PUT_LINE('Nearest Warehouse Address: ' || v_warehouse);

END;
/