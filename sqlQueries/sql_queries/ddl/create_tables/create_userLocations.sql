-- Create USER_LOCATIONS Table
CREATE TABLE user_locations (
    users_user_id NUMBER NOT NULL,
    location_location_id NUMBER NOT NULL,
    CONSTRAINT user_locations_pk PRIMARY KEY (users_user_id, location_location_id),
    CONSTRAINT user_locations_users_fk FOREIGN KEY (users_user_id) 
        REFERENCES users(user_id),
    CONSTRAINT user_locations_location_fk FOREIGN KEY (location_location_id) 
        REFERENCES locations(location_id)
);