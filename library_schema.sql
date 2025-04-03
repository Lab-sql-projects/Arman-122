-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Country TEXT
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    BookID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    AuthorID INTEGER,
    YearPublished INTEGER,
    Genre TEXT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Borrowers table
CREATE TABLE IF NOT EXISTS Borrowers (
    BorrowerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT,
    Phone TEXT
);

-- Create Loans table
CREATE TABLE IF NOT EXISTS Loans (
    LoanID INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID INTEGER,
    BorrowerID INTEGER,
    LoanDate TEXT,
    ReturnDate TEXT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

-- Insert sample data into Authors table
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

-- Insert sample data into Books table
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

-- Insert sample data into Borrowers table
INSERT INTO Borrowers (Name, Email, Phone) VALUES
('Alice Johnson', 'alice@example.com', '555-1234'),
('Bob Smith', 'bob@example.com', '555-5678'),
('Charlie Brown', 'charlie@example.com', '555-9876'),
('David Williams', 'david@example.com', '555-1111'),
('Eva Davis', 'eva@example.com', '555-2222'),
('Frank Moore', 'frank@example.com', '555-3333'),
('Grace Taylor', 'grace@example.com', '555-4444'),
('Henry White', 'henry@example.com', '555-5555'),
('Irene Clark', 'irene@example.com', '555-6666'),
('Jack Adams', 'jack@example.com', '555-7777');

-- Insert sample data into Loans table
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
