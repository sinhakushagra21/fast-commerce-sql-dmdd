-- Create ORDERS Table
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    order_date TIMESTAMP,
    order_status_id NUMBER,
    payments_payment_id NUMBER NOT NULL,
    users_user_id NUMBER NOT NULL,
    CONSTRAINT orders_payments_fk FOREIGN KEY (payments_payment_id) 
        REFERENCES payments(payment_id),
    CONSTRAINT orders_users_fk FOREIGN KEY (users_user_id) 
        REFERENCES users(user_id),
    CONSTRAINT orders_status_fk FOREIGN KEY (order_status_id) 
        REFERENCES order_statuses(status_id)
);