-- 3. discounted_products
BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW discounted_products';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW discounted_products AS
SELECT 
    p.product_id,
    p.product_name,
    p.selling_price,
    p.discounts AS discount_percentage,
    p.selling_price * (1 - (p.discounts / 100)) AS discounted_price
FROM 
    products p
WHERE 
    p.discounts > 0;
