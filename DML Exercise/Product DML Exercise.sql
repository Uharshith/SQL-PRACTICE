create database product_db;
use product_db;

CREATE TABLE products (
    product_id int AUTO_INCREMENT,

    sku VARCHAR(20) NOT NULL,

    product_name VARCHAR(120) NOT NULL,

    category VARCHAR(60) NOT NULL,

    brand VARCHAR(80) NULL,

    unit_price DECIMAL(10,2) NOT NULL,

    stock INT UNSIGNED NOT NULL DEFAULT 0,

    reorder_level INT UNSIGNED NOT NULL DEFAULT 0,

    manufacture_date DATE NULL,

    expiry_date DATE NULL,

    status ENUM('ACTIVE','OUT_OF_STOCK','DISCONTINUED') NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_products PRIMARY KEY (product_id),

    CONSTRAINT uq_product_sku UNIQUE (sku),

    CONSTRAINT chk_unit_price CHECK (unit_price >= 0),

    CONSTRAINT chk_expiry_date CHECK ( expiry_date IS NULL OR manufacture_date IS NULL OR expiry_date >= manufacture_date )
);


INSERT INTO products (
    sku,
    product_name,
    category,
    brand,
    unit_price,
    stock,
    reorder_level,
    manufacture_date,
    expiry_date,
    status
)
VALUES (
    'SKU-CBL-001',
    'USB-C Cable',
    'Accessories',
    'TechLine',
    399.00,
    50,
    10,
    NULL,
    NULL,
    'ACTIVE'
);


INSERT INTO products (
    sku,
    product_name,
    category,
    brand,
    unit_price,
    stock,
    reorder_level,
    manufacture_date,
    expiry_date,
    status
)
VALUES
(
    'SKU-KBD-002',
    'Wireless Keyboard',
    'Accessories',
    'KeyPro',
    1499.00,
    8,
    5,
    '2026-01-15',
    NULL,
    'ACTIVE'
),
(
    'SKU-JCE-003',
    'Orange Juice',
    'Beverages',
    'FreshDrop',
    120.00,
    0,
    20,
    '2026-09-01',
    '2026-12-01',
    'OUT_OF_STOCK'
);


INSERT INTO products (
    sku,
    product_name,
    category,
    brand,
    unit_price,
    stock,
    reorder_level,
    manufacture_date,
    expiry_date,
    status
)
VALUES
(
    'SKU-NTB-004',
    'A5 Notebook',
    'Stationery',
    'PaperNest',
    75.00,
    120,
    25,
    NULL,
    NULL,
    'ACTIVE'
),
(
    'SKU-OLD-005',
    'Legacy Adapter',
    'Accessories',
    'WireMax',
    299.00,
    0,
    0,
    NULL,
    NULL,
    'DISCONTINUED'
);



INSERT INTO products (
    sku,
    product_name,
    category,
    brand,
    unit_price,
    stock,
    reorder_level,
    status
)
VALUES (
    'SKU-NEG-006',
    'Invalid Price Product',
    'Accessories',
    'TestBrand',
    -100.00,
    10,
    5,
    'ACTIVE'
);



INSERT INTO products (
    sku,
    product_name,
    category,
    brand,
    unit_price,
    stock,
    reorder_level,
    manufacture_date,
    expiry_date,
    status
)
VALUES (
    'SKU-DATE-007',
    'Invalid Date Product',
    'Beverages',
    'FreshDrop',
    150.00,
    20,
    5,
    '2026-09-20',
    '2026-09-10',
    'ACTIVE'
);



INSERT INTO products (
    sku,
    product_name,
    category,
    brand,
    unit_price,
    stock,
    reorder_level,
    status
)
VALUES (
    'SKU-CBL-001',
    'Another USB-C Cable',
    'Accessories',
    'OtherBrand',
    299.00,
    25,
    5,
    'ACTIVE'
);

UPDATE products SET stock = stock + 60, status = 'ACTIVE' WHERE sku = 'SKU-JCE-003';



UPDATE products SET unit_price = ROUND(unit_price * 1.05, 2) WHERE category = 'Accessories';

UPDATE products SET brand = NULL WHERE sku = 'SKU-NTB-004';

UPDATE products SET reorder_level = 15 WHERE status = 'ACTIVE' AND stock < 10;

DELETE FROM products WHERE sku = 'SKU-OLD-005';

INSERT INTO products (
    sku,
    product_name,
    category,
    brand,
    unit_price,
    stock,
    reorder_level,
    status
)
VALUES (
    'SKU-TEMP-999',
    'Temporary Test Product',
    'Accessories',
    'TestBrand',
    499.00,
    10,
    5,
    'ACTIVE'
);



DELETE FROM products WHERE sku = 'SKU-TEMP-999';


SELECT * FROM products WHERE sku = 'SKU-OLD-005';