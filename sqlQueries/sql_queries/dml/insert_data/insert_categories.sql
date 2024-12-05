BEGIN
    BEGIN
        INSERT INTO CATEGORIES (CATEGORY_ID, CATEGORY_NAME) VALUES (1, 'Snacks');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate, proceed with next insert
    END;
END;
/
