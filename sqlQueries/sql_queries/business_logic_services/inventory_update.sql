CREATE OR REPLACE PROCEDURE update_inventory (
    p_product_id IN NUMBER,
    p_quantity IN NUMBER,
    p_action IN VARCHAR2 -- Action to specify "UPDATE" or "DELETE"
) IS
    v_stock NUMBER;
BEGIN
    IF UPPER(p_action) = 'DELETE' THEN
        -- Handle product deletion
        DELETE FROM user18gp.products
        WHERE product_id = p_product_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Product not found. Cannot delete.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Product ID ' || p_product_id || ' deleted successfully.');
        END IF;

    ELSIF UPPER(p_action) = 'UPDATE' THEN
        -- Handle stock update
        SELECT item_quantity
        INTO v_stock
        FROM user18gp.products
        WHERE product_id = p_product_id;

        IF v_stock >= p_quantity THEN
            UPDATE user18gp.products
            SET item_quantity = item_quantity - p_quantity
            WHERE product_id = p_product_id;

            DBMS_OUTPUT.PUT_LINE('Inventory updated successfully for Product ID: ' || p_product_id);
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Insufficient stock to update inventory');
        END IF;

    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'Invalid action. Use "UPDATE" or "DELETE".');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Product not found');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'An error occurred while updating inventory');
END;
/


BEGIN
    update_inventory(101, 3, 'UPDATE');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


BEGIN
    update_inventory(101, 0, 'DELETE'); -- Quantity is ignored for DELETE
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
