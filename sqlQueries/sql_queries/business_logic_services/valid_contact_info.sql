--valid contact info--
CREATE OR REPLACE FUNCTION validate_contact_info (
    p_email IN VARCHAR2,
    p_phone IN VARCHAR2
) RETURN VARCHAR2 IS
    v_email_pattern VARCHAR2(100) := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
    v_phone_pattern VARCHAR2(15) := '^\d{10}$'; -- Adjust for your phone number format
BEGIN
    -- Validate email format
    IF NOT REGEXP_LIKE(p_email, v_email_pattern) THEN
        RETURN 'Invalid email format';
    END IF;

    -- Validate phone format
    IF NOT REGEXP_LIKE(p_phone, v_phone_pattern) THEN
        RETURN 'Invalid phone number format';
    END IF;

    RETURN 'Contact information is valid';
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'An error occurred while validating contact information';
END;
/

SET SERVEROUTPUT ON;
DECLARE
    result VARCHAR2(100);
BEGIN
    -- Test Case 1
    result := validate_contact_info('john.doe@example.com', '1234567890');
    DBMS_OUTPUT.PUT_LINE('Test Case 1: ' || result);

    -- Test Case 2
    result := validate_contact_info('jane_doe@domain.co.in', '9876543210');
    DBMS_OUTPUT.PUT_LINE('Test Case 2: ' || result);

    -- Test Case 3
    result := validate_contact_info('invalidemail.com', '1234567890');
    DBMS_OUTPUT.PUT_LINE('Test Case 3: ' || result);

    -- Test Case 4
    result := validate_contact_info('user@domain', '1234567890');
    DBMS_OUTPUT.PUT_LINE('Test Case 4: ' || result);

    -- Test Case 5
    result := validate_contact_info('user@domain.com', '12345678');
    DBMS_OUTPUT.PUT_LINE('Test Case 5: ' || result);

    -- Test Case 6
    result := validate_contact_info('@domain.com', 'abcdefghij');
    DBMS_OUTPUT.PUT_LINE('Test Case 6: ' || result);

    -- Test Case 7
    result := validate_contact_info('user@domain.com', '123abc7890');
    DBMS_OUTPUT.PUT_LINE('Test Case 7: ' || result);

    -- Test Case 8
    result := validate_contact_info('plainaddress', '!@#$%^&*()');
    DBMS_OUTPUT.PUT_LINE('Test Case 8: ' || result);

    -- Test Case 9
    result := validate_contact_info('special+char@domain.org', '1234567890');
    DBMS_OUTPUT.PUT_LINE('Test Case 9: ' || result);

    -- Test Case 10
    result := validate_contact_info('user@sub.domain.com', '1234567890');
    DBMS_OUTPUT.PUT_LINE('Test Case 10: ' || result);

    -- Test Case 11
    result := validate_contact_info('user123@domain.com', '0987654321');
    DBMS_OUTPUT.PUT_LINE('Test Case 11: ' || result);

    -- Test Case 12
    result := validate_contact_info('john.doe@example.com', '0000000000');
    DBMS_OUTPUT.PUT_LINE('Test Case 12: ' || result);
END;
/
