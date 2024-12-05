-- Insert sample data into USERS table
BEGIN
    BEGIN
        INSERT INTO USERS (USER_ID, IS_ACTIVE, CONTACT_ID) VALUES (1, 'Y', 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO USERS (USER_ID, IS_ACTIVE, CONTACT_ID) VALUES (2, 'Y', 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO USERS (USER_ID, IS_ACTIVE, CONTACT_ID) VALUES (3, 'Y', 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;
END;
/
