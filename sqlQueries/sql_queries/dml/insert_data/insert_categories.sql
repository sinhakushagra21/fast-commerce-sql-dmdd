BEGIN
    BEGIN
        INSERT INTO CATEGORIES (CATEGORY_ID, CATEGORY_NAME) VALUES (1, 'Snacks');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate, proceed with next insert
    END;

    BEGIN
        INSERT INTO CATEGORIES (CATEGORY_ID, CATEGORY_NAME) VALUES (2, 'Dairy');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate, proceed with next insert
    END;

    BEGIN
        INSERT INTO CATEGORIES (CATEGORY_ID, CATEGORY_NAME) VALUES (3, 'Fruits');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate, proceed with next insert
    END;
END;
/
