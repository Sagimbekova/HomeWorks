CREATE TABLE Contact
(
	ContactID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	MiddleName VARCHAR(100),
	BirthOfDate DATE NOT NULL,
	IDCardNumber varchar(100) NOT NULL,
	Gender VARCHAR(100)
);

CREATE TABLE Student
(
	StudentID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ContactID INTEGER,
	f_Active boolean NOT NULL,
	FOREIGN KEY (ContactID) REFERENCES Contact(ContactID)
);

CREATE TABLE Course
(
	CourseID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name VARCHAR(100) NOT NULL,
	Months int not null
);

CREATE TABLE Employee
(
	ContactID INTEGER NOT NULL PRIMARY KEY,
	f_Active boolean NOT NULL
);

CREATE TABLE Event
(
	EventID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name varchar(100) NOT NULL,
	OpeningDate DATE NOT NULL,
	ClosingDate DATE
);

CREATE TABLE Teacher
(
	TeacherID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	CourseID int,
	ContactID int,
	Name varchar(100) not null,
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
	FOREIGN KEY (ContactID) REFERENCES Contact(ContactID)
);

INSERT INTO Contact VALUES ('Ale', 'Aleeve', 'Alevna', '1996-05-04', 'AN2015', 'Female');
INSERT INTO Contact(FIRSTName, LASTName, MiddleName, BirthOfDate, IDCardNumber, GEnder)
VALUES ('Fedor', 'Fedor', 'Fedorovich', '2000-02-01', 'A5555', 'Male'),
	   ('a', 'aa', 'aaa', '2000-02-01', 'A5554', 'Male'),
	   ('bbb', 'bb', 'bbb', '2000-02-01', 'A5553', 'Male');
INSERT INTO Employee VALUES (1, TRUE), (2, True);
INSERT INTO Teacher VALUES(1, 1, 3, 'a');
INSERT INTO Student VALUES(1, 4, TRUE);
INSERT INTO Course VALUES (1, 'Programming', 9);

ALTER TABLE Student ADD CourseID INT FOREIGN KEY REFERENCES Course(CourseID);

UPDATE  Student SET  courseID = 1 WHERE  StudentID = 1;

SELECT 
	c.Name AS Course,
	t.Name AS Teacher,
	con.FirstName AS Student
FROM Course c
	INNER join Teacher t ON t.CourseID = c.CourseID
	INNER join Student s ON s.CourseID = c.CourseID
	INNER join Contact con ON con.ContactID = s.ContactID