use vehicle_db;

CREATE TABLE vehicle (
    vehicle_id int AUTO_INCREMENT,
    registration_number VARCHAR(20) NOT NULL,
    owner_name VARCHAR(120) NOT NULL,
    manufacturer VARCHAR(80) NOT NULL,
    model VARCHAR(80) NOT NULL,
    vehicle_type ENUM('CAR', 'MOTORCYCLE', 'TRUCK', 'VAN', 'BUS') NOT NULL,
    fuel_type ENUM('PETROL', 'DIESEL', 'ELECTRIC') NOT NULL,
    manufacture_year SMALLINT UNSIGNED NOT NULL,
    purchase_date DATE NULL,
    colour VARCHAR(50) NOT NULL,
    odometer_km INT UNSIGNED NOT NULL DEFAULT 0,
    insurance_expiry DATE NULL,
    status ENUM('ACTIVE', 'IN_SERVICE', 'SCRAPPED') NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_vehicles PRIMARY KEY (vehicle_id),
    CONSTRAINT uq_vehicle_registration UNIQUE (registration_number),
    CONSTRAINT chk_vehicle_year CHECK (manufacture_year >= 1900),
    CONSTRAINT chk_vehicle_odometer CHECK (odometer_km >= 0)
);

DELETE FROM vehicle;


INSERT INTO vehicle(registration_number, owner_name, manufacturer, model,vehicle_type, fuel_type, manufacture_year, purchase_date,colour, odometer_km, insurance_expiry, status)
VALUES('KA01AB1234', 'Arjun Rao', 'Hyundai', 'Creta','CAR', 'DIESEL', 2022, '2022-08-15','White', 34000, '2027-08-14', 'ACTIVE');

INSERT INTO vehicle (registration_number, owner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, colour, odometer_km, insurance_expiry, status)
VALUES ('TS09CD5678', 'Meera Iyer', 'Honda', 'Activa 6G', 'MOTORCYCLE', 'PETROL', 2021, NULL,'Red', 18500, '2026-12-31', 'ACTIVE'),

('MH12EF9012', 'Rohan Logistics', 'Tata', 'Ultra', 'TRUCK', 'DIESEL', 2020, '2020-03-10', 'Blue', 145000, '2026-10-15', 'IN_SERVICE');

INSERT INTO vehicle (registration_number, owner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, colour, odometer_km, insurance_expiry, status)
VALUES ('DL03GH3456', 'Nisha Kapoor', 'Mahindra', 'eSupro', 'VAN', 'ELECTRIC', 2024, '2024-02-01', 'Silver', 22000, NULL, 'ACTIVE'),
('TN10JK7890', 'Training Transport', 'Ashok Leyland', 'Viking', 'BUS', 'DIESEL', 2010, NULL, 'Yellow', 480000, NULL, 'SCRAPPED');


INSERT INTO vehicle
(registration_number, owner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, colour, odometer_km, insurance_expiry, status)
VALUES
('KA01XX1111', 'Test Owner', 'Test Motors', 'Test Model', 'CAR', 'PETROL', 2025, NULL, 'Black', -500, NULL, 'ACTIVE');


INSERT INTO vehicle
(registration_number, owner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, colour, odometer_km, insurance_expiry, status)
VALUES ('KA01XX2222', 'Test Owner', 'Test Motors', 'Test SUV', 'SUV', 'PETROL', 2025, NULL, 'Black', 1000, NULL, 'ACTIVE');

INSERT INTO vehicle
(registration_number, owner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, colour, odometer_km, insurance_expiry, status)
VALUES ('KA01XX3333', 'Test Owner', 'Test Motors', 'Hydrogen Model', 'CAR', 'HYDROGEN', 2025, NULL, 'Black', 1000, NULL, 'ACTIVE');

INSERT INTO vehicle
(registration_number, owner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, colour, odometer_km, insurance_expiry, status)
VALUES ('KA01AB1234', 'Duplicate Owner', 'Test Motors', 'Test Model', 'CAR', 'PETROL', 2025, NULL, 'Black', 1000, NULL, 'ACTIVE');

UPDATE vehicle SET odometer_km = odometer_km + 750 WHERE registration_number = 'KA01AB1234';

UPDATE vehicle SET insurance_expiry = '2027-02-01' WHERE registration_number = 'DL03GH3456';

UPDATE vehicle SET status = 'ACTIVE' WHERE registration_number = 'MH12EF9012' AND status = 'IN_SERVICE';

UPDATE vehicle SET colour = 'Matte Red' WHERE registration_number = 'TS09CD5678';

UPDATE vehicle SET odometer_km = odometer_km + 1000 WHERE status = 'ACTIVE';

DELETE FROM vehicle WHERE registration_number = 'TN10JK7890' AND status = 'SCRAPPED';

INSERT INTO vehicle
(registration_number, owner_name, manufacturer, model, vehicle_type, fuel_type, manufacture_year, purchase_date, colour, odometer_km, insurance_expiry, status)
VALUES ('TEST00TMP01', 'Temporary Test Owner', 'Test Motors', 'Temp Model','CAR', 'PETROL', 2026, '2026-01-01','Black', 100, '2027-01-01', 'ACTIVE');


DELETE FROM vehicle WHERE registration_number = 'TEST00TMP01';


select * from vehicle;

