-- DROP TABLES IF THEY EXIST (for resetting schema)
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Borrowers;

-- 1. AUTHORS TABLE
CREATE TABLE Authors (
    AuthorID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Country TEXT
);

-- 2. BOOKS TABLE
CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL UNIQUE,  -- UNIQUE title constraint
    AuthorID INTEGER,
    YearPublished INTEGER CHECK (YearPublished > 0),  -- CHECK constraint for valid year
    Genre TEXT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- 3. BORROWERS TABLE
CREATE TABLE Borrowers (
    BorrowerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT,
    Phone TEXT CHECK (LENGTH(Phone) >= 8 AND LENGTH(Phone) <= 15)  -- CHECK constraint for phone length
);

-- 4. LOANS TABLE
CREATE TABLE Loans (
    LoanID INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID INTEGER,
    BorrowerID INTEGER,
    LoanDate TEXT,
    ReturnDate TEXT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);
-- Insert data into Authors
INSERT INTO Authors (Name, Country) VALUES
('J.K. Rowling', 'United Kingdom'),
('George Orwell', 'United Kingdom'),
('Harper Lee', 'United States'),
('J.R.R. Tolkien', 'United Kingdom'),
('Agatha Christie', 'United Kingdom'),
('Stephen King', 'United States'),
('J.D. Salinger', 'United States'),
('Mark Twain', 'United States'),
('F. Scott Fitzgerald', 'United States'),
('Jane Austen', 'United Kingdom');

-- Insert data into Books
INSERT INTO Books (Title, AuthorID, YearPublished, Genre) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy'),
('1984', 2, 1949, 'Dystopian'),
('To Kill a Mockingbird', 3, 1960, 'Fiction'),
('The Hobbit', 4, 1937, 'Fantasy'),
('Murder on the Orient Express', 5, 1934, 'Mystery'),
('The Shining', 6, 1977, 'Horror'),
('The Catcher in the Rye', 7, 1951, 'Fiction'),
('Adventures of Huckleberry Finn', 8, 1884, 'Fiction'),
('The Great Gatsby', 9, 1925, 'Fiction'),
('Pride and Prejudice', 10, 1813, 'Romance');

-- Insert data into Borrowers with valid phone numbers (8 to 15 digits)
INSERT INTO Borrowers (Name, Email, Phone) VALUES
('Alice Johnson', 'alice@example.com', '5551234567'),
('Bob Smith', 'bob@example.com', '5555678123'),
('Charlie Brown', 'charlie@example.com', '5559876432'),
('David Williams', 'david@example.com', '5551111222'),
('Eva Davis', 'eva@example.com', '5552222333'),
('Frank Moore', 'frank@example.com', '5553333444'),
('Grace Taylor', 'grace@example.com', '5554444555'),
('Henry White', 'henry@example.com', '5555555666'),
('Irene Clark', 'irene@example.com', '5556666777'),
('Jack Adams', 'jack@example.com', '5557777888');

-- Insert data into Loans
INSERT INTO Loans (BookID, BorrowerID, LoanDate, ReturnDate) VALUES
(1, 1, '2025-03-20', '2025-04-20'),
(2, 2, '2025-03-21', '2025-04-21'),
(3, 3, '2025-03-22', '2025-04-22'),
(4, 4, '2025-03-23', '2025-04-23'),
(5, 5, '2025-03-24', '2025-04-24'),
(6, 6, '2025-03-25', '2025-04-25'),
(7, 7, '2025-03-26', '2025-04-26'),
(8, 8, '2025-03-27', '2025-04-27'),
(9, 9, '2025-03-28', '2025-04-28'),
(10, 10, '2025-03-29', '2025-04-29');
