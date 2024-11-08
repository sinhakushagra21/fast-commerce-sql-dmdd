-- Insert sample data into ROLES table
BEGIN
    BEGIN
        INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (1, 'admin_role', 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (2, 'user_role', 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (3, 'warehouse_manager_role', 3);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;
END;
/


