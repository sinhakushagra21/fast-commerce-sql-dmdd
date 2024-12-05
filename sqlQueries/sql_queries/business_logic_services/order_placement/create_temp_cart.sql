-- Check for existing objects associated with temp_cart
BEGIN
    FOR obj IN (SELECT object_type, object_name
                FROM all_objects
                WHERE object_name = 'TEMP_CART') LOOP
        -- Drop views, synonyms, and indexes if they exist
        IF obj.object_type = 'VIEW' THEN
            EXECUTE IMMEDIATE 'DROP VIEW ' || obj.object_name;
        ELSIF obj.object_type = 'SYNONYM' THEN
            EXECUTE IMMEDIATE 'DROP SYNONYM ' || obj.object_name;
        ELSIF obj.object_type = 'INDEX' THEN
            EXECUTE IMMEDIATE 'DROP INDEX ' || obj.object_name;
        END IF;
    END LOOP;
END;
/

-- Drop the table if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE temp_cart';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Ignore errors if the table does not exist
END;
/

-- Create the global temporary table temp_cart
CREATE GLOBAL TEMPORARY TABLE temp_cart (
    product_id NUMBER,
    quantity NUMBER
) ON COMMIT DELETE ROWS;

-- Confirm the table has been created
SELECT 'Table temp_cart has been created successfully.' FROM dual;
/
