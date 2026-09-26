create database product;
use product;
CREATE TABLE PRODUCT (
    product_id INT NOT NULL,
    sku VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INT NOT NULL,
    reorder_level INT NOT NULL,
    manufacture_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    product_status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
	CONSTRAINT chk_unit_price CHECK (unit_price > 0),
    
    CONSTRAINT chk_non_negative_quantities CHECK (quantity_in_stock >= 0 AND reorder_level >= 0),
    
    CONSTRAINT chk_expiry_manufacture_date CHECK (expiry_date IS NULL OR manufacture_date IS NULL OR expiry_date >= manufacture_date),
    
    CONSTRAINT pk_product_id PRIMARY KEY (product_id),
    
    CONSTRAINT uk_sku UNIQUE (sku)
);

INSERT INTO PRODUCT (
    product_id, 
    sku, 
    product_name, 
    category, 
    brand, 
    unit_price, 
    quantity_in_stock, 
    reorder_level, 
    manufacture_date, 
    expiry_date, 
    product_status
) 
VALUES 
(1, 'SKU-1001', 'Wireless Mouse', 'Electronics', 'Logitech', 29.99, 50, 10, '2026-01-15', '2028-01-15', 'ACTIVE'),
(2, 'SKU-1002', 'Laptop', 'Electronics', 'Apple', 12.50, 25, 5, '2025-06-01', '2027-06-01', 'ACTIVE');

select * from product;