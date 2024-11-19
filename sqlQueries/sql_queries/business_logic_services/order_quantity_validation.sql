CREATE OR REPLACE FUNCTION validate_order_quantity (
    p_quantity IN NUMBER
) RETURN VARCHAR2 IS
BEGIN
    IF p_quantity <= 0 THEN
        -- Raise an error if the quantity is zero or negative
        RAISE_APPLICATION_ERROR(-20001, 'Invalid order quantity. Quantity must be greater than zero.');
    END IF;
    
    -- Return success if the quantity is valid
    RETURN 'Valid order quantity';
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'An error occurred during validation: ' || SQLERRM;
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_result VARCHAR2(50);
BEGIN
    v_result := validate_order_quantity(5); -- Valid quantity
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/


DECLARE
    v_result VARCHAR2(50);
BEGIN
    v_result := validate_order_quantity(0); -- Invalid quantity
    DBMS_OUTPUT.PUT_LINE(v_result);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
