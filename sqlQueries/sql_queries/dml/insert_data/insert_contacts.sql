-- Insert sample data into CONTACTS table
BEGIN
    BEGIN
        INSERT INTO CONTACTS(ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (1, 'Ivy', 'Taylor', 'ivy.taylor@gmail.com', '0123456789', 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO CONTACTS(ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (2, 'John', 'Hopkins', 'john.hopkins@gmail.com', '987654321', 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO CONTACTS(ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (3, 'Rohan', 'Rathod', 'rohan.rathod@gmail.com', '99999999', 3);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

END;
/