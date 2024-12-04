-- Create USERS Table
CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    is_active CHAR(1) CHECK (is_active IN ('Y', 'N')),
    contact_id NUMBER NOT NULL
);
