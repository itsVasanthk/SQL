
CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100),
    year_published YEAR,
    isbn VARCHAR(20) UNIQUE
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT DEFAULT NULL,
    review_date DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

INSERT INTO Members (name, email, phone, address)
VALUES 
('Ravi Kumar', 'ravi@gmail.com', '9876543210', 'Chennai'),
('Meena Rani', 'meena@gmail.com', '9123456789', 'Madurai');


SELECT * FROM Members;

INSERT INTO Books (title, author, publisher, year_published, isbn)
VALUES 
('Database Systems', 'Raghu Ramakrishnan', 'McGraw-Hill', 2021, '9780072465631'),
('Learn SQL', 'John Smith', 'O\'Reilly', 2019, '9781492057611');


SELECT * FROM Books;

INSERT INTO Reviews (member_id, book_id, rating, review_text, review_date)
VALUES
(1, 2, 5, 'Great explanation of relational models.', '2025-08-04'),
(2, 1, 4, NULL, '2025-08-03');
SELECT * FROM Reviews;

UPDATE Members
SET email = 'newemail@example.com'
WHERE member_id = 1;

SELECT * FROM Members;

DELETE FROM Reviews WHERE member_id = 2;

SELECT * FROM Reviews;

