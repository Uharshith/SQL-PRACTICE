create database customer;
use customer;
CREATE TABLE CUSTOMER (
    customer_id INT AUTO_INCREMENT NOT NULL,
    customer_code VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NULL,                             
    date_of_birth DATE NULL,                           
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    customer_type VARCHAR(20) NOT NULL DEFAULT 'REGULAR',
    credit_limit DECIMAL(10, 2) NOT NULL DEFAULT 0.00,  
    is_active BOOLEAN NOT NULL DEFAULT TRUE,            
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
 
    CONSTRAINT pk_customer_id PRIMARY KEY (customer_id),
    CONSTRAINT uk_customer_code UNIQUE (customer_code),
    CONSTRAINT uk_email UNIQUE (email),
    CONSTRAINT uk_phone UNIQUE (phone),

    CONSTRAINT chk_customer_type CHECK (customer_type IN ('REGULAR', 'PREMIUM', 'CORPORATE')),
    CONSTRAINT chk_credit_limit CHECK (credit_limit >= 0.00)
);


INSERT INTO CUSTOMER (
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
    is_active
) 
VALUES 
('CUST-1001', 'Harshith', 'Undru', 'undru.harshith123@gmail.com', '9505840150', '2005-02-22', 'Hyderabad', 'telangana', '534200', 'PREMIUM', 500.00, TRUE),
('CUST-1002', 'Jagadeesh', 'karra', 'jagadeesh@gmail.com', '9912168239', '2004-11-20', 'bhimavaram', 'AP', '734320', 'CORPORATE', 1500.50, TRUE);


select * from customer; -- where customer_id = 1;