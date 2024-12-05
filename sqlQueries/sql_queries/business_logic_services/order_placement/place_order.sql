CREATE OR REPLACE FUNCTION make_order(
    p_product_id IN NUMBER,
    p_quantity IN NUMBER,
    p_user_id IN NUMBER,
    p_payment_type_id IN NUMBER
) RETURN VARCHAR2 IS

    -- Variables for product browsing and results
    v_product_name VARCHAR2(255);
    v_selling_price NUMBER;
    v_result VARCHAR2(255);
    v_cursor SYS_REFCURSOR;
    v_order_id NUMBER;
    p_warehouse_id NUMBER;
    p_action VARCHAR2(255);

    -- Local variables to hold fetched data from cursors
    v_temp_product_id NUMBER;
    v_temp_product_name VARCHAR2(255);
    v_temp_selling_price NUMBER;
    v_temp_quantity NUMBER;
    v_payment_id NUMBER;

BEGIN
    -- find the nearest warehouse for the user id given:
    p_warehouse_id := get_nearest_warehouse_for_user(p_user_id);
    DBMS_OUTPUT.PUT_LINE('Nearest Warehouse ID for the user is ' || p_warehouse_id);

    DBMS_OUTPUT.PUT_LINE('Browsing products in Warehouse ID ' || p_warehouse_id);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 1: Browse Products in Warehouse
    DBMS_OUTPUT.PUT_LINE('Available Products in Warehouse ID ' || p_warehouse_id || ':');
    v_cursor := browse_products_by_warehouse(p_warehouse_id);
    
    LOOP
        FETCH v_cursor INTO v_temp_product_id, v_temp_product_name, v_temp_selling_price;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_temp_product_id || ', Name: ' || v_temp_product_name || 
                             ', Price: ' || v_temp_selling_price);
    END LOOP;
    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 2: Add Product to Cart
    DBMS_OUTPUT.PUT_LINE('Adding Product ID ' || p_product_id || ' to cart with quantity ' || p_quantity || '...');
    cart_package.add_to_cart(p_product_id => p_product_id, p_quantity => p_quantity);

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 3: Review Cart
    DBMS_OUTPUT.PUT_LINE('Cart Contents:');
    v_cursor := cart_package.review_cart;

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    LOOP
        FETCH v_cursor INTO v_temp_product_id, v_temp_product_name, v_temp_selling_price, v_temp_quantity;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_temp_product_id || ', Name: ' || v_temp_product_name || 
                             ', Price: ' || v_temp_selling_price || ', Quantity: ' || v_temp_quantity);
    END LOOP;
    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 4: Update Inventory
    DBMS_OUTPUT.PUT_LINE('Updating inventory for Product ID ' || p_product_id || '...');
    update_inventory(p_product_id => p_product_id, p_quantity => p_quantity, p_action => 'UPDATE');

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 5: Generate Order ID
    v_order_id := order_seq.NEXTVAL;
    DBMS_OUTPUT.PUT_LINE('Generated Order ID: ' || v_order_id);

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 6: Create Order
    generate_order(
        p_user_id => p_user_id,
        p_payment_id => NULL, -- Payment ID will be updated later
        p_status_id => 1, -- Assuming 1 = "Pending"
        p_order_id => v_order_id
    );

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    v_payment_id := payment_seq.NEXTVAL;
    DBMS_OUTPUT.PUT_LINE('Generated Payment ID: ' || v_payment_id);

    -- Step 7: Make Payment
    DBMS_OUTPUT.PUT_LINE('Processing payment with Payment Type ID ' || p_payment_type_id || '...');
    v_result := make_payment(
        p_order_id => v_order_id, 
        p_payment_type_id => p_payment_type_id,
        p_payment_id => v_payment_id);
    DBMS_OUTPUT.PUT_LINE(v_result);

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 8: Update Order Status
    DBMS_OUTPUT.PUT_LINE('Updating order status to "Delivered" for Order ID ' || v_order_id || '...');
    v_result := update_order(
        p_order_id => v_order_id, 
        p_status_name => 'CONFIRMED',
        p_payment_id => v_payment_id);
    DBMS_OUTPUT.PUT_LINE(v_result);

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    -- Step 9: Update order products
    DBMS_OUTPUT.PUT_LINE('Updating order products table....');

    -- -- Returning a final status message
    RETURN 'Order successfully placed and delivered with Order ID ' || v_order_id;

END make_order;
