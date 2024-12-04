-- Create ORDER_PRODUCTS Table
CREATE TABLE order_products (
    orders_order_id NUMBER NOT NULL,
    products_product_id NUMBER NOT NULL,
    CONSTRAINT order_products_pk PRIMARY KEY (orders_order_id, products_product_id),
    CONSTRAINT order_products_orders_fk FOREIGN KEY (orders_order_id) 
        REFERENCES orders(order_id),
    CONSTRAINT order_products_products_fk FOREIGN KEY (products_product_id) 
        REFERENCES products(product_id)
);