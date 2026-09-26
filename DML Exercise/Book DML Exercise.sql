use book_db;

CREATE TABLE books (
    book_id int AUTO_INCREMENT,
    isbn VARCHAR(13) NOT NULL,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(120) NOT NULL,
    genre VARCHAR(80) NOT NULL,
    publisher VARCHAR(120) NULL,
    publication_year int NOT NULL,
    pages INT  NOT NULL,
    format ENUM('HARDCOVER', 'PAPERBACK', 'EBOOK') NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    copies INT  NOT NULL DEFAULT 0,
    language VARCHAR(50) NOT NULL,
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_books PRIMARY KEY (book_id),
    CONSTRAINT uq_books_isbn UNIQUE (isbn),
    CONSTRAINT chk_books_year CHECK (publication_year >= 1000),
    CONSTRAINT chk_books_pages CHECK (pages > 0),
    CONSTRAINT chk_books_price CHECK (price >= 0)
);




INSERT INTO books 
(isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language) VALUES ('9780134685991', 'Effective Java', 'Joshua Bloch', 'Programming', 'Addison-Wesley', 2018, 416, 'HARDCOVER', 4500.00, 6, 'English');

INSERT INTO books
(isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES ('9780132350884', 'Clean Code', 'Robert C. Martin', 'Programming','Prentice Hall', 2008, 464, 'PAPERBACK', 3200.00, 12, 'English'),
 
('9780262046305', 'Introduction to Algorithms', 'Thomas H. Cormen','Computer Science', 'MIT Press', 2022, 1312, 'HARDCOVER', 6500.00, 4, 'English');


INSERT INTO books
(isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES ('9780000000001', 'The Monsoon Trail', 'Kavya Sen', 'Fiction', NULL, 2025, 288, 'PAPERBACK', 499.00, 20, 'English'),

('9780000000002', 'Data Stories for Beginners', 'Asha Rao', 'Education','Learning House', 2026, 210, 'EBOOK', 299.00, 0, 'English');


INSERT INTO books
(isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES ('9780000000010', 'Invalid Year Book', 'Test Author', 'Fiction','Test Press', 999, 200, 'PAPERBACK', 500.00, 5, 'English');

INSERT INTO books
(isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES ('9780000000011', 'Zero Pages Book', 'Test Author', 'Fiction', 'Test Press', 2025, 0, 'PAPERBACK', 500.00, 5, 'English');
 
 INSERT INTO books (isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES ('9780000000012', 'Negative Price Book', 'Test Author', 'Fiction','Test Press', 2025, 200, 'PAPERBACK', -100.00, 5, 'English');
 
 INSERT INTO books (isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES ('9780000000013', 'Audio Book Test', 'Test Author', 'Education', 'Test Press', 2025, 200, 'AUDIOBOOK', 500.00, 5, 'English');

INSERT INTO books
(isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES('9780134685991', 'Another Effective Java', 'Another Author','Programming', 'Test Press', 2025, 300, 'PAPERBACK', 1000.00, 5, 'English');


UPDATE books SET copies = copies + 10 WHERE title = 'Clean Code';

UPDATE books SET price = ROUND(price * 0.90, 2) WHERE format = 'EBOOK';

UPDATE books SET publisher = 'Riverleaf Press' WHERE isbn = '9780000000001';

UPDATE books SET copies = 15 WHERE isbn = '9780000000002';

UPDATE books SET pages = 0 WHERE isbn = '9780134685991';


DELETE FROM books WHERE isbn = '9780000000001';

INSERT INTO books (isbn, title, author, genre, publisher, publication_year, pages, format, price, copies, language)
VALUES ('9780000000999', 'Temporary Test Book', 'Test Author', 'Testing', 'Test Press', 2026, 100, 'PAPERBACK', 199.00, 1, 'English');

DELETE FROM books WHERE isbn = '9780000000999';


select * from books;