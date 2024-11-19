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
SET SERVEROUTPUT ON;

DECLARE
    v_status VARCHAR2(50);
BEGIN
    -- Test Case 1: Existing Order ID
    v_status := check_unique_order_id(101);
    DBMS_OUTPUT.PUT_LINE('TC001 - Existing Order ID: ' || v_status);

    -- Test Case 2: Non-Existent Order ID
    v_status := check_unique_order_id(999);
    DBMS_OUTPUT.PUT_LINE('TC002 - Non-Existent Order ID: ' || v_status);

    -- Test Case 3: Edge Case - Negative Order ID
    v_status := check_unique_order_id(-10);
    DBMS_OUTPUT.PUT_LINE('TC003 - Negative Order ID: ' || v_status);

    -- Test Case 4: Edge Case - Zero Order ID
    v_status := check_unique_order_id(0);
    DBMS_OUTPUT.PUT_LINE('TC004 - Zero Order ID: ' || v_status);

    -- Test Case 5: Empty Table Scenario
    -- (Before running this test, truncate the orders table)
    v_status := check_unique_order_id(200);
    DBMS_OUTPUT.PUT_LINE('TC005 - Empty Table Scenario: ' || v_status);

    -- Test Case 6: Large Order ID
    v_status := check_unique_order_id(999999);
    DBMS_OUTPUT.PUT_LINE('TC006 - Large Order ID: ' || v_status);
END;
/
