CREATE OR REPLACE PROCEDURE update_order_products(
    p_order_id NUMBER,
    product_id NUMBER
) IS
BEGIN
    -- Insert a new record into the ORDERS table
    INSERT INTO ORDER_PRODUCTS(
        ORDERS_ORDER_ID,
        PRODUCTS_PRODUCT_ID
    ) VALUES (
        p_order_id,
        product_id
    );
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error in updating order products table : ' || SQLERRM);
END update_order_products;
/
