--unique order id--
CREATE OR REPLACE FUNCTION check_unique_order_id (
    p_order_id IN NUMBER
) RETURN VARCHAR2 IS
    v_count NUMBER;
BEGIN
    -- Check if the order ID already exists
    SELECT COUNT(*)
    INTO v_count
    FROM user18gp.orders
    WHERE order_id = p_order_id;

    IF v_count > 0 THEN
        RETURN 'Order ID already exists';
    ELSE
        RETURN 'Order ID is unique';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'An error occurred while validating order ID';
END;
/