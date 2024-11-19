BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW user18gp.current_inventory_status';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW user18gp.current_inventory_status AS
SELECT 
    p.product_id,
    p.product_name,
    p.item_quantity AS current_stock,
    w.warehouse_id,
    w.is_active AS warehouse_active_status
FROM 
    user18gp.products p
JOIN 
    user18gp.warehouse w ON p.warehouse_warehouse_id = w.warehouse_id;