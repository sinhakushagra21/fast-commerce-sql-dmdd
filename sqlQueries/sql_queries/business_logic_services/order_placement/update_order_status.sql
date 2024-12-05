CREATE OR REPLACE FUNCTION update_order(
    p_order_id NUMBER,
    p_status_name VARCHAR2,
    p_payment_id NUMBER
) RETURN VARCHAR2 IS
BEGIN
    UPDATE ORDERS
    SET ORDER_STATUS_ID = (SELECT STATUS_ID FROM ORDER_STATUSES WHERE STATUS_NAME = p_status_name),
    PAYMENTS_PAYMENT_ID = p_payment_id
    WHERE ORDER_ID = p_order_id;

    RETURN 'Order Status Updated';
END update_order;
/
