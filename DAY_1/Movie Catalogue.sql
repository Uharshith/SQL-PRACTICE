create database movie_db;
use movie_db;
CREATE TABLE movies (
    movie_id int AUTO_INCREMENT,

    movie_code VARCHAR(12) NOT NULL,

    title VARCHAR(200) NOT NULL,

    genre VARCHAR(60) NOT NULL,

    original_language VARCHAR(40) NOT NULL,

    release_date DATE NULL,

    duration_minutes SMALLINT UNSIGNED NOT NULL,

    director_name VARCHAR(120) NOT NULL,

    age_certificate ENUM('ALL_AGES','PARENTAL_GUIDANCE','ADULT','UNRATED') NOT NULL DEFAULT 'UNRATED',

    audience_rating DECIMAL(3,1) ,

    production_budget DECIMAL(15,2),

    catalog_status ENUM('UPCOMING','RELEASED','ARCHIVED') NOT NULL DEFAULT 'UPCOMING',

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,

    CONSTRAINT pk_movies PRIMARY KEY (movie_id),

    CONSTRAINT uq_movie_code UNIQUE (movie_code),

    CONSTRAINT chk_duration CHECK (duration_minutes > 0),

    CONSTRAINT chk_audience_rating CHECK ( audience_rating IS NULL OR audience_rating BETWEEN 0.0 AND 10.0 ),

    CONSTRAINT chk_production_budget CHECK ( production_budget IS NULL OR production_budget >= 0.00));
    
    
    
    INSERT INTO movies (
    movie_code,
    title,
    genre,
    original_language,
    release_date,
    duration_minutes,
    director_name,
    age_certificate,
    audience_rating,
    production_budget,
    catalog_status
)
VALUES
(
    'TEL00000001',
    'The Paradise',
    'Action Thriller',
    'Telugu',
    '2026-09-24',
    174,
    'Srikanth Odela',
    'ADULT',
    8.2,
    800000000.00,
    'RELEASED'
),
(
    'TEL00000002',
    'Endgame Encore',
    'Action Adventure',
    'Telugu',
    NULL,
    148,
    'Vikram Reddy',
    'PARENTAL_GUIDANCE',
    NULL,
    NULL,
    'UPCOMING'
),
(
    'TEL00000003',
    'Epic - First Semester',
    'Comedy Drama',
    'Telugu',
    '2026-09-11',
    132,
    'Srinivas Reddy',
    'PARENTAL_GUIDANCE',
    7.4,
    18000000.00,
    'RELEASED'
),
(
    'TEL00000004',
    'Ramba Oorvasi Menaka',
    'Comedy',
    'Telugu',
    '2026-09-04',
    145,
    'Ravi Babu',
    'PARENTAL_GUIDANCE',
    6.9,
    25000000.00,
    'RELEASED'
),
(
    'TEL00000005',
    'Mahendragiri Varahi',
    'Drama Thriller',
    'Telugu',
    '2026-09-11',
    138,
    'Rajasekhar Aningi',
    'ALL_AGES',
    7.1,
    32000000.00,
    'RELEASED'
);


INSERT INTO movies (
    movie_code,
    title,
    genre,
    original_language,
    duration_minutes,
    director_name,
    age_certificate,
    catalog_status
)
VALUES (
    'TEL00000006',
    'Akhanda 2',
    'Action Drama',
    'Telugu',
    155,
    'Boyapati Srinu',
    'ADULT',
    'UPCOMING'
);

INSERT INTO movies (
    movie_code,
    title,
    genre,
    original_language,
    release_date,
    duration_minutes,
    director_name,
    age_certificate,
    audience_rating,
    production_budget,
    catalog_status
)
VALUES (
    'TEL00000007',
    'Goodachari 2',
    'Action Thriller',
    'Telugu',
    '2026-08-14',
    142,
    'Vinay Kumar Sirigineedi',
    'ADULT',
    8.1,
    450000000.00,
    'RELEASED'
);


select * from movies;