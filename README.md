# PLP-WEEK8-DB
Power learn project Week 8 Assignment 

# 📚 Library Management System

## 📖 Project Title
**Library Management System using SQL**

---

## 📝 Description
This project is a fully functional **SQL-based library management system**. It allows for:
- Managing a collection of books 📘
- Tracking library members 🧑‍💼
- Recording borrowing and returning of books 🔄
- Querying available books, borrow history, and user activity 📊

The database is normalized and structured to ensure data integrity and efficiency, supporting future expansion such as fines, book categories, and dashboard reporting.

---

## ⚙️ How to Set Up / Run the Project

### 1. **Create the Database**
```sql
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Books Table
CREATE TABLE Books (
    bookID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(100),
    genre VARCHAR(50),
    yearPublished INT,
    available BOOLEAN
);

-- Users Table
CREATE TABLE Users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    membershipDate DATE
);

-- BorrowRecords Table
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

The ERD 
https://github.com/Moose05/PLP-WEEK8-DB/blob/main/2BFF8767-0FA3-t4F9A-8204-18102BA980BB.png
