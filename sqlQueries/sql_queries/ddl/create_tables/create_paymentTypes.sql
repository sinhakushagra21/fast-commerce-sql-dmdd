-- Create PAYMENT_TYPES Table
CREATE TABLE payment_types (
    payment_type_id NUMBER PRIMARY KEY,
    payment_type_name VARCHAR2(50) NOT NULL UNIQUE
);