CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    bio TEXT
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    genre VARCHAR(100),
    published_year INT,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    membership_date DATE
);

CREATE TABLE BorrowedBooks (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE
);


INSERT INTO Authors (name, bio) VALUES
('J.K. Rowling', 'British author, best known for the Harry Potter series.'),
('George Orwell', 'English novelist, famous for 1984 and Animal Farm.'),
('J.R.R. Tolkien', 'British writer, best known for The Lord of the Rings.'),
('Harper Lee', 'American novelist, author of To Kill a Mockingbird.'),
('F. Scott Fitzgerald', 'American novelist, known for The Great Gatsby.');

INSERT INTO Books (title, author_id, genre, published_year, available_copies) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 1997, 10),
('1984', 2, 'Dystopian', 1949, 8),
('Animal Farm', 2, 'Political Satire', 1945, 6),
('The Hobbit', 3, 'Fantasy', 1937, 7),
('The Lord of the Rings', 3, 'Fantasy', 1954, 5),
('To Kill a Mockingbird', 4, 'Fiction', 1960, 4),
('The Great Gatsby', 5, 'Classic', 1925, 6);

INSERT INTO Members (name, email, phone, membership_date) VALUES
('Ali', 'ali@example.com', '1234567890', '2023-01-15'),
('Balasaheb', 'bal@example.com', '9876543210', '2022-11-20'),
('Tukaram', 'Tukya@example.com', '5678901234', '2023-03-10'),
('Dnyaneshwar', 'dnyanu@example.com', '3456789012', '2022-12-05');


INSERT INTO BorrowedBooks (book_id, member_id, borrow_date) VALUES
(1, 1, '2024-02-10'),
(2, 2, '2024-02-08'),
(4, 3, '2024-02-07'),
(7, 4, '2024-02-05');

INSERT INTO Books (title, author_id, genre, published_year, available_copies) 
VALUES ('SEVEN', 4, 'Thriller', 1925, 2);



SELECT available_copies FROM Books WHERE book_id = 5;

INSERT INTO BorrowedBooks (book_id, member_id, borrow_date) 
VALUES (5, 2, DATE);

UPDATE Books 
SET available_copies = available_copies - 1
WHERE book_id = 5;


SELECT * FROM Books;
SELECT * FROM Authors;
SELECT * FROM BorrowedBooks;
SELECT * FROM Members;