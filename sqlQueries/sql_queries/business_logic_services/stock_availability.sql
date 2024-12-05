CREATE OR REPLACE FUNCTION check_stock_availability (
    p_product_id IN NUMBER,
    p_required_quantity IN NUMBER
) RETURN VARCHAR2 IS
    v_current_stock NUMBER;
    v_threshold NUMBER := 5;
BEGIN
    SELECT item_quantity
    INTO v_current_stock
    FROM products
    WHERE product_id = p_product_id;

    IF v_current_stock = 0 THEN
        RETURN 'Out of Stock';
    ELSIF v_current_stock < p_required_quantity THEN
        RETURN 'Insufficient stock to fulfill the requested quantity';
    ELSIF v_current_stock <= v_threshold THEN
        RETURN 'Low Stock';
    ELSE
        RETURN 'In Stock';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Product not found';
    WHEN OTHERS THEN
        RETURN 'An error occurred while checking stock availability';
END;
/