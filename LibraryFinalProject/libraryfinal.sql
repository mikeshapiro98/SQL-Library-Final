USE LibraryDB 


/********************************************************************************
							*TABLE CREATION*
********************************************************************************/


CREATE TABLE tbl_publisher(
	publisher_id INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
	publisher_name VARCHAR(50) UNIQUE NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_book(
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(50) NOT NULL ,
	book_publisher VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,
);

/* sp_rename 'tbl_book.publisher_name', 'book_publisher', 'COLUMN'; */

CREATE TABLE tbl_book_authors(
	author_id INT PRIMARY KEY  NOT NULL IDENTITY (1,1),
	author_book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL 
);

/*sp_rename 'tbl_book_authors.book_id', 'author_book_id', 'COLUMN'; */

CREATE TABLE tbl_book_loans(
	loans_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	loans_book_id INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	due_date DATE NOT NULL
);


/*
sp_rename 'tbl_book_loans.book_id', 'loans_book_id', 'COLUMN'; 
sp_rename 'tbl_book_loans.branch_id', 'loans_branch_id', 'COLUMN'; 
sp_rename 'tbl_book_loans.card_no', 'loans_card_no', 'COLUMN'; 
*/

CREATE TABLE tbl_book_copies(
	copies_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	copies_book_id INT NOT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_branch_id INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	no_of_copies INT NOT NULL
);
/*
sp_rename 'tbl_book_copies.book_id', 'copies_book_id', 'COLUMN'; 
sp_rename 'tbl_book_copies.branch_id', 'copies_branch_id', 'COLUMN'; 
*/


CREATE TABLE tbl_borrower(
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL
);



CREATE TABLE tbl_library_branch(
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL


);



SELECT * FROM tbl_book;
SELECT * FROM tbl_book_authors;
SELECT * FROM tbl_publisher;
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_library_branch;


/********************************************************************************
							*TABLE INSERTSION*
********************************************************************************/

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Green Books', '513 Turquoise St.', '555-212-5895'),
	('Red Books', '717 Maroon St.', '777-202-2495'),
	('Blue Books', '45 Royal St.', '531-794-1303'),
	('White Books', '888 Eggshell St.', '512-213-9522'),
	('Pink Books', '100 Magenta St.', '333-241-0009')
;


INSERT INTO tbl_book
	(title, book_publisher)
	VALUES
	('Cujo', 'Green Books'),
	('The Stand', 'Green Books'),
	('The Great Gatsby', 'Green Books'),
	('To The Lighthouse', 'Green Books'),
	('War and Peace', 'Red Books'),
	('Ulysses', 'Red Books'),
	('The Odyssey', 'Red Books'),
	('Moby Dick', 'Red Books'),
	('Hamlet', 'Blue Books'),
	('The Adventures of Huckleberry Finn', 'Blue Books'),
	('The Iliad', 'Blue Books'),
	('Madame Bovary', 'Blue Books'),
	('Crime and Punishment', 'White Books'),
	('Pride and Prejudice', 'White Books'),
	('Lolita', 'White Books'),
	('Nineteen Eighty Four', 'White Books'),
	('Atlas Shrugs', 'Pink Books'),
	('Alice In Wonderland', 'Pink Books'),
	('Great Expectations', 'Pink Books'),
	('The Catcher In The Rye', 'Pink Books'),
	('The Lost Tribe', 'Pink Books')
;




INSERT INTO tbl_book_authors
	(author_book_id, author_name)
	VALUES
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'F. Scott Fitzgerald'),
	(5, 'Virginia Woolf'),
	(6, 'Leo Tolstoy'),
	(7, 'James Joyce'),
	(8, 'Homer'),
	(9, 'Herman Melville'),
	(10, 'William Shakespeare'),
	(11, 'Mark Twain'),
	(12, 'Homer'),
	(13, 'Gustave Flaubert'),
	(14, 'Fyodor Dostoyevsky'),
	(15, 'Jane Austen'),
	(16, 'Vladimir Nabokov'),
	(17, 'George Orwell'),
	(18, 'Ayn Rand'),
	(19, 'Lewis Carroll'),
	(20, 'Charles Dickens'),
	(21, 'J.D. Salinger'),
	(22, 'Mark Lee')
;



INSERT INTO tbl_book_loans
	(loans_book_id, loans_branch_id, loans_card_no, date_out, due_date)
	VALUES
	( 2, 1, 1, '2018-04-15','2018-12-31'),
	( 12, 1, 1,'2018-03-01','2018-04-16'),
	( 13, 1, 1,'2018-03-02','2018-04-17'),
	( 14, 1, 1,'2018-03-03','2018-04-18'),
	( 15, 1, 1,'2018-03-04','2018-04-19'),
	( 16, 1, 1,'2018-03-05','2018-04-20'),
	( 17, 1, 2,'2018-04-03','2018-04-21'),
	( 18, 1, 2,'2018-04-03','2018-04-22'),
	( 19, 1, 2,'2018-03-05','2018-04-23'),
	( 20, 1, 2,'2018-04-11','2018-04-24'),
	( 21, 1, 2,'2018-04-03','2018-04-25'),
	( 22, 1, 2,'2018-02-21','2018-04-26'),
	( 12, 1, 2,'2018-04-01','2018-04-27'),
	( 13, 1, 3,'2018-04-03','2018-04-28'),
	( 14, 1, 3,'2018-04-11','2018-04-29'),
	( 15, 1, 3,'2018-04-10','2018-04-30'),
	( 16, 1, 3,'2018-02-21','2018-04-16'),
	( 17, 1, 3,'2018-03-15','2018-04-23'),
	( 18, 1, 3,'2018-03-05','2018-04-22'),
	( 2, 2, 4,'2018-04-06','2018-04-30'),
	( 3, 2, 4,'2018-04-11','2018-05-12'),
	( 4, 2, 4,'2018-03-16','2018-06-01'),
	( 5, 2, 4,'2018-03-17','2018-05-02'),
	( 6, 2, 4,'2018-04-06','2018-07-01'),
	( 7, 2, 5,'2018-03-18','2018-06-11'),
	( 8, 2, 5,'2018-04-06','2018-09-10'),
	( 9, 2, 5,'2018-03-09','2018-05-05'),
	( 10, 2, 5,'2018-04-11','2018-06-13'),
	( 11, 2, 6,'2018-03-19','2018-08-04'),
	( 2, 2, 6,'2018-04-03','2018-05-02'),
	( 12, 3, 6,'2018-04-01','2018-05-02'),
	( 13, 3, 6,'2018-04-10','2018-05-05'),
	( 14, 3, 7,'2018-03-20','2018-04-24'),
	( 15, 3, 7,'2018-03-05','2018-04-26'),
	( 16, 3, 7,'2018-03-21','2018-04-23'),
	( 17, 3, 7,'2018-02-21','2018-06-30'),
	( 18, 3, 8,'2018-04-11','2018-04-30'),
	( 19, 3, 8,'2018-03-29','2018-05-30'),
	( 20, 3, 8,'2018-04-03','2018-06-07'),
	( 21, 3, 8,'2018-04-01','2018-05-05'),
	( 22, 3, 9,'2018-03-05','2018-04-21'),
	( 12, 3, 9,'2018-04-10','2018-06-06'),
	( 2, 4, 9,'2018-04-03','2018-07-07'),
	( 3, 4, 9,'2018-04-08','2018-06-05'),
	( 4, 4, 9,'2018-02-28','2018-09-30'),
	( 5, 4, 10,'2018-04-11','2018-04-29'),
	( 6, 4, 10,'2018-04-12','2018-05-29'),
	( 7, 4, 10,'2018-04-03','2018-05-30'),
	( 8, 4, 11,'2018-04-01','2018-04-21'),
	( 9, 4, 11,'2018-03-05','2018-04-20'),
	( 10, 4, 11,'2018-02-21','2018-05-03')
;

/***********TEST
SELECT 
a1.loans_book_id, a2.branch_name
FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.loans_id
;

**************/

INSERT INTO tbl_book_copies
	(copies_book_id, copies_branch_id, no_of_copies)
	VALUES
	(2, 1, 4),
	(12, 1, 2),
	(13, 1, 4),
	(14, 1, 3),
	(15, 1, 7),
	(16, 1, 6),
	(17, 1, 4),
	(18, 1, 3),
	(19, 1, 5),
	(20, 1, 2),
	(21, 1, 2),
	(22, 1, 4),
	(2, 2, 2),
	(3, 2, 5),
	(4, 2, 9),
	(5, 2, 8),
	(6, 2, 3),
	(7, 2, 2),
	(8, 2, 8),
	(9, 2, 9),
	(10, 2, 7),
	(11, 2, 5),
	(12, 3, 3),
	(13, 3, 4),
	(14, 3, 6),
	(15, 3, 9),
	(16, 3, 2),
	(17, 3, 5),
	(18, 3, 6),
	(19, 3, 4),
	(20, 3, 8),
	(21, 3, 6),
	(22, 3, 4),
	(2, 4, 3),
	(3, 4, 5),
	(4, 4, 7),
	(5, 4, 6),
	(6, 4, 5),
	(7, 4, 4),
	(8, 4, 9),
	(9, 4, 2),
	(10, 4, 2),
	(11, 4, 2),
	(12, 4, 6)
	
;



INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Luke Evans', '1313 Dead End Drive', '468-579-2234'),
	('Mandy Clouse', '121 Coocoo Nest', '234-674-3445'),
	('Kendra Cutter', '453 Estevez Road', '224-223-3345'),
	('He Mann', '234 Broadway St.', '245-345-4566'),
	('Michelle Kissinger', '339 Boardwalk Ave.', '345-556-3344'),
	('Vanner Sharp', '700 E. Lakewood', '467-556-5567'),
	('Wonder Woman', '54 Centenial', '321-345-1131'),
	('Jack Ellen', '159 Colorado St.', '345-433-4346'),
	('James Sunderland', '666 Silent Hill', '666-666-6666'),
	('Mary Sunderland', '564 Kats Drive', '742-467-3456'),
	('Jill Valentine', '253 Racoon City', '356-468-2355'),
	('Resident Evil', 'PO BOX Unmebrella Corporation', '645-234-6783'),
	('Andrew Ryan', '17 Rapture', '303-543-4573')
;

	

	

INSERT INTO tbl_library_branch 
	(branch_name, branch_address)
	VALUES
	('Sharpstown','451 Farenheight St.'),
	('Central','1984 Distopia Ave.'),
	('Northville','2 Moons Blvd.'),
	('Southberg','39 Steps St.')
;

/*

DELETE FROM tbl_library_branch
/*Could specify a where if deleting something specific*/
DBCC CHECKIDENT('tbl_library_branch', RESEED, 0)
/*This restarts the primary key back to 0*/


*/
/********************************************************************************
							     *QUERIES*
********************************************************************************/

/* SELECT * FROM tbl_book; */
/* SELECT * FROM tbl_book_authors; */
/* SELECT * FROM tbl_publisher; */
/* SELECT * FROM tbl_book_loans; */ 
/* SELECT * FROM tbl_book_copies; */
/* SELECT * FROM tbl_borrower; */
/* SELECT * FROM tbl_library_branch; */

/* TEST
CREATE PROCEDURE library_p1_test
AS
BEGIN
SELECT * from tbl_publisher
;
END 

EXEC library_p1_test
*/

CREATE PROCEDURE library_sp_1
AS
BEGIN

SELECT 
a1.no_of_copies AS'Number Of Copies' , a2.title AS 'Book Title', a3.branch_name AS 'Branch Location'
	
FROM tbl_book_copies a1
INNER JOIN tbl_book a2 ON a2.book_id= a1.copies_book_id  
INNER JOIN tbl_library_branch a3 ON a3.branch_id = a1.copies_branch_id 
WHERE
title='The Lost Tribe'
AND
branch_name = 'Sharpstown'
;
END 

/* EXEC library_sp_1 */

CREATE PROCEDURE library_sp_2
AS
BEGIN
SELECT
a1.no_of_copies AS 'Number of Copies', a2.title AS 'Boot Title', a3.branch_name AS 'Branch Location'
FROM tbl_book_copies a1
INNER JOIN tbl_book a2 ON a2.book_id = a1.copies_book_id
INNER JOIN tbl_library_branch a3 ON a3.branch_id = a1.copies_branch_id
WHERE
title = 'The Lost Tribe'
;
END
 
/* EXEC library_sp_2 */


CREATE PROCEDURE library_sp_3
AS
BEGIN
SELECT
a2.loans_card_no AS'Books Checked Out', a1.borrower_name AS 'Name'
FROM tbl_borrower a1 
FULL OUTER JOIN tbl_book_loans a2 ON a2.loans_card_no = a1.card_no
WHERE
loans_card_no IS NULL
;
END 

/* EXEC library_sp_3 */ 
 

CREATE PROCEDURE library_sp_4
AS
BEGIN
SELECT
a1.due_date AS'Due Date', a2.branch_name AS'Branch Name', a3.title AS'Book Title', a4.borrower_name AS'Borrowers Name', a4.borrower_address AS'Borrowers Address'
FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.loans_branch_id
INNER JOIN tbl_book a3 ON a3.book_id = a1.loans_id
INNER JOIN tbl_borrower a4 ON a4.card_no = a1.loans_card_no

WHERE
branch_name='Sharpstown'
AND
due_date = CONVERT (date, GETDATE())
;

END

/* EXEC library_sp_4 */

CREATE PROCEDURE library_sp_5
AS
BEGIN
SELECT
COUNT(loans_branch_id) AS 'Number Of Books Checked Out', a2.branch_name AS 'Branch Name'
FROM tbl_book_loans a1 
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.loans_branch_id
WHERE loans_branch_id = 1
GROUP BY branch_name

;

SELECT
COUNT(loans_branch_id) AS 'Number Of Books Checked Out', a2.branch_name AS 'Branch Name'
FROM tbl_book_loans a1 
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.loans_branch_id
WHERE loans_branch_id = 2
GROUP BY branch_name

;

SELECT
COUNT(loans_branch_id) AS 'Number Of Books Checked Out', a2.branch_name AS 'Branch Name'
FROM tbl_book_loans a1 
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.loans_branch_id
WHERE loans_branch_id = 3
GROUP BY branch_name

;
SELECT
COUNT(loans_branch_id) AS 'Number Of Books Checked Out', a2.branch_name AS 'Branch Name'
FROM tbl_book_loans a1 
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.loans_branch_id
WHERE loans_branch_id = 4
GROUP BY branch_name

;

END

/* EXEC library_sp_5 */

CREATE PROCEDURE library_sp_6
AS
BEGIN
SELECT
COUNT(loans_card_no) AS 'Number Of Books Checked Out', a2.borrower_name AS 'Borrowers Name', a2.borrower_address AS 'Borrowers Address'

FROM tbl_book_loans a1
INNER JOIN tbl_borrower a2 ON a2.card_no = a1.loans_card_no
GROUP BY borrower_name, borrower_address
HAVING COUNT(loans_card_no) > 5
;
END 

/* EXEC library_sp_6 */

CREATE PROCEDURE library_sp_7
AS
BEGIN
SELECT
a1.no_of_copies, a2.branch_name, a3.title, a4.author_name
FROM tbl_book_copies a1
INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.copies_branch_id
INNER JOIN tbl_book a3 ON a3.book_id = a1.copies_book_id
INNER JOIN tbl_book_authors a4 ON a4.author_book_id = a1.copies_book_id

WHERE author_name = 'Stephen King'
AND
branch_name='Central'

;
END

/* EXEC library_sp_7 */





/* SELECT * FROM tbl_book; */
/* SELECT * FROM tbl_book_authors; */
/* SELECT * FROM tbl_publisher; */
/* SELECT * FROM tbl_book_loans; */ 
/* SELECT * FROM tbl_book_copies; */
/* SELECT * FROM tbl_borrower; */
/* SELECT * FROM tbl_library_branch; */


/********************************************************************************
							     *RANDOM COMMENTS AND DATA HOLDINGS*
********************************************************************************

INSERT INTO tbl_book
	(title, book_publisher)
	VALUES
	('Cujo', 'Stephen King'),
	('The Stand', 'Stephen King'),
	('The Great Gatsby', 'F. Scott Fitzgerald'),
	('To The Lighthouse', 'Virginia Woolf'),
	('War and Peace', 'Leo Tolstoy'),
	('Ulysses', 'James Joyce'),
	('The Odyssey', 'Homer'),
	('Moby Dick', 'Herman Melville'),
	('Hamlet', 'William Shakespeare'),
	('The Adventures of Huckleberry Finn', 'Mark Twain'),
	('The Iliad', 'Homer'),
	('Madame Bovary', 'Gustave Flaubert'),
	('Crime and Punishment', 'Fyodor Dostoyevsky'),
	('Pride and Prejudice', 'Jane Austen'),
	('Lolita', 'Vladimir Nabokov'),
	('Nineteen Eighty Four', 'George Orwell'),
	('Atlas Shrugs', 'Ayn Rand'),
	('Alice In Wonderland', 'Lewis Carroll'),
	('Great Expectations', 'Charles Dickens'),
	('The Catcher In The Rye', 'J.D. Salinger'),
	('To Kill A Mockingbird', 'Harper Lee'),
	('Gulliver''s Travels', 'Jonathan Swift'),
	('Heart Of Darkness', 'Joseph Conrad'),
	('The Stranger', 'Albert Camus'),
	('The Grapes of Wrath', 'John Steinbeck'),
	('Catch-22', 'Joseph Heller'),
	('The Lost Tribe', 'Mark Lee'),
	('Candide', 'Voltaire'),
	('As I Lay Dying', 'William Faulkner'),
	('Paradise Lost', 'John Milton')
;





**************************************************************************/