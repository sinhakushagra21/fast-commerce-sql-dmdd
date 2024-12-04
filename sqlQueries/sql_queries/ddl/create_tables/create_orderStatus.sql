-- Create ORDER_STATUSES Table
CREATE TABLE order_statuses (
    status_id NUMBER PRIMARY KEY,
    status_name VARCHAR2(50) NOT NULL UNIQUE
);
