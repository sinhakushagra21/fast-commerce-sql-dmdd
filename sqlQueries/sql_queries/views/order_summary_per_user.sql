BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW order_summary_per_user';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW order_summary_per_user AS
SELECT 
    u.user_id,
    u.is_active AS user_active_status,
    COUNT(o.order_id) AS total_orders,
    SUM(p.selling_price) AS total_spending
FROM 
    users u
JOIN 
    orders o ON u.user_id = o.users_user_id
JOIN 
    order_products op ON o.order_id = op.orders_order_id
JOIN 
    products p ON op.products_product_id = p.product_id
GROUP BY 
    u.user_id, u.is_active;