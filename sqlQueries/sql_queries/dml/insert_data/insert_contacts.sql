-- Define and create the procedure
CREATE OR REPLACE PROCEDURE insert_contact (
    p_id           IN NUMBER,
    p_first_name   IN VARCHAR2,
    p_last_name    IN VARCHAR2,
    p_email_id     IN VARCHAR2,
    p_phone_num    IN VARCHAR2,
    p_user_id      IN NUMBER
)
IS
    v_email_pattern   VARCHAR2(100) := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$';
    v_phone_pattern   VARCHAR2(100) := '^[0-9]{10}$'; -- Adjust the pattern based on your requirements
BEGIN
    -- Validate email
    IF NOT REGEXP_LIKE(p_email_id, v_email_pattern) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid email format');
    END IF;

    -- Validate phone number
    IF NOT REGEXP_LIKE(p_phone_num, v_phone_pattern) THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid phone number format');
    END IF;

    -- If validations pass, insert the data
    INSERT INTO user18gp.contacts (ID, FIRST_NAME, LAST_NAME, EMAIL_ID, PHONE_NUM, USERS_USER_ID)
    VALUES (p_id, p_first_name, p_last_name, p_email_id, p_phone_num, p_user_id);

    -- Output for success
    DBMS_OUTPUT.PUT_LINE('Contact inserted successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate entry. Insertion skipped.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error encountered: ' || SQLERRM);
        RAISE;
END;
/

-- Call the procedure for each contact
BEGIN
    insert_contact(1, 'Ivy', 'Taylor', 'ivy.taylor@gmail.com', '0123456789', 1);
END;
/

BEGIN
    insert_contact(2, 'John', 'Hopkins', 'john.hopkins@gmail.com', '9876543210', 2);
END;
/

BEGIN
    insert_contact(3, 'Rohan', 'Rathod', 'rohan.rathod@gmail.com', '9999999999', 3);
END;
/

