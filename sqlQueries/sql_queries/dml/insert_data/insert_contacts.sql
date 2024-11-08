-- Insert sample data into CONTACTS table
BEGIN
    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (1, 'Ivy', 'Taylor', 'ivy.taylor@example.com', '0123456789', 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (2, 'Jane', 'Doe', 'jane.doe@example.com', '0987654321', 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (3, 'John', 'Smith', 'john.smith@example.com', '1234567890', 3);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (4, 'Alice', 'Johnson', 'alice.johnson@example.com', '2345678901', 4);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (5, 'Bob', 'Williams', 'bob.williams@example.com', '3456789012', 5);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (6, 'Carol', 'Brown', 'carol.brown@example.com', '4567890123', 6);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (7, 'David', 'Jones', 'david.jones@example.com', '5678901234', 7);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (8, 'Emily', 'Davis', 'emily.davis@example.com', '6789012345', 8);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (9, 'Frank', 'Miller', 'frank.miller@example.com', '7890123456', 9);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (10, 'Grace', 'Wilson', 'grace.wilson@example.com', '8901234567', 10);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."CONTACTS" (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (11, 'Henry', 'Moore', 'henry.moore@example.com', '9012345678', 11);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;
END;
/
