-- Insert sample data into ROLES table
BEGIN
    INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (1, 'admin', 1);
    INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (2, 'customer', 2);
    INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (3, 'warehouse_manager', 3);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        NULL; -- Ignore duplicates
END;