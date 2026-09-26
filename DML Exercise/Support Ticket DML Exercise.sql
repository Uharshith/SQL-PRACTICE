CREATE TABLE support_ticket (ticket_id INT AUTO_INCREMENT, 
ticket_number VARCHAR(20) NOT NULL,
 requester_name VARCHAR(100) NOT NULL,
 requester_email VARCHAR(150) NOT NULL,
 subject VARCHAR(200) NOT NULL, 
 description VARCHAR(500) NOT NULL, 
 category ENUM('ACCOUNT','BILLING','TECHNICAL','GENERAL') NOT NULL, 
 priority ENUM('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL, 
 status ENUM('OPEN','IN_PROGRESS','RESOLVED') NOT NULL, 
 assigned_agent VARCHAR(100) NULL, resolved_time TIMESTAMP NULL, 
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
 last_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
 CONSTRAINT pk_support_ticket PRIMARY KEY (ticket_id), 
 CONSTRAINT uk_ticket_number UNIQUE (ticket_number), 
 CONSTRAINT chk_resolved_time CHECK (resolved_time IS NULL OR resolved_time >= created_at) );
 
 INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-26001', 'Asha Rao', 'asha.rao@example.test', 'Unable to reset password', 'Reset link is not arriving', 'ACCOUNT', 'HIGH', 'OPEN', NULL, NULL);
 
 INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-26002', 'Dev Stores', 'dev.stores@example.test', 'Incorrect invoice total', 'The latest invoice contains an extra charge', 'BILLING', 'MEDIUM', 'IN_PROGRESS', 'Neha', NULL),
 ('TKT-26003', 'Meera Nair', 'meera.nair@example.test', 'Application crashes', 'Application closes while uploading a file', 'TECHNICAL', 'CRITICAL', 'OPEN', 'Vikram', NULL);

INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-26004', 'Omar Ali', 'omar.ali@example.test', 'Change registered email', 'Request to replace the account email', 'ACCOUNT', 'LOW', 'OPEN', NULL, NULL), 
('TKT-26005', 'Test User', 'test.user@example.test', 'Sample resolved request', 'Temporary ticket used for delete practice', 'GENERAL', 'MEDIUM', 'RESOLVED', 'QA Agent', CURRENT_TIMESTAMP);

INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-INVALID-01', 'Test User', 'test@example.test', 'Invalid category', 'Testing invalid category', 'SHIPPING', 'HIGH', 'OPEN', NULL, NULL);

INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-INVALID-02', 'Test User', 'test@example.test', 'Invalid priority', 'Testing invalid priority', 'GENERAL', 'URGENT', 'OPEN', NULL, NULL);

INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-INVALID-03', 'Test User', 'test@example.test', 'Invalid status', 'Testing invalid status', 'GENERAL', 'MEDIUM', 'WAITING', NULL, NULL);

INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-26001', 'Duplicate User', 'duplicate@example.test', 'Duplicate ticket', 'Testing duplicate ticket number', 'GENERAL', 'LOW', 'OPEN', NULL, NULL);

INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time, created_at) VALUES ('TKT-INVALID-04', 'Time Test', 'time@example.test', 'Invalid time', 'Testing resolved time constraint', 'GENERAL', 'MEDIUM', 'RESOLVED', 'QA Agent', '2026-09-24 11:00:00', '2026-09-24 12:00:00');


UPDATE support_ticket SET assigned_agent = 'Kavya', status = 'IN_PROGRESS' WHERE ticket_number = 'TKT-26001';

UPDATE support_ticket SET status = 'RESOLVED', resolved_time = CURRENT_TIMESTAMP WHERE ticket_number = 'TKT-26003';

UPDATE support_ticket SET priority = 'MEDIUM' WHERE category = 'ACCOUNT' AND status = 'OPEN' AND priority = 'LOW';

UPDATE support_ticket SET assigned_agent = 'Rahul' WHERE ticket_number = 'TKT-26002' AND assigned_agent = 'Neha';

UPDATE support_ticket SET resolved_time = created_at - INTERVAL 1 HOUR WHERE ticket_number = 'TKT-26002';

DELETE FROM support_ticket WHERE ticket_number = 'TKT-26005';


INSERT INTO support_ticket (ticket_number, requester_name, requester_email, subject, description, category, priority, status, assigned_agent, resolved_time) VALUES ('TKT-TEMP-01', 'Temporary User', 'temp@example.test', 'Temporary ticket', 'Ticket created for delete practice', 'GENERAL', 'LOW', 'OPEN', NULL, NULL);

DELETE FROM support_ticket WHERE ticket_number = 'TKT-TEMP-01';

