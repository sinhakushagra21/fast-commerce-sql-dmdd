-- Insert sample data into CONTACTS table
BEGIN
    BEGIN
        INSERT INTO CONTACTS(ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID) 
        VALUES (1, 'Ivy', 'Taylor', 'ivy.taylor@gmail.com', '0123456789', 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;
END;
/
