-- Create WAREHOUSE Table
CREATE TABLE warehouse (
    warehouse_id NUMBER PRIMARY KEY,
    is_active CHAR(1) CHECK (is_active IN ('Y', 'N')),
    opening_time VARCHAR2(5) CHECK (REGEXP_LIKE(opening_time, '^([01][0-9]|2[0-3]):[0-5][0-9]$')),
    closing_time VARCHAR2(5) CHECK (REGEXP_LIKE(closing_time, '^([01][0-9]|2[0-3]):[0-5][0-9]$')),
    location_location_id NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP
);