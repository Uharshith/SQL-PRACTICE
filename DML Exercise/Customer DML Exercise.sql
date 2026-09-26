create database customer_db;
use customer_db;

CREATE TABLE customers (
    customer_id int AUTO_INCREMENT,

    customer_code VARCHAR(20) NOT NULL,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(120) NOT NULL,

    phone VARCHAR(15) NULL,

    date_of_birth DATE NULL,

    city VARCHAR(80) NOT NULL,

    state VARCHAR(80) NOT NULL,

    postal_code VARCHAR(10) NOT NULL,

    customer_type ENUM('REGULAR', 'PREMIUM', 'CORPORATE') NOT NULL,

    credit_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,

    active BOOLEAN NOT NULL DEFAULT TRUE,

    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_customers PRIMARY KEY (customer_id),

    CONSTRAINT uq_customer_code UNIQUE (customer_code),

    CONSTRAINT uq_customer_email UNIQUE (email),

    CONSTRAINT uq_customer_phone UNIQUE (phone),

    CONSTRAINT chk_credit_limit CHECK (credit_limit >= 0)
);



INSERT INTO customers (
    customer_code,
    first_name,
    last_name,
    email,
    phone,
    date_of_birth,
    city,
    state,
    postal_code,
    customer_type,
    credit_limit,
    active
)
VALUES (
    'CUST26001',
    'Ananya',
    'Iyer',
    'ananya.iyer@example.test',
    '9876502001',
    '1995-04-11',
    'Bengaluru',
    'Karnataka',
    '560001',
    'PREMIUM',
    75000.00,
    TRUE
);


INSERT INTO customers (
    customer_code,
    first_name,
    last_name,
    email,
    phone,
    date_of_birth,
    city,
    state,
    postal_code,
    customer_type,
    credit_limit,
    active
)
VALUES (
    'CUST26001',
    'Ananya',
    'Iyer',
    'ananya.iyer@example.test',
    '9876502001',
    '1995-04-11',
    'Bengaluru',
    'Karnataka',
    '560001',
    'PREMIUM',
    75000.00,
    TRUE
);



INSERT INTO customers (
    customer_code,
    first_name,
    last_name,
    email,
    phone,
    date_of_birth,
    city,
    state,
    postal_code,
    customer_type,
    credit_limit,
    active
)
VALUES
(
    'CUST26002',
    'Rohan',
    'Das',
    'rohan.das@example.test',
    NULL,
    NULL,
    'Kolkata',
    'West Bengal',
    '700001',
    'REGULAR',
    0.00,
    TRUE
),
(
    'CUST26003',
    'Meera',
    'Shah',
    'meera.shah@example.test',
    '9876502003',
    '1992-08-24',
    'Mumbai',
    'Maharashtra',
    '400001',
    'CORPORATE',
    250000.00,
    TRUE
),
(
    'CUST26004',
    'Arjun',
    'Reddy',
    'arjun.reddy@example.test',
    '9876502004',
    '1988-01-19',
    'Hyderabad',
    'Telangana',
    '500001',
    'PREMIUM',
    100000.00,
    TRUE
),
(
    'CUST26005',
    'Nisha',
    'Menon',
    'nisha.menon@example.test',
    NULL,
    NULL,
    'Kochi',
    'Kerala',
    '682001',
    'REGULAR',
    0.00,
    FALSE
);

INSERT INTO customers (
    customer_code,
    first_name,
    last_name,
    email,
    city,
    state,
    postal_code,
    customer_type,
    credit_limit,
    active
)
VALUES ('CUST26006','Kavya','Nair','ananya.iyer@example.test','Chennai','Tamil Nadu','600001','REGULAR',0.00,TRUE);


INSERT INTO customers (
    customer_code,
    first_name,
    last_name,
    email,
    city,
    state,
    postal_code,
    customer_type,
    credit_limit,
    active
)
VALUES (
    'CUST26007',
    'Vivek',
    'Rao',
    'vivek.rao@example.test',
    'Pune',
    'Maharashtra',
    '411001',
    'REGULAR',
    -5000.00,
    TRUE
);


INSERT INTO customers (
    customer_code,
    first_name,
    last_name,
    email,
    city,
    state,
    postal_code,
    customer_type,
    credit_limit,
    active
)
VALUES (
    'CUST26008',
    'Sanjay',
    'Kumar',
    'sanjay.kumar@example.test',
    'Delhi',
    'Delhi',
    '110001',
    'GOLD',
    50000.00,
    TRUE
);



UPDATE customers SET credit_limit = ROUND(credit_limit * 1.10, 2) WHERE customer_type = 'PREMIUM' AND active = TRUE;

UPDATE customers SET phone = '9876502002' WHERE customer_code = 'CUST26002';

UPDATE customers SET city = 'Secunderabad', postal_code = '500003' WHERE customer_code = 'CUST26004';

UPDATE customers SET credit_limit = 275000.00 WHERE customer_code = 'CUST26003';

UPDATE customers SET phone = '9876502001' WHERE customer_code = 'CUST26002';


DELETE FROM customers WHERE active = FALSE;

INSERT INTO customers
(customer_code, first_name, last_name, email, phone, date_of_birth,
 city, state, postal_code, customer_type, credit_limit, active)
VALUES
('CUST-TEMP-01', 'Test', 'Customer', 'temp.customer@gmail.com',
 '9876502099', '1995-05-15',
 'Hyderabad', 'Telangana', '500001',
 'REGULAR', 10000.00, TRUE);
 
DELETE FROM customers WHERE customer_code = 'CUST-TEMP-01';


select * from customers;