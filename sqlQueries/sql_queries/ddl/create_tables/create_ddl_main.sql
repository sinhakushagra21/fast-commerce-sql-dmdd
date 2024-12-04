-- Drop existing tables with CASCADE CONSTRAINTS
BEGIN
    FOR t IN (SELECT table_name FROM user_tables)
    LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/



@create_categories.sql
@create_users.sql
@create_contacts.sql
@create_warehouse.sql
@create_locations.sql
@create_products.sql
@create_orderStatus.sql
@create_paymentTypes.sql
@create_roles.sql
@create_payments.sql
@create_orders.sql
@update_payments.sql
@create_orderProducts.sql
@create_userLocations.sql
