-- Create PAYMENTS Table (note: using ORDER first to resolve circular reference)
CREATE TABLE payments (
    payment_id NUMBER PRIMARY KEY,
    payment_status VARCHAR2(50),
    payment_date TIMESTAMP,
    payment_ref_id NUMBER,
    CONSTRAINT payments_type_fk FOREIGN KEY (payment_ref_id) 
        REFERENCES payment_types(payment_type_id)
);