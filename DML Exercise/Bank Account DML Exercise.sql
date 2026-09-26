use bank_db;

CREATE TABLE bank_account (
    account_id int AUTO_INCREMENT,
    account_number bigint NOT NULL,
    holder_name VARCHAR(120) NOT NULL,
    account_type ENUM('SAVINGS', 'CURRENT', 'FIXED_DEPOSIT') NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    currency CHAR(3) NOT NULL DEFAULT 'INR',
    branch_name VARCHAR(120) NOT NULL,
    opened_date DATE NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    overdraft_limit DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    status ENUM('ACTIVE', 'FROZEN', 'CLOSED') NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_bank_accounts PRIMARY KEY (account_id),
    CONSTRAINT uq_bank_account_number UNIQUE (account_number),
    CONSTRAINT chk_bank_balance CHECK (balance >= 0),
    CONSTRAINT chk_bank_interest CHECK (interest_rate >= 0 AND interest_rate <= 100),
    CONSTRAINT chk_bank_overdraft CHECK (overdraft_limit >= 0)
);

INSERT INTO bank_account
(account_number, holder_name, account_type, balance, currency, branch_name, opened_date, interest_rate, overdraft_limit, status)
VALUES(100000000001, 'Aditi Sharma', 'SAVINGS', 85000.00, 'INR','MG Road Branch', '2024-01-15', 3.50, 0.00, 'ACTIVE');

INSERT INTO bank_account
(account_number, holder_name, account_type, balance, currency, branch_name, opened_date, interest_rate, overdraft_limit, status)
VALUES (100000000002, 'Raj Enterprises', 'CURRENT', 450000.00, 'INR','Commercial Street Branch', '2023-07-01', 0.00, 100000.00, 'ACTIVE'),

(100000000003, 'Priya Nair', 'FIXED_DEPOSIT', 300000.00, 'INR','Kochi Main Branch', '2025-04-10', 7.25, 0.00, 'ACTIVE');

INSERT INTO bank_account
(account_number, holder_name, account_type, balance, currency, branch_name, opened_date, interest_rate, overdraft_limit, status)
VALUES (100000000004, 'Omar Khan', 'SAVINGS', 12500.00, 'INR', 'Banjara Hills Branch', '2022-10-05', 3.25, 0.00, 'FROZEN'),

(100000000005, 'Training Closed Account', 'CURRENT', 0.00, 'INR','Test Branch', '2020-01-01', 0.00, 0.00, 'CLOSED');


INSERT INTO bank_account
(account_number, holder_name, account_type, balance, currency, branch_name, opened_date, interest_rate, overdraft_limit, status)
VALUES (100000000006, 'Test Negative', 'SAVINGS', -1000.00, 'INR','Test Branch', '2026-01-01', 3.00, 0.00, 'ACTIVE');


INSERT INTO bank_account
(account_number, holder_name, account_type, balance, currency, branch_name, opened_date, interest_rate, overdraft_limit, status)
VALUES(100000000001, 'Duplicate Account', 'SAVINGS', 5000.00, 'INR','Test Branch', '2026-01-01', 3.00, 0.00, 'ACTIVE');



UPDATE bank_account SET balance = balance + 25000.00 WHERE account_number = 100000000001;

UPDATE bank_account SET interest_rate = interest_rate + 0.25 WHERE account_type = 'SAVINGS' AND interest_rate + 0.25 <= 100;

UPDATE bank_account SET status = 'ACTIVE' WHERE account_number = 100000000004 AND status = 'FROZEN';

UPDATE bank_account SET balance = balance - 2500.00 WHERE account_number = 100000000004 AND status = 'ACTIVE' AND balance >= 2500.00;

UPDATE bank_accounts SET branch_name = 'Central Business Branch' WHERE branch_name = 'Commercial Street Branch';

UPDATE bank_accounts SET balance = balance - 20000.00 WHERE account_number = 100000000004 AND status = 'ACTIVE' AND balance >= 20000.00;

DELETE FROM bank_account WHERE status = 'CLOSED' AND balance = 0;

INSERT INTO bank_accounts
(account_number, holder_name, account_type, balance, currency, branch_name, opened_date, interest_rate, overdraft_limit, status)
VALUES (999999999999, 'Temporary Test Account', 'SAVINGS', 1000.00, 'INR','Test Branch', '2026-01-01', 3.00, 0.00, 'ACTIVE');

DELETE FROM bank_account WHERE account_number = 999999999999;