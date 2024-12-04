-- Create CONTACTS Table
CREATE TABLE contacts (
    id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    email_id VARCHAR2(100) NOT NULL,
    phone_num VARCHAR2(10) NOT NULL,
    users_user_id NUMBER NOT NULL,
    CONSTRAINT contacts_users_fk FOREIGN KEY (users_user_id) 
        REFERENCES users(user_id)
);