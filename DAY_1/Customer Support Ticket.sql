create database coustumer_support_db;
use coustumer_support_db;

CREATE TABLE support_tickets (
    ticket_id int AUTO_INCREMENT,

    ticket_number VARCHAR(20) NOT NULL,

    requester_name VARCHAR(120) NOT NULL,

    requester_email VARCHAR(200) NOT NULL,

    subject TEXT NOT NULL,

    description TEXT NOT NULL,

    category ENUM('BILLING','TECHNICAL','ACCOUNT','GENERAL') NOT NULL,

    priority ENUM('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL DEFAULT 'MEDIUM',

    ticket_status ENUM('OPEN','IN_PROGRESS','RESOLVED','CLOSED') NOT NULL DEFAULT 'OPEN',

    assigned_agent VARCHAR(120) NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    resolved_at TIMESTAMP,

    last_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_support_tickets PRIMARY KEY (ticket_id),

    CONSTRAINT uq_ticket_number UNIQUE (ticket_number),

    CONSTRAINT chk_resolution_time CHECK ( resolved_at IS NULL OR resolved_at >= created_at ) );
    
    
    
    
    INSERT INTO support_tickets (
    ticket_number,
    requester_name,
    requester_email,
    subject,
    description,
    category
)
VALUES (
    'TKT-2026-0001',
    'Rahul Sharma',
    'rahul.sharma.test@gmail.com',
    'Unable to access account',
    'I am unable to log into my account after resetting the password.',
    'ACCOUNT'
);

INSERT INTO support_tickets (
    ticket_number,
    requester_name,
    requester_email,
    subject,
    description,
    category,
    priority,
    ticket_status,
    assigned_agent
)
VALUES (
    'TKT-2026-0002',
    'Sneha Reddy',
    'sneha.reddy.test@gmail.com',
    'Payment failed',
    'My payment was deducted but the order was not confirmed.',
    'BILLING',
    'HIGH',
    'IN_PROGRESS',
    'Arjun Kumar'
);
    
    
  INSERT INTO support_tickets (
    ticket_number,
    requester_name,
    requester_email,
    subject,
    description,
    category,
    priority,
    ticket_status,
    assigned_agent,
    resolved_at
)
VALUES (
    'TKT-2026-0003',
    'Karthik Rao',
    'karthik.rao.test@gmail.com',
    'Technical issue with dashboard',
    'The dashboard is displaying an error when loading account information.',
    'TECHNICAL',
    'HIGH',
    'RESOLVED',
    'Priya Nair',
    '2026-09-25 18:30:00'
);

INSERT INTO support_tickets (
    ticket_number,
    requester_name,
    requester_email,
    subject,
    description,
    category,
    priority,
    ticket_status,
    assigned_agent,
    created_at,
    resolved_at
)
VALUES (
    'TKT-2026-0003',
    'Karthik Rao',
    'karthik.rao.test@gmail.com',
    'Technical issue with dashboard',
    'The dashboard is displaying an error when loading account information.',
    'TECHNICAL',
    'HIGH',
    'RESOLVED',
    'Priya Nair',
    '2026-09-25 10:00:00',
    '2026-09-25 18:30:00'
);


INSERT INTO support_tickets (
    ticket_number,
    requester_name,
    requester_email,
    subject,
    description,
    category,
    priority,
    ticket_status,
    created_at,
    resolved_at
)
VALUES (
    'TKT-2026-0004',
    'Ananya Mehta',
    'ananya.mehta.test@gmail.com',
    'Cannot update profile',
    'The profile update page is returning an error.',
    'TECHNICAL',
    'MEDIUM',
    'RESOLVED',
    '2026-09-25 15:00:00',
    '2026-09-25 12:00:00'
);


select * from support_tickets;  