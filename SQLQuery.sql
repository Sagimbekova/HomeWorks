CREATE TABLE Visitor
(
	visitorID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	MiddleName VARCHAR(100),
	BirthOfDate DATE NOT NULL,
	Gender VARCHAR(100)
);

INSERT INTO Visitor(FirstName, LastName, MiddleName, BirthOfDate, Gender) 
	VALUES('A', 'James', 'A', '2001-01-03', 'Male');
INSERT INTO Visitor(FirstName, LastName, MiddleName, BirthOfDate) 
	VALUES('J', 'Bond', 'J', '2000-05-07');
INSERT INTO Visitor(FirstName, LastName, BirthOfDate, Gender) 
	VALUES('B', 'Alexa', '2002-01-05','Female');

CREATE TABLE Visits
(
	visitID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	visitorID INT NOT NULL,
	Name VARCHAR(100) NOT NULL,
	VisitTime TIME NOT NULL,
	Trainer VARCHAR(100) NOT NULL,
	FOREIGN KEY (visitorID) REFERENCES Visitor(visitorID)
);

INSERT INTO Visits(visitorID, Name, VisitTime, Trainer)
	VALUES (2, 'James', ' 13:23:44', 'B'), (3, 'James', '15:45:21', 'A');

