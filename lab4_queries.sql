-- 1. CREATE A VIEW that hides sensitive or unnecessary columns
-- Hiding Email and Phone from Borrowers for privacy
CREATE VIEW IF NOT EXISTS BorrowerPublicInfo AS
SELECT BorrowerID, Name
FROM Borrowers;
-- 2. CREATE AN INDEX
-- Create an index on AuthorID to optimize JOINs between Books and Authors
CREATE INDEX IF NOT EXISTS idx_books_authorid ON Books(AuthorID);
-- 3. CREATE AND TEST A TRANSACTION
-- Insert a new borrower, update their phone, then ROLLBACK
BEGIN TRANSACTION;

INSERT INTO Borrowers (Name, Email, Phone)
VALUES ('Test User', 'testuser@example.com', '5559999');

UPDATE Borrowers
SET Phone = '5558888'
WHERE Name = 'Test User';

-- View the changes before rollback
SELECT * FROM Borrowers WHERE Name = 'Test User';

-- ROLLBACK to undo the transaction
ROLLBACK;

-- Confirm rollback (ensure no changes were committed)
SELECT * FROM Borrowers WHERE Name = 'Test User';
-- 4. COMPLEX QUERY: JOIN + SUBQUERY + WHERE
-- Show Borrower name, Book title, Author name, Loan date
-- For books written by UK authors after 1930
SELECT b.Name AS BorrowerName, bk.Title AS BookTitle, a.Name AS AuthorName, l.LoanDate
FROM Loans l
JOIN Borrowers b ON l.BorrowerID = b.BorrowerID
JOIN Books bk ON l.BookID = bk.BookID
JOIN Authors a ON bk.AuthorID = a.AuthorID
WHERE a.AuthorID IN (
    SELECT AuthorID FROM Authors WHERE Country = 'United Kingdom'
)
AND bk.YearPublished > 1930;
