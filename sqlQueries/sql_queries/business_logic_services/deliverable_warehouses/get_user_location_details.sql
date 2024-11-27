CREATE OR REPLACE FUNCTION get_user_location_details(user_id IN NUMBER) 
RETURN locations%ROWTYPE IS
    v_location locations%ROWTYPE;
BEGIN
    -- Fetch the location row based on user_id
    SELECT l.*
    INTO v_location
    FROM locations l
    JOIN USER_LOCATIONS ul ON l.LOCATION_ID = ul.LOCATION_LOCATION_ID
    WHERE ul.USERS_USER_ID = user_id;

    RETURN v_location;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Handle the case where no location is found
        RAISE_APPLICATION_ERROR(-20001, 'No location found for user ID: ' || user_id);
END;
/