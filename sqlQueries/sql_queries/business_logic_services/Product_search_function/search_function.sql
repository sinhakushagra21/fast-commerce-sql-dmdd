CREATE OR REPLACE PROCEDURE search_products (
    p_product_id IN NUMBER DEFAULT NULL,
    p_product_name IN VARCHAR2 DEFAULT NULL
) IS
    -- Cursor for fetching product results
    CURSOR c_products IS
        SELECT 
            product_id,
            product_name,
            category_type_id,
            item_quantity,
            mrp,
            selling_price,
            discounts,
            warehouse_warehouse_id,
            is_active
        FROM 
            products
        WHERE 
            (p_product_id IS NULL OR product_id = p_product_id)
            AND (p_product_name IS NULL OR LOWER(product_name) LIKE '%' || LOWER(p_product_name) || '%');

    v_product c_products%ROWTYPE;
BEGIN
    OPEN c_products;
    LOOP
        FETCH c_products INTO v_product;
        EXIT WHEN c_products%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_product.product_id);
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || v_product.product_name);
        DBMS_OUTPUT.PUT_LINE('Category ID: ' || v_product.category_type_id);
        DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_product.item_quantity);
        DBMS_OUTPUT.PUT_LINE('MRP: ' || v_product.mrp);
        DBMS_OUTPUT.PUT_LINE('Selling Price: ' || v_product.selling_price);
        DBMS_OUTPUT.PUT_LINE('Discounts: ' || v_product.discounts || '%');
        DBMS_OUTPUT.PUT_LINE('Warehouse ID: ' || v_product.warehouse_warehouse_id);
        DBMS_OUTPUT.PUT_LINE('Active Status: ' || v_product.is_active);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;
    CLOSE c_products;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
SET SERVEROUTPUT ON;
BEGIN
     search_products(p_product_id => 2);
END;
 /

BEGIN
    search_products(p_product_name => 'lays');
END;
/

BEGIN
    search_products;
END;
/
