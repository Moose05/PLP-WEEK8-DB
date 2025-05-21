/*This is the creation of the database*/ 
CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    bookID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(100),
    genre VARCHAR(50),
    yearPublished INT,
    available BOOLEAN
);
-- This inserts books into the database 

INSERT INTO Books (title, author, genre, yearPublished, available) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, TRUE),
('1984', 'George Orwell', 'Dystopian', 1949, TRUE),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, TRUE),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, FALSE),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, TRUE),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, TRUE),
('Fahrenheit 451', 'Ray Bradbury', 'Science Fiction', 1953, TRUE),
('Jane Eyre', 'Charlotte Brontë', 'Classic', 1847, FALSE),
('The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', 1956, TRUE),
('Moby-Dick', 'Herman Melville', 'Adventure', 1851, FALSE),
('Animal Farm', 'George Orwell', 'Satire', 1945, TRUE),
('Wuthering Heights', 'Emily Brontë', 'Classic', 1847, TRUE),
('Brave New World', 'Aldous Huxley', 'Dystopian', 1932, FALSE),
('Lord of the Flies', 'William Golding', 'Allegory', 1954, TRUE),
('Crime and Punishment', 'Fyodor Dostoevsky', 'Philosophical', 1866, TRUE),
('The Alchemist', 'Paulo Coelho', 'Fiction', 1988, TRUE),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 1997, TRUE),
('The Kite Runner', 'Khaled Hosseini', 'Drama', 2003, FALSE),
('The Book Thief', 'Markus Zusak', 'Historical', 2005, TRUE),
('The Da Vinci Code', 'Dan Brown', 'Thriller', 2003, TRUE);


-- We add users that use the Library
/*Adding users*/
CREATE TABLE Users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    membershipDate DATE
);
-- We create borrow records 
CREATE TABLE BorrowRecords (
    recordID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    bookID INT,
    borrowDate DATE,
    returnDate DATE,
    returned BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (bookID) REFERENCES Books(bookID)
);

INSERT INTO BorrowRecords (userID, bookID, borrowDate, returnDate, returned) VALUES
(1, 3, '2024-05-01', '2024-05-10', TRUE),
(2, 5, '2024-05-03', NULL, FALSE),
(3, 7, '2024-05-04', NULL, FALSE),
(4, 10, '2024-05-02', '2024-05-14', TRUE),
(5, 1, '2024-05-05', NULL, FALSE);


SELECT u.fullName, COUNT(br.recordID) AS booksBorrowed
FROM Users u
LEFT JOIN BorrowRecords br ON u.userID = br.userID
GROUP BY u.fullName;












