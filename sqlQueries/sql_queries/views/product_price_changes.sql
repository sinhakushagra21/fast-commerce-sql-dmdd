BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW product_price_changes';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW product_price_changes AS
SELECT 
    p.product_id,
    p.product_name,
    p.mrp AS original_price,
    p.selling_price AS current_price,
    (1 - (p.selling_price / p.mrp)) * 100 AS discount_percentage
FROM 
    products p;
