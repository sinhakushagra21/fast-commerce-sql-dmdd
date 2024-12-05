BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW daily_revenue_report';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW daily_revenue_report AS
SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM-DD') AS order_date,
    SUM(p.selling_price) AS total_revenue
FROM 
    orders o
JOIN 
    order_products op ON o.order_id = op.orders_order_id
JOIN 
    products p ON op.products_product_id = p.product_id
GROUP BY 
    TO_CHAR(o.order_date, 'YYYY-MM-DD');