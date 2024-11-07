BEGIN
    INSERT INTO ORDER_STATUSES (STATUS_ID, STATUS_NAME) VALUES (1, 'Pending');
    INSERT INTO ORDER_STATUSES (STATUS_ID, STATUS_NAME) VALUES (2, 'Confirmed');
    INSERT INTO ORDER_STATUSES (STATUS_ID, STATUS_NAME) VALUES (3, 'Canceled');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        NULL; -- Ignore duplicates
END;