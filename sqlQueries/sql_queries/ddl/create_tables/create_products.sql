-- Create PRODUCTS Table
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category_type_id NUMBER,
    item_quantity NUMBER,
    mrp NUMBER,
    selling_price NUMBER,
    discounts NUMBER(4,2),
    warehouse_warehouse_id NUMBER NOT NULL,
    is_active CHAR(1),
    CONSTRAINT products_warehouse_fk FOREIGN KEY (warehouse_warehouse_id) 
        REFERENCES warehouse(warehouse_id),
    CONSTRAINT products_category_fk FOREIGN KEY (category_type_id) 
        REFERENCES categories(category_id)
);