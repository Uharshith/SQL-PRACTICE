use patient_db;

CREATE TABLE patient (
    patient_id int AUTO_INCREMENT,
    patient_number VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    biological_sex ENUM('MALE', 'FEMALE', 'INTERSEX', 'NOT_DISCLOSED') NOT NULL,
    blood_group ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-') ,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(120) NULL,
    emergency_contact VARCHAR(100) NOT NULL,
    emergency_phone VARCHAR(15) NOT NULL,
    allergies VARCHAR(255) NULL,
    status ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE',
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_patients PRIMARY KEY (patient_id),
    CONSTRAINT uq_patient_number UNIQUE (patient_number),
    CONSTRAINT uq_patient_phone UNIQUE (phone),
    CONSTRAINT uq_patient_email UNIQUE (email)
);


INSERT INTO patient
(patient_number, first_name, last_name, date_of_birth, biological_sex, blood_group, phone, email, emergency_contact, emergency_phone, allergies, status)
VALUES ('PT26001', 'Aarya', 'Kapoor', '1998-05-12','FEMALE', 'A+', '9876503001', 'aarya.kapoor@example.test','Rohan Kapoor', '9876513001', 'Penicillin', 'ACTIVE');

INSERT INTO patient
(patient_number, first_name, last_name, date_of_birth, biological_sex, blood_group, phone, email, emergency_contact, emergency_phone, allergies, status)
VALUES ('PT26002', 'Dev', 'Malhotra', '1985-11-03', 'MALE', 'O+', '9876503002', NULL, 'Leena Malhotra', '9876513002', NULL, 'ACTIVE');

INSERT INTO patient
(patient_number, first_name, last_name, date_of_birth, biological_sex, blood_group, phone, email, emergency_contact, emergency_phone, allergies, status)
VALUES
('PT26003', 'Isha', 'Bose', '2001-02-19', 'NOT_DISCLOSED', 'B-', '9876503003', 'isha.bose@example.test', 'Tara Bose', '9876513003', 'Peanuts', 'ACTIVE'),

('PT26004', 'Kiran', 'Ali', '1976-08-27', 'INTERSEX', 'AB+', '9876503004', NULL, 'Sameer Ali', '9876513004', NULL, 'INACTIVE'),

('PT26005', 'Neel', 'Joshi', '1990-06-10', 'MALE', NULL, '9876503005', 'neel.joshi@example.test', 'Maya Joshi', '9876513005', 'Dust', 'ACTIVE');

INSERT INTO patient
(patient_number, first_name, last_name, date_of_birth,biological_sex, blood_group, phone, email, emergency_contact, emergency_phone, allergies, status)
VALUES('PT26006', 'Ravi', 'Sharma', '1992-04-15','MALE', 'X+', '9876503006', 'ravi.sharma@example.test','Nisha Sharma', '9876513006', NULL, 'ACTIVE');

INSERT INTO patient
(patient_number, first_name, last_name, date_of_birth, biological_sex, blood_group, phone, email, emergency_contact, emergency_phone, allergies, status)
VALUES ('PT26007', 'Maya', 'Verma', '1995-09-20', 'UNKNOWN', 'A+', '9876503007', 'maya.verma@example.test', 'Arun Verma', '9876513007', NULL, 'ACTIVE');

INSERT INTO patients
(patient_number, first_name, last_name, date_of_birth, biological_sex, blood_group, phone, email, emergency_contact, emergency_phone, allergies, status)
VALUES('PT26001', 'Another', 'Patient', '1999-01-01','FEMALE', 'O+', '9876503008', 'another.patient@example.test','Test Contact', '9876513008', NULL, 'ACTIVE');

UPDATE patient SET allergies = 'Sulfa drugs' WHERE patient_number = 'PT26002';

UPDATE patient SET email = 'dev.malhotra@example.test' WHERE patient_number = 'PT26002';

UPDATE patient SET phone = '9876503991' WHERE patient_number = 'PT26001';

UPDATE patient SET blood_group = 'O-' WHERE patient_number = 'PT26005';

UPDATE patient SET blood_group = 'C+' WHERE patient_number = 'PT26005';


DELETE FROM patient WHERE patient_number = 'PT26004';

INSERT INTO patient
(patient_number, first_name, last_name, date_of_birth, biological_sex, blood_group, phone, email, emergency_contact, emergency_phone, allergies, status)
VALUES('PT-TEMP-01', 'Test', 'Patient', '1995-01-15', 'NOT_DISCLOSED', 'O+', '9876503999', 'temp.patient@example.test','Test Contact', '9876513999', NULL, 'ACTIVE');

DELETE FROM patient WHERE patient_number = 'PT-TEMP-01';


SELECT * FROM patient;

