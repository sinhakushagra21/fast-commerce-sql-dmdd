-- Insert sample data into ROLES table
BEGIN
    BEGIN
        INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (1, 'admin_role', 1);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL; -- Ignore duplicate
    END;

    BEGIN
        INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (2, 'user_role', 2);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;

    BEGIN
        INSERT INTO "USER18GP"."ROLES" (ROLE_ID, ROLE_TYPES, USERS_USER_ID) VALUES (3, 'warehouse_manager_role', 3);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            NULL;
    END;
END;
/


-- -- Start an anonymous PL/SQL block to handle dropping roles if they exist
-- BEGIN
--    -- Drop roles if they exist
--    EXECUTE IMMEDIATE 'DROP ROLE admin_role';
--    EXECUTE IMMEDIATE 'DROP ROLE user_role';
--    EXECUTE IMMEDIATE 'DROP ROLE warehouse_manager_role';
-- EXCEPTION
--    WHEN OTHERS THEN
--       NULL;  -- Ignore errors if roles do not exist
-- END;
-- /

-- -- Create roles for the system
-- CREATE ROLE admin_role;
-- CREATE ROLE user_role;
-- CREATE ROLE warehouse_manager_role;

-- -- Grant privileges to roles (Ensure the user has GRANT privileges on these tables)
-- -- Admin privileges: Full control over the system
-- GRANT ALL PRIVILEGES ON user18gp.categories TO admin_role;
-- GRANT ALL PRIVILEGES ON user18gp.users TO admin_role;
-- GRANT ALL PRIVILEGES ON user18gp.products TO admin_role;
-- GRANT ALL PRIVILEGES ON user18gp.warehouse TO admin_role;
-- GRANT ALL PRIVILEGES ON user18gp.orders TO admin_role;
-- GRANT ALL PRIVILEGES ON user18gp.payments TO admin_role;
-- GRANT ALL PRIVILEGES ON user18gp.roles TO admin_role;
-- GRANT ALL PRIVILEGES ON user18gp.locations TO admin_role;

-- -- User privileges: Limited to purchasing products, viewing and managing their orders
-- GRANT SELECT, INSERT, UPDATE ON user18gp.orders TO user_role;
-- GRANT SELECT ON user18gp.products TO user_role;
-- GRANT SELECT, INSERT ON user18gp.payments TO user_role;
-- GRANT SELECT ON user18gp.categories TO user_role;

-- -- Warehouse Manager privileges: Can manage stock but restricted from viewing sensitive user data
-- GRANT SELECT, UPDATE ON user18gp.products TO warehouse_manager_role;
-- GRANT SELECT ON user18gp.warehouse TO warehouse_manager_role;
-- GRANT SELECT ON user18gp.locations TO warehouse_manager_role;
-- GRANT UPDATE ON user18gp.orders TO warehouse_manager_role;
-- GRANT SELECT ON user18gp.categories TO warehouse_manager_role;

-- -- Create users and assign roles

-- -- Drop users if they exist, with error handling
-- BEGIN
--     FOR user_rec IN (
--         SELECT 'SYSTEM_ADMIN' AS username FROM dual UNION ALL
--         SELECT 'STORE_USER' FROM dual UNION ALL
--         SELECT 'WAREHOUSE_MANAGER' FROM dual
--     ) LOOP
--         BEGIN
--             EXECUTE IMMEDIATE 'DROP USER ' || user_rec.username || ' CASCADE';
--             DBMS_OUTPUT.PUT_LINE('Dropped user: ' || user_rec.username);
--         EXCEPTION
--             WHEN OTHERS THEN
--                 IF SQLCODE != -01918 THEN  -- Ignore "user does not exist" error
--                     DBMS_OUTPUT.PUT_LINE('Could not drop user ' || user_rec.username || ' due to: ' || SQLERRM);
--                 END IF;
--         END;
--     END LOOP;
-- END;
-- /
-- COMMIT;

-- -- Create SYSTEM_ADMIN user and grant admin role
-- BEGIN
--     EXECUTE IMMEDIATE 'CREATE USER system_admin IDENTIFIED BY "Adminpassword20#"';
--     EXECUTE IMMEDIATE 'GRANT admin_role TO system_admin';
-- EXCEPTION
--     WHEN OTHERS THEN
--         IF SQLCODE = -01920 THEN
--             NULL; -- User already exists, do nothing
--         ELSE
--             RAISE;
--         END IF;
-- END;
-- /

-- -- Create STORE_USER and assign user role
-- BEGIN
--     EXECUTE IMMEDIATE 'CREATE USER store_user IDENTIFIED BY "Userpassword20#"';
--     EXECUTE IMMEDIATE 'GRANT user_role TO store_user';
-- EXCEPTION
--     WHEN OTHERS THEN
--         IF SQLCODE = -01920 THEN
--             NULL; -- User already exists, do nothing
--         ELSE
--             RAISE;
--         END IF;
-- END;
-- /

-- -- Create WAREHOUSE_MANAGER user and assign warehouse manager role
-- BEGIN
--     EXECUTE IMMEDIATE 'CREATE USER warehouse_manager IDENTIFIED BY "Warehousepassword20#"';
--     EXECUTE IMMEDIATE 'GRANT warehouse_manager_role TO warehouse_manager';
-- EXCEPTION
--     WHEN OTHERS THEN
--         IF SQLCODE = -01920 THEN
--             NULL; -- User already exists, do nothing
--         ELSE
--             RAISE;
--         END IF;
-- END;
-- /

-- -- Commit the changes
-- COMMIT;