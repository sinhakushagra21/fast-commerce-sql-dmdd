-- Package Specification for cart operations
CREATE OR REPLACE PACKAGE cart_package IS
    PROCEDURE add_to_cart(p_product_id NUMBER, p_quantity NUMBER);
    FUNCTION review_cart RETURN SYS_REFCURSOR;
END cart_package;
/

-- Package Body for cart operations
CREATE OR REPLACE PACKAGE BODY cart_package IS

    PROCEDURE add_to_cart(p_product_id NUMBER, p_quantity NUMBER) IS
    BEGIN
        -- Insert the product into the temporary cart
        INSERT INTO temp_cart (product_id, quantity)
        VALUES (p_product_id, p_quantity);
    END add_to_cart;

    FUNCTION review_cart RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        -- Open a cursor to review the cart contents from temp_cart
        OPEN v_cursor FOR
        SELECT p.PRODUCT_ID, p.PRODUCT_NAME, p.SELLING_PRICE, c.quantity
        FROM temp_cart c
        JOIN PRODUCTS p ON c.product_id = p.PRODUCT_ID;
        RETURN v_cursor;
    END review_cart;

END cart_package;
/
