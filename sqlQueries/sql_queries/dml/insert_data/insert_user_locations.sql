-- Insert sample data into USER LOCATIONS table
BEGIN
    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (1, 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (2, 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (3, 3);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (4, 4);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (5, 5);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (6, 6);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (7, 7);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (8, 8);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (9, 9);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (10, 10);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO USER_LOCATIONS (USERS_USER_ID, LOCATION_LOCATION_ID) VALUES (11, 11);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;
END;
/
