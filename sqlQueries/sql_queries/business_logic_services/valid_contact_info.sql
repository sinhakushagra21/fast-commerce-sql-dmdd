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