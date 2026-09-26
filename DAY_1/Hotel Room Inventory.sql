create database hotel_db;
use hotel_db;

CREATE TABLE hotel_rooms (
    room_id INT AUTO_INCREMENT,

    room_number VARCHAR(10) NOT NULL,

    room_type ENUM('SINGLE','DOUBLE','DELUXE','SUITE') NOT NULL,

    floor_number TINYINT UNSIGNED NOT NULL,

    bed_count TINYINT UNSIGNED NOT NULL,

    max_occupancy TINYINT UNSIGNED NOT NULL,

    price_per_night DECIMAL(10,2) NOT NULL,

    availability_status ENUM('AVAILABLE','RESERVED','OCCUPIED','MAINTENANCE') NOT NULL DEFAULT 'AVAILABLE',

    has_air_conditioning BOOLEAN NOT NULL DEFAULT TRUE,

    smoking_allowed BOOLEAN NOT NULL DEFAULT FALSE,

    notes VARCHAR(255) NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,

    CONSTRAINT pk_hotel_rooms PRIMARY KEY (room_id),

    CONSTRAINT uq_room_number UNIQUE (room_number),

    CONSTRAINT chk_bed_count CHECK (bed_count >= 1),

    CONSTRAINT chk_max_occupancy CHECK (max_occupancy >= 1),

    CONSTRAINT chk_price_per_night CHECK (price_per_night > 0)
);


INSERT INTO hotel_rooms (
    room_number,
    room_type,
    floor_number,
    bed_count,
    max_occupancy,
    price_per_night,
    availability_status,
    has_air_conditioning,
    smoking_allowed,
    notes
)
VALUES
(
    '101',
    'SINGLE',
    1,
    1,
    1,
    1800.00,
    'AVAILABLE',
    TRUE,
    FALSE,
    'Compact room suitable for one guest'
),
(
    '205',
    'DOUBLE',
    2,
    2,
    2,
    2800.00,
    'OCCUPIED',
    TRUE,
    FALSE,
    'Double bed with city view'
),
(
    '307',
    'DELUXE',
    3,
    2,
    3,
    4200.00,
    'RESERVED',
    TRUE,
    FALSE,
    'Deluxe room with complimentary breakfast'
),
(
    '501',
    'SUITE',
    5,
    2,
    4,
    7500.00,
    'AVAILABLE',
    TRUE,
    FALSE,
    'Large suite with separate living area'
);



INSERT INTO hotel_rooms (
    room_number,
    room_type,
    floor_number,
    bed_count,
    max_occupancy,
    price_per_night
)
VALUES (
    '602',
    'DOUBLE',
    6,
    2,
    0,
    3000.00
);


INSERT INTO hotel_rooms (
    room_number,
    room_type,
    floor_number,
    bed_count,
    max_occupancy,
    price_per_night
)
VALUES (
    '603',
    'DELUXE',
    6,
    2,
    3,
    0.00
);

select * from hotel_rooms;
