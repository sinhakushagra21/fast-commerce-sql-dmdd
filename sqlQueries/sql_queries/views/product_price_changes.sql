BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW user18gp.product_price_changes';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW user18gp.product_price_changes AS
SELECT 
    p.product_id,
    p.product_name,
    p.mrp AS original_price,
    p.selling_price AS current_price,
    p.discounts AS discount_percentage
FROM 
    user18gp.products p;