CREATE OR REPLACE PROCEDURE generate_order(
    p_user_id NUMBER,
    p_payment_id NUMBER,
    p_status_id NUMBER,
    p_order_id NUMBER
) IS
BEGIN
    -- Insert a new record into the ORDERS table
    INSERT INTO ORDERS (
        ORDER_ID,
        ORDER_DATE,
        ORDER_STATUS_ID,
        PAYMENTS_PAYMENT_ID,
        USERS_USER_ID
    ) VALUES (
        p_order_id,
        SYSTIMESTAMP,
        p_status_id,
        p_payment_id,
        p_user_id
    );
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error in creating order: ' || SQLERRM);
END generate_order;
/
