create database book_db;
use book_db;
CREATE TABLE BOOK (
    book_id INT AUTO_INCREMENT NOT NULL,
    isbn CHAR(13) NOT NULL,                             
    title VARCHAR(255) NOT NULL,
    author_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    publisher VARCHAR(100) NULL,                        
    publication_year INT NOT NULL,
    page_count INT NOT NULL,
    book_format VARCHAR(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    copies_available INT NOT NULL,
    language VARCHAR(50) NOT NULL DEFAULT 'English',   
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 

    CONSTRAINT pk_book_id PRIMARY KEY (book_id),
    CONSTRAINT uk_isbn UNIQUE (isbn),

    CONSTRAINT chk_isbn_length CHECK (CHAR_LENGTH(isbn) = 13),
    CONSTRAINT chk_publication_year CHECK (publication_year BETWEEN 1000 AND 2100),
    CONSTRAINT chk_page_count CHECK (page_count > 0),
    CONSTRAINT chk_price CHECK (price >= 0),
    CONSTRAINT chk_copies_available CHECK (copies_available >= 0),
    CONSTRAINT chk_book_format CHECK (book_format IN ('HARDCOVER', 'PAPERBACK', 'EBOOK'))
);


INSERT INTO BOOK (
    isbn, 
    title, 
    author_name, 
    genre, 
    publisher, 
    publication_year, 
    page_count, 
    book_format, 
    price, 
    copies_available, 
    language
) 
VALUES 
('9780134685991', 'Java', 'James Gosling', 'Programming', 'Addison-Wesley', 2018, 416, 'PAPERBACK', 45.00, 12, 'English'),
('9780596009205', 'Head First Design Patterns', 'Eric Freeman', 'Programming', 'O''Reilly Media', 2004, 694, 'EBOOK', 39.99, 8, 'English');


select * from book;