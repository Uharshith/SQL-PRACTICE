create database patient_db;
use patient_db;

CREATE TABLE patients (
    patient_id BIGINT UNSIGNED AUTO_INCREMENT,

    patient_number VARCHAR(15) NOT NULL,

    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,

    date_of_birth DATE NOT NULL,

    biological_sex ENUM('FEMALE','MALE','INTERSEX','NOT_DISCLOSED') NOT NULL,

    blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NULL,
    
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NULL,

    emergency_contact_name VARCHAR(50) NOT NULL,
    emergency_contact_phone VARCHAR(15) NOT NULL,

    allergies text,
    
    patient_status ENUM('ACTIVE','INACTIVE','DECEASED') NOT NULL DEFAULT 'ACTIVE',

    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_patients PRIMARY KEY (patient_id),

    CONSTRAINT uq_patient_number UNIQUE (patient_number)
);


INSERT INTO patients (
    patient_number,
    first_name,
    last_name,
    date_of_birth,
    biological_sex,
    blood_group,
    phone,
    email,
    emergency_contact_name,
    emergency_contact_phone,
    allergies
)
VALUES (
    'PAT000001',
    'Arun',
    'Kumar',
    '2001-05-15',
    'MALE',
    'O+',
    '9876543210',
    'arun@example.com',
    'Ravi Kumar',
    '9123456780',
    'Peanuts'
);



INSERT INTO patients (
    patient_number,
    first_name,
    last_name,
    date_of_birth,
    biological_sex,
    blood_group,
    phone,
    email,
    emergency_contact_name,
    emergency_contact_phone,
    allergies
)
VALUES
(
    'PAT000002',
    'Priya',
    'Sharma',
    '2002-08-20',
    'FEMALE',
    'A+',
    '9876501234',
    'priya@example.com',
    'Anita Sharma',
    '9123405678',
    'None'
),
(
    'PAT000003',
    'Rahul',
    'Reddy',
    '1998-11-10',
    'MALE',
    'B-',
    '9866012345',
    NULL,
    'Suresh Reddy',
    '9012345678',
    'Penicillin'
),
(
    'PAT000004',
    'Ananya',
    'Rao',
    '2000-03-25',
    'FEMALE',
    NULL,
    '9988776655',
    'ananya@example.com',
    'Meena Rao',
    '9876543211',
    NULL
);


INSERT INTO patients (
    patient_number,
    first_name,
    last_name,
    date_of_birth,
    biological_sex,
    blood_group,
    phone,
    email,
    emergency_contact_name,
    emergency_contact_phone,
    allergies,
    patient_status
)
VALUES
(
    'PAT000005',
    'Vikram',
    'Rao',
    '1997-06-18',
    'MALE',
    'AB+',
    '9000001001',
    'vikram.rao.test@gmail.com',
    'Sanjay Rao',
    '9000002001',
    'None',
    'INACTIVE'
),
(
    'PAT000006',
    'Sneha',
    'Reddy',
    '1999-12-03',
    'FEMALE',
    'O-',
    '9000001002',
    'sneha.reddy.test@gmail.com',
    'Lakshmi Reddy',
    '9000002002',
    'Dust',
    'INACTIVE'
),
(
    'PAT000007',
    'Karthik',
    'Mehta',
    '1995-09-27',
    'MALE',
    'B+',
    '9000001003',
    'karthik.mehta.test@gmail.com',
    'Neeraj Mehta',
    '9000002003',
    'Penicillin',
    'INACTIVE'
);

select * from patients;
