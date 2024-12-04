-- Update Payments to add Orders reference
ALTER TABLE payments ADD (
    orders_order_id NUMBER NOT NULL,
    CONSTRAINT payments_orders_fk FOREIGN KEY (orders_order_id) 
        REFERENCES orders(order_id)
);