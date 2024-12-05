-- Create LOCATIONS Table
CREATE TABLE locations (
    location_id NUMBER PRIMARY KEY,
    latitude NUMBER,
    longitude NUMBER,
    address VARCHAR2(64),
    city_code NUMBER,
    zip_code VARCHAR2(10),
    location_type VARCHAR2(10),
    warehouse_warehouse_id NUMBER,
    CONSTRAINT locations_warehouse_fk FOREIGN KEY (warehouse_warehouse_id) 
        REFERENCES warehouse(warehouse_id)
);