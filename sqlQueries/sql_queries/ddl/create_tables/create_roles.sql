-- Create ROLES Table
CREATE TABLE roles (
    role_id NUMBER PRIMARY KEY,
    role_types VARCHAR2(50),
    users_user_id NUMBER NOT NULL,
    CONSTRAINT roles_users_fk FOREIGN KEY (users_user_id) 
        REFERENCES users(user_id)
);