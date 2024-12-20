DECLARE
   user_count NUMBER;
BEGIN
   -- Check if USER18GP already exists in the system
   SELECT COUNT(*)
   INTO user_count
   FROM all_users
   WHERE username = 'USER18GP';

   -- If user does not exist, create the user and assign grants
   IF user_count = 0 THEN
      EXECUTE IMMEDIATE 'CREATE USER USER18GP IDENTIFIED BY NeuBoston2024#';

      EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE, UNLIMITED TABLESPACE TO USER18GP';
      EXECUTE IMMEDIATE 'ALTER USER USER18GP QUOTA UNLIMITED ON DATA';
      EXECUTE IMMEDIATE 'GRANT CREATE ROLE TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT CREATE USER TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT ALTER USER TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT DROP USER TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT DROP ANY ROLE TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT GRANT ANY OBJECT PRIVILEGE TO USER18GP';
      EXECUTE IMMEDIATE 'GRANT GRANT ANY ROLE TO USER18GP';

      DBMS_OUTPUT.PUT_LINE('User USER18GP created and privileges granted.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('User USER18GP already exists.');
   END IF;
END;
/
