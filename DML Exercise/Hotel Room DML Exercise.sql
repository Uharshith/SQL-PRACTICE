use hotel_db;

CREATE TABLE hotel_room (
    room_id int AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type VARCHAR(20) NOT NULL,
    floor INT NOT NULL,
    beds INT NOT NULL,
    maximum_occupancy INT NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    availability VARCHAR(20) NOT NULL,
    air_conditioning BOOLEAN NOT NULL,
    smoking_allowed BOOLEAN NOT NULL,
    notes VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_floor CHECK (floor > 0),

    CONSTRAINT chk_beds CHECK (beds > 0),

    CONSTRAINT chk_occupancy CHECK (maximum_occupancy > 0),

    CONSTRAINT chk_price CHECK (price_per_night > 0),

    CONSTRAINT chk_availability CHECK (availability IN ('AVAILABLE', 'OCCUPIED','RESERVED','MAINTENANCE'))
);


INSERT INTO hotel_room
(room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES ('101', 'SINGLE', 1, 1, 1, 2500.00, 'AVAILABLE', TRUE, FALSE, NULL);

INSERT INTO hotel_room (room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES ('102', 'DOUBLE', 1, 2, 3, 4200.00, 'OCCUPIED', TRUE, FALSE, 'City view'),
('201', 'DELUXE', 2, 1, 2, 6500.00, 'RESERVED', TRUE, FALSE, 'Balcony');

INSERT INTO hotel_room (room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES ('301', 'SUITE', 3, 2, 4, 12000.00, 'AVAILABLE', TRUE, FALSE, 'Sea view'),
('T99', 'SINGLE', 9, 1, 1, 1000.00, 'MAINTENANCE', FALSE, FALSE, 'Training room');

INSERT INTO hotel_room
(room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES ('401', 'SINGLE', 4, 0, 1, 2500.00, 'AVAILABLE', TRUE, FALSE, NULL);

INSERT INTO hotel_room
(room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES('403', 'SINGLE', 4, 1, 1, 0.00, 'AVAILABLE', TRUE, FALSE, NULL);

INSERT INTO hotel_room (room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES ('404', 'SINGLE', 4, 1, 1, 2500.00, 'CLEANING', TRUE, FALSE, NULL);

INSERT INTO hotel_room (room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES('101', 'DOUBLE', 1, 2, 3, 4000.00, 'AVAILABLE', TRUE, FALSE, NULL);



UPDATE hotel_room SET price_per_night = price_per_night * 1.10 WHERE room_type = 'SUITE';

UPDATE hotel_room SET availability = 'AVAILABLE', notes = 'Cleaning completed' WHERE room_number = '102';

UPDATE hotel_room SET maximum_occupancy = 3,price_per_night = 7000.00 WHERE room_number = '201';

UPDATE hotel_room SET availability = 'MAINTENANCE', notes = 'Scheduled for removal' WHERE room_number = 'T99';

UPDATE hotel_room SET maximum_occupancy = 0 WHERE room_number = '201';

DELETE FROM hotel_room WHERE room_number = 'T99';

INSERT INTO hotel_room (room_number, room_type, floor, beds, maximum_occupancy, price_per_night, availability, air_conditioning, smoking_allowed, notes)
VALUES('TMP1', 'SINGLE', 10, 1, 1, 1500.00, 'AVAILABLE', FALSE, FALSE, 'Temporary room');

DELETE FROM hotel_room WHERE room_number = 'TMP1';

select * from hotel_room;