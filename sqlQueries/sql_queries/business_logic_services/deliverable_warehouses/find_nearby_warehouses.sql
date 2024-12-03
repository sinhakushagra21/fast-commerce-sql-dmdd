CREATE OR REPLACE FUNCTION find_nearest_warehouse(
    user_latitude IN NUMBER,
    user_longitude IN NUMBER,
    v_warehouse_address OUT VARCHAR2,
    v_warehouse_id OUT NUMBER
) RETURN VARCHAR2 IS
    v_distance NUMBER;
BEGIN
    -- Find the nearest warehouse and calculate distance
    SELECT ADDRESS, WAREHOUSE_WAREHOUSE_ID,
           (6371 * ACOS(
                COS(user_latitude * (ACOS(-1) / 180)) * COS(LATITUDE * (ACOS(-1) / 180)) *
                COS((LONGITUDE * (ACOS(-1) / 180)) - (user_longitude * (ACOS(-1) / 180))) +
                SIN(user_latitude * (ACOS(-1) / 180)) * SIN(LATITUDE * (ACOS(-1) / 180))
            )) AS distance_km
    INTO v_warehouse_address, v_warehouse_id, v_distance
    FROM locations
    WHERE LOCATION_TYPE = 'warehouse'
    ORDER BY distance_km
    FETCH FIRST 1 ROW ONLY;

    -- Check if the distance is greater than 3 km
    IF v_distance > 3 THEN
        RETURN 'No warehouse within a 3km radius. Nearest warehouse is at: ' || v_warehouse_address || ', Distance: ' || ROUND(v_distance, 2) || ' km, Warehouse ID: ' || v_warehouse_id;
    ELSE
        RETURN 'Nearest warehouse: ' || v_warehouse_address || ', Distance: ' || ROUND(v_distance, 2) || ' km, Warehouse ID: ' || v_warehouse_id;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No warehouses available to calculate distance.';
END;
