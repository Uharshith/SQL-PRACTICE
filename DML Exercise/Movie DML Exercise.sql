use movie_db;

CREATE TABLE movie (
    id INT AUTO_INCREMENT,
    movie_code VARCHAR(20) NOT NULL,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    language VARCHAR(50) NOT NULL,
    release_date DATE NULL,
    duration INT NOT NULL,
    director VARCHAR(100) NOT NULL,
    certificate ENUM('ALL_AGES','PARENTAL_GUIDANCE','ADULT','UNRATED') NOT NULL,
    rating DECIMAL(3,1) NULL,
    budget DECIMAL(15,2) NULL,
    status ENUM('RELEASED','UPCOMING','ARCHIVED') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_movies PRIMARY KEY (id),

    CONSTRAINT uk_movies_movie_code UNIQUE (movie_code),

    CONSTRAINT chk_movies_duration CHECK (duration > 0),

    CONSTRAINT chk_movies_rating CHECK (rating IS NULL OR rating BETWEEN 0 AND 10),

    CONSTRAINT chk_movies_budget CHECK (budget IS NULL OR budget >= 0)
);


INSERT INTO movie
(movie_code, title, genre, language, release_date,
 duration, director, certificate, rating, budget, status)
VALUES
(
    'MOV26001',
    'River Beyond the Hills',
    'Drama',
    'Hindi',
    '2026-01-16',
    132,
    'Anika Verma',
    'PARENTAL_GUIDANCE',
    8.2,
    35000000.00,
    'RELEASED'
);

INSERT INTO movie
(movie_code, title, genre, language, release_date,
 duration, director, certificate, rating, budget, status)
VALUES
(
    'MOV26002',
    'Orbit Seven',
    'Science Fiction',
    'English',
    '2026-05-22',
    148,
    'Daniel Cole',
    'PARENTAL_GUIDANCE',
    7.6,
    120000000.00,
    'RELEASED'
),
(
    'MOV26003',
    'Little Mango Tree',
    'Animation',
    'Telugu',
    '2026-07-10',
    96,
    'Ravi Teja',
    'ALL_AGES',
    8.5,
    18000000.00,
    'RELEASED'
);

INSERT INTO movie
(movie_code, title, genre, language, release_date,
 duration, director, certificate, rating, budget, status)
VALUES
(
    'MOV27001',
    'Echoes of Tomorrow',
    'Thriller',
    'English',
    NULL,
    125,
    'Maya Sen',
    'UNRATED',
    NULL,
    NULL,
    'UPCOMING'
),
(
    'MOV24005',
    'Old Harbour',
    'Mystery',
    'Bengali',
    '2024-02-09',
    118,
    'Sayan Dutta',
    'ADULT',
    6.9,
    22000000.00,
    'ARCHIVED'
);


INSERT INTO movie
(movie_code, title, genre, language, release_date,
 duration, director, certificate, rating, budget, status)
VALUES
(
    'MOV-INVALID-01',
    'Invalid Duration',
    'Drama',
    'Hindi',
    '2026-01-01',
    0,
    'Test Director',
    'ALL_AGES',
    7.0,
    1000000.00,
    'RELEASED'
);


INSERT INTO movie
(movie_code, title, genre, language, release_date,
 duration, director, certificate, rating, budget, status)
VALUES
(
    'MOV-INVALID-03',
    'Negative Budget',
    'Drama',
    'Hindi',
    '2026-01-01',
    120,
    'Test Director',
    'ALL_AGES',
    7.0,
    -500000.00,
    'RELEASED'
);


INSERT INTO movie
(movie_code, title, genre, language, release_date,
 duration, director, certificate, rating, budget, status)
VALUES
(
    'MOV-INVALID-03',
    'Negative Budget',
    'Drama',
    'Hindi',
    '2026-01-01',
    120,
    'Test Director',
    'ALL_AGES',
    7.0,
    -500000.00,
    'RELEASED'
);

INSERT INTO movie
(movie_code, title, genre, language, release_date,
 duration, director, certificate, rating, budget, status)
VALUES
(
    'MOV-INVALID-04',
    'Invalid Certificate',
    'Drama',
    'Hindi',
    '2026-01-01',
    120,
    'Test Director',
    'TEEN',
    7.0,
    1000000.00,
    'RELEASED'
);

UPDATE movie SET release_date = '2027-03-19', certificate = 'PARENTAL_GUIDANCE' WHERE movie_code = 'MOV27001';

UPDATE movie SET rating = 8.8 WHERE movie_code = 'MOV26003';

UPDATE movie SET budget = budget * 1.05 WHERE genre = 'Science Fiction' AND budget IS NOT NULL;

UPDATE movie SET status = 'ARCHIVED' WHERE status = 'RELEASED' AND release_date < '2025-01-01';

UPDATE movie SET rating = 12.0 WHERE movie_code = 'MOV26001';


SELECT * FROM movie WHERE movie_code = 'MOV24005';

DELETE FROM movie WHERE movie_code = 'MOV24005';

SELECT * FROM movie WHERE movie_code = 'MOV24005';

INSERT INTO movie (movie_code, title, genre, language, release_date, duration, director, certificate, rating, budget, status) VALUES ('MOV-TEMP-01', 'Temporary Movie', 'Drama', 'English', '2026-09-26', 100, 'Temporary Director', 'ALL_AGES', 7.0, 5000000.00, 'RELEASED');

DELETE FROM movie WHERE movie_code = 'MOV-TEMP-01';

SELECT * FROM movie;