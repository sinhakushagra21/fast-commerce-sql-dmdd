BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW user18gp.order_status';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
CREATE VIEW user18gp.order_status AS
SELECT 
    o.order_id,
    o.order_date,
    s.status_name AS order_status,
    u.user_id,
    u.is_active AS user_active_status
FROM 
    user18gp.orders o
JOIN 
    user18gp.order_statuses s ON o.order_status_id = s.status_id
JOIN 
    user18gp.users u ON o.users_user_id = u.user_id
WHERE 
    s.status_name IN ('Pending', 'Confirmed', 'Canceled');