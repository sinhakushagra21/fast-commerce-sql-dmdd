-- Example of reviewing the cart contents
DECLARE
    v_cursor SYS_REFCURSOR;
    v_product_id NUMBER;
    v_product_name VARCHAR2(255);
    v_selling_price NUMBER;
    v_quantity NUMBER;
BEGIN
    -- Get the cart contents
    v_cursor := cart_package.review_cart;
    
    -- Loop through the cursor and display cart items
    LOOP
        FETCH v_cursor INTO v_product_id, v_product_name, v_selling_price, v_quantity;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_product_id || ', Product Name: ' || v_product_name || 
                             ', Price: ' || v_selling_price || ', Quantity: ' || v_quantity);
    END LOOP;

    -- Close the cursor
    CLOSE v_cursor;
END;
/
