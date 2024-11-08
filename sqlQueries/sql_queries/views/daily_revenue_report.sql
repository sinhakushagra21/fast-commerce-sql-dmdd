BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW user18gp.daily_revenue_report';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW user18gp.daily_revenue_report AS
SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM-DD') AS order_date,
    SUM(p.selling_price) AS total_revenue
FROM 
    user18gp.orders o
JOIN 
    user18gp.order_products op ON o.order_id = op.orders_order_id
JOIN 
    user18gp.products p ON op.products_product_id = p.product_id
GROUP BY 
    TO_CHAR(o.order_date, 'YYYY-MM-DD');