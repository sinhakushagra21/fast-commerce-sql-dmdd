-- Insert sample data into USER LOCATIONS table
BEGIN
    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (1, 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;
END;
/
