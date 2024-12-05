CREATE OR REPLACE FUNCTION make_payment(
    p_order_id NUMBER,
    p_payment_type_id NUMBER,
    p_payment_id NUMBER
) RETURN VARCHAR2 IS
    v_payment_id NUMBER;
BEGIN
    -- Insert payment details into the PAYMENTS table
    INSERT INTO PAYMENTS (PAYMENT_ID, ORDERS_ORDER_ID, PAYMENT_DATE, PAYMENT_STATUS, PAYMENT_REF_ID)
    VALUES (p_payment_id, p_order_id, SYSTIMESTAMP, 'PENDING', p_payment_type_id);

    -- Simulate payment processing
    UPDATE PAYMENTS
    SET PAYMENT_STATUS = 'COMPLETED'
    WHERE PAYMENT_ID = p_payment_id;

    RETURN 'COMPLETED';
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'FAILED: ' || SQLERRM;
END make_payment;
/
