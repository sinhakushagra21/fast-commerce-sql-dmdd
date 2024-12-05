SET SERVEROUTPUT ON;

DECLARE
    -- Define input parameters
    v_product_id NUMBER := 1; -- Example product ID
    v_quantity NUMBER := 1; -- Example quantity
    v_user_id NUMBER := 1; -- Example user ID
    v_payment_type_id NUMBER := 1; -- Example payment type ID
    v_order_status VARCHAR2(255);

BEGIN
    -- Call the place_order function and capture the return status
    v_order_status := make_order(
        p_product_id => v_product_id,
        p_quantity => v_quantity,
        p_user_id => v_user_id,
        p_payment_type_id => v_payment_type_id
    );

    -- Output the final status message
    DBMS_OUTPUT.PUT_LINE('Order Status: ' || v_order_status);
END;
