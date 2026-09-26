create database bank_db;
use bank_db;

CREATE TABLE bank_accounts (
    account_id int AUTO_INCREMENT,

    account_number varchar(12) NOT NULL,

    account_holder_name VARCHAR(120) NOT NULL,

    account_type ENUM('SAVINGS','CURRENT','FIXED_DEPOSIT') NOT NULL,

    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,

    currency_code CHAR(3) NOT NULL DEFAULT 'INR',

    branch_name VARCHAR(100) NOT NULL,

    opened_date DATE NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL DEFAULT 0.00,

    overdraft_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,

    account_status ENUM('ACTIVE','FROZEN','DORMANT','CLOSED') NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_bank_accounts PRIMARY KEY (account_id),

    CONSTRAINT uq_account_number UNIQUE (account_number),

    CONSTRAINT chk_balance CHECK (balance >= 0.00),

    CONSTRAINT chk_overdraft_limit CHECK (overdraft_limit >= 0.00),

    CONSTRAINT chk_interest_rate CHECK (interest_rate BETWEEN 0.00 AND 100.00)
);



INSERT INTO bank_accounts (
    account_number,
    account_holder_name,
    account_type,
    balance,
    currency_code,
    branch_name,
    opened_date,
    interest_rate,
    overdraft_limit
)
VALUES
(
    '100000000004',
    'Arjun Reddy',
    'SAVINGS',
    84500.75,
    'INR',
    'Madhapur Branch',
    '2022-08-14',
    3.50,
    0.00
),
(
    '100000000005',
    'Sneha Kapoor',
    'CURRENT',
    325750.40,
    'INR',
    'Banjara Hills Branch',
    '2021-03-22',
    0.00,
    75000.00
),
(
    '100000000006',
    'Vikram Mehta',
    'FIXED_DEPOSIT',
    650000.00,
    'INR',
    'Gachibowli Branch',
    '2024-01-18',
    7.25,
    0.00
),
(
    '100000000007',
    'Priya Nair',
    'SAVINGS',
    126350.90,
    'INR',
    'Kukatpally Branch',
    '2023-11-05',
    3.50,
    0.00
),
(
    '100000000008',
    'Karthik Sharma',
    'CURRENT',
    485900.25,
    'INR',
    'Secunderabad Branch',
    '2020-07-30',
    0.00,
    100000.00
);


select * from bank_accounts;