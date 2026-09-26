create database vehicle_db;
use vehicle_db;

CREATE TABLE vehicles (
    vehicle_id int AUTO_INCREMENT,

    registration_number VARCHAR(20) NOT NULL,

    owner_name VARCHAR(120) NOT NULL,

    manufacturer VARCHAR(80) NOT NULL,

    model VARCHAR(80) NOT NULL,

    vehicle_type ENUM('CAR','MOTORCYCLE','TRUCK','VAN','BUS') NOT NULL,

    fuel_type ENUM('PETROL','DIESEL','ELECTRIC','HYBRID','CNG') NOT NULL,

    manufacture_year YEAR NOT NULL,

    purchase_date DATE ,

    color VARCHAR(40) NOT NULL,

    odometer_km INT UNSIGNED NOT NULL DEFAULT 0,

    insurance_expiry DATE ,

    vehicle_status ENUM('ACTIVE','IN_SERVICE','SOLD','SCRAPPED') NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_vehicles PRIMARY KEY (vehicle_id),

    CONSTRAINT uq_registration_number UNIQUE (registration_number)
);

INSERT INTO vehicles (
    registration_number,
    owner_name,
    manufacturer,
    model,
    vehicle_type,
    fuel_type,
    manufacture_year,
    purchase_date,
    color,
    odometer_km,
    insurance_expiry,
    vehicle_status
)
VALUES
(
    'TS15QR4821',
    'Suresh Reddy',
    'Hyundai',
    'Creta',
    'CAR',
    'DIESEL',
    2021,
    '2021-09-12',
    'Grey',
    48200,
    '2026-09-11',
    'ACTIVE'
),
(
    'TS16ST7392',
    'Ananya Rao',
    'Honda',
    'Activa 6G',
    'MOTORCYCLE',
    'PETROL',
    2022,
    '2022-02-18',
    'Blue',
    21300,
    '2027-02-17',
    'ACTIVE'
),
(
    'AP39UV6154',
    'Ramesh Kumar',
    'Tata Motors',
    'Ace',
    'TRUCK',
    'CNG',
    2019,
    '2019-07-25',
    'White',
    112500,
    '2026-07-24',
    'IN_SERVICE'
),
(
    'TS17WX8246',
    'Meghana Sharma',
    'Kia',
    'Seltos',
    'CAR',
    'HYBRID',
    2024,
    NULL,
    'Black',
    8600,
    NULL,
    'ACTIVE'
),
(
    'TS18YZ3065',
    'Naveen Mehta',
    'Ashok Leyland',
    'Viking',
    'BUS',
    'DIESEL',
    2020,
    '2020-12-10',
    'Red',
    138700,
    '2026-12-09',
    'IN_SERVICE'
);


INSERT INTO vehicles (
    registration_number,
    owner_name,
    manufacturer,
    model,
    vehicle_type,
    fuel_type,
    manufacture_year,
    color,
    odometer_km
)
VALUES (
    'TS13LM2468',
    'Arjun Nair',
    'Ashok Leyland',
    'Viking',
    'BUS',
    'CNG',
    2021,
    'Blue',
    92500
);


INSERT INTO vehicles (
    registration_number,
    owner_name,
    manufacturer,
    model,
    vehicle_type,
    fuel_type,
    manufacture_year,
    color,
    odometer_km
)
VALUES (
    'TS14NP1357',
    'Ravi Kumar',
    'Honda',
    'City',
    'CAR',
    'PETROL',
    2022,
    'Grey',
    -500
);



select * from vehicles;