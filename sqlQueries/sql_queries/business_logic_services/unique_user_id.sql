--unique customer--
CREATE OR REPLACE FUNCTION check_unique_user_id (
    p_user_id IN NUMBER
) RETURN VARCHAR2 IS
    v_count NUMBER;
BEGIN
    -- Check if the user ID exists in the users table
    SELECT COUNT(*)
    INTO v_count
    FROM user18gp.users  -- Adjusted to match the correct table
    WHERE user_id = p_user_id;

    IF v_count > 0 THEN
        RETURN 'User ID already exists';
    ELSE
        RETURN 'User ID is unique';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No users found in the database';
    WHEN OTHERS THEN
        RETURN 'An error occurred while checking user ID';
END;
/
