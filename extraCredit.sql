DROP TABLE Reserves
DROP TABLE Sailors
DROP TABLE Boats

CREATE TABLE Sailors(
 sid INTEGER,
 sname CHAR(20),
 rating INTEGER,
 age REAL,
 PRIMARY KEY (sid)
)

CREATE TABLE Boats(
 bid INTEGER,
 bname CHAR(20),
 color CHAR(20),
 PRIMARY KEY (bid)
)

CREATE TABLE Reserves(
 sid INTEGER,
 bid INTEGER,
 day DATE,
 FOREIGN KEY (sid) REFERENCES Sailors,
 FOREIGN KEY (bid) REFERENCES Boats,
 PRIMARY KEY (sid, bid, day)
)

INSERT INTO Sailors (sid, sname, rating, age)
VALUES
	(22, 'Dustin', 7, 45.0),
	(29, 'Brutus', 1, 33.0),
	(31, 'Lubber', 8, 55.0),
	(32, 'Andy', 8, 25.5),
	(58, 'Rusty', 10, 35.0),
	(64, 'Horatio', 7, 35.0),
	(71, 'Zorba', 10, 16.0),
	(74, 'Horatio', 9, 35.0),
	(85, 'Art', 3, 25.5),
	(95, 'Bob', 3, 63.5)

INSERT INTO Boats(bid, bname, color)
VALUES
	(101, 'Interlake', 'blue'),
	(102, 'Interlake', 'red'),
	(103, 'Clipper', 'green'),
	(104, 'Marine', 'red')

INSERT INTO Reserves (sid, bid, day)
VALUES
	(22, 101, '10/10/2013'),
	(22, 102, '10/10/2013'),
	(22, 103, '10/8/2013'),
	(22, 104, '10/7/2013'),
	(31, 102, '11/10/2013'),
	(31, 103, '11/6/2013'),
	(31, 104, '11/12/2013'),
	(64, 101, '9/5/2013'),
	(64, 102, '9/8/2013'),
	(74, 103, '9/8/2013')

SELECT * FROM Reserves

SELECT * FROM Sailors

SELECT * FROM Boats

/* (Q28) Count the number of Sailors */

SELECT COUNT(*)
FROM Sailors S;

/* (Q27) Find the name and age of the oldest sailor */

SELECT S.sname, S.age
FROM Sailors S
WHERE S.age = (SELECT MAX(S2.age)
               FROM Sailors S2);

/* (Q31) Find the age of the youngest sailor for each rating level */

SELECT S.rating, MIN(S.age)
FROM Sailors S
GROUP BY S.rating ;

/* (Q33) For each red boat, find the number of reservations for this boat */

SELECT B.bid, COUNT(*) AS sailorcount
FROM Boats B, Reserves R
WHERE R.bid = B.bid
GROUP BY B.bid
HAVING B.color ='red' ;

/* (Q34) Find the average age of sailors for each rating level that has at least two sailors */

SELECT S.rating, AVG(S.age) AS average
FROM Sailors S
GROUP BY S.rating
HAVING COUNT(*) > 1;
