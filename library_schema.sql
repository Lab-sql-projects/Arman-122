-- Create Authors table
CREATE TABLE Authors (
    AuthorID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Country TEXT
);

-- Create Books table
CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    AuthorID INTEGER,
    YearPublished INTEGER,
    Genre TEXT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Borrowers table
CREATE TABLE Borrowers (
    BorrowerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT,
    Phone TEXT
);

-- Create Loans table
CREATE TABLE Loans (
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
('J.R.R. Tolkien', 'United Kingdom');

-- Insert sample data into Books table
INSERT INTO Books (Title, AuthorID, YearPublished, Genre) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy'),
('1984', 2, 1949, 'Dystopian'),
('To Kill a Mockingbird', 3, 1960, 'Fiction'),
('The Hobbit', 4, 1937, 'Fantasy');

-- Insert sample data into Borrowers table
INSERT INTO Borrowers (Name, Email, Phone) VALUES
('Alice Johnson', 'alice@example.com', '555-1234'),
('Bob Smith', 'bob@example.com', '555-5678'),
('Charlie Brown', 'charlie@example.com', '555-9876');

-- Insert sample data into Loans table
INSERT INTO Loans (BookID, BorrowerID, LoanDate, ReturnDate) VALUES
(1, 1, '2025-03-20', '2025-04-20'),
(2, 2, '2025-03-21', '2025-04-21'),
(3, 3, '2025-03-22', '2025-04-22');
