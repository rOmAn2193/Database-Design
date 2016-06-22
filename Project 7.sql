DROP TABLE Instructor;
DROP TABLE Members;
DROP TABLE Student;
DROP TABLE Request;
DROP TABLE Classes;
DROP TABLE Enrollment;

CREATE TABLE Instructor (
  pid CHAR(20),
  mid CHAR (20),
  isMember BIT,
  discipline CHAR(30),
  PRIMARY KEY (pid),
  FOREIGN KEY (mid) REFERENCES Members
);

CREATE TABLE Members(
  mid INT IDENTITY (0,1) NOT NULL,
  name CHAR (30) NOT NULL,
  address CHAR (30),
  phonenum INTEGER,
  email CHAR (30),
  PRIMARY KEY (mid)
);

CREATE TABLE Student(
  sid CHAR (20),
  mid CHAR (20),
  name CHAR (30),
  grants CHAR (30),
  paymentmeth CHAR (20),
  payment CHAR (20),
  paydate DATETIME,
  isMember BIT,
  PRIMARY KEY (sid),
  FOREIGN KEY (mid) REFERENCES Members
);

CREATE TABLE Request(
  rtitle CHAR(20) NOT NULL,
  cid CHAR(20),
  mid CHAR(20) NOT NULL,
  priority INTEGER,
  datereq DATETIME NULL,
  PRIMARY KEY (rtitle),
  FOREIGN KEY (cid) REFERENCES Classes,
  FOREIGN KEY (mid) REFERENCES Members
);

CREATE TABLE Classes(
  cid CHAR(20) NOT NULL,
  pid CHAR (20) NOT NULL,
  title CHAR(30) NOT NULL,
  instructor CHAR (30),
  location CHAR(30),
  tme DATETIME NULL,
  nsessions INTEGER NULL,
  minsize INTEGER NULL,
  maxsize INTEGER NULL,
  fee INTEGER NULL,
  PRIMARY KEY (cid),
  FOREIGN KEY (pid) REFERENCES Instructor
);

CREATE TABLE Enrollment(
  cid CHAR(20) NOT NULL,
  pid CHAR(20) NOT NULL,
  mid CHAR(20) NOT NULL,
  rtitle CHAR(20) NOT NULL,
  location CHAR(30),
  PRIMARY KEY (cid, pid, mid, rtitle),
  FOREIGN KEY (cid) REFERENCES Class,
  FOREIGN KEY (pid) REFERENCES Instructor,
  FOREIGN KEY (mid) REFERENCES Members,
  FOREIGN KEY (rtitle) REFERENCES Request
);

SELECT * FROM Classes

INSERT INTO Classes (cid, title, pid, instructor, location, tme, nsessions, minsize, maxsize, fee)
VALUES ('38415', 'Database Design', '333', 'John Dobbs', 'WS', '2016-01-18 12:00', '1', '0', '5', '1000$');
INSERT INTO Classes (cid, title, pid, instructor, location, tme, nsessions, minsize, maxsize, fee)
VALUES ('38416', 'OS Design', '444', 'Warren MacEvoy', 'WS', '2016-01-18 1:00', '1', '0', '5', '1000$');
INSERT INTO Classes (cid, title, pid, instructor, location, tme, nsessions, minsize, maxsize, fee)
VALUES ('38417', 'US History', '222','Bob Johnson', 'WS', '2016-01-18 2:00', '1', '0', '5', '1000$');
INSERT INTO Classes (cid, title, pid, instructor, location, tme, nsessions, minsize, maxsize, fee)
VALUES ('38418', '2D Modeling', '111', 'Rob Pearson', 'WS', '2016-01-18 3:00', '1', '0', '5', '1000$');
INSERT INTO Classes (cid, title, pid, instructor, location, tme, nsessions, minsize, maxsize, fee)
VALUES ('38419', 'Intro to SQL', '555', 'Joe Robinson', 'WS', '2016-01-18 4:00', '1', '0', '5', '1000$');

SELECT * FROM Request

INSERT INTO Request (rtitle, cid, mid, priority, datereq)
VALUES ('1001','38415','3241','1','2016-01-17 12:01');
INSERT INTO Request (rtitle, cid, mid, priority, datereq)
VALUES ('1002','38415','3853','2','2016-01-17 12:10');
INSERT INTO Request (rtitle, cid, mid, priority, datereq)
VALUES ('1003','38415','3891','3','2016-01-17 12:20');
INSERT INTO Request (rtitle, cid, mid, priority, datereq)
VALUES ('1004','38415','4159','4','2016-01-17 12:30');
INSERT INTO Request (rtitle, cid, mid, priority, datereq)
VALUES ('1005','38415','9151','5','2016-01-17 12:40');
INSERT INTO Request (rtitle, cid, mid, priority, datereq)
VALUES ('1006','38415','7775','6','2016-01-17 12:50');
INSERT INTO Request (rtitle, cid, mid, priority, datereq)
VALUES ('1007','38415','5158','7','2016-01-17 1:00');

SELECT * FROM Enrollment

INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1001','WS');
INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1002','WS');
INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1003','WS');
INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1004','WS');
INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1005','WS');
INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1006','WS');
INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1007','WS');
INSERT INTO Enrollment (cid, pid, mid, rtitle, location)
VALUES ('38415','333','3241','1008','WS');

SELECT * FROM Members

INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('3241', 'Roman', '4315 North Ave', '888-888-8882', 'whatever1@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('3853', 'Jake', '2140 North Ave', '111-111-1115', 'whatever2@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('3891', 'Carter', '1815 North Ave', '222-222-3334', 'whatever3@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('4159', 'Kevin', '5141 North Ave', '514-252-1513', 'whatever4@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('9151', 'Logan', '1615 North Ave', '151-431-5154', 'whatever5@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('7775', 'Steph', '8245 North Ave', '970-131-6121', 'whatever6@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('5158', 'Brian', '9132 North Ave', '404-523-8615', 'whatever7@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('5132', 'Joe', '9178 North Ave', '404-523-4515', 'whatever8@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('7124', 'Jesse', '4145 North Ave', '404-523-1615', 'whatever9@mail.com');
INSERT INTO Members (mid, name, address, phonenum, email)
VALUES ('7154', 'Aiden', '1125 North Ave', '404-523-5153', 'whatever10@mail.com');

SELECT * FROM Student

INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1111','3241','Roman','None','Credit Card','1000$', '2016-01-11', 'Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1112','3853','Jake','Some','Cash', '1000$', '2016-01-10', 'Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1113','3891','Carter','None','Check', '1000$', '2016-01-09', 'Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1114','4159','Kevin','None','Credit Card', '1000$', '2016-01-08','Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1115','9151','Logan','Some','Cash', '1000$', '2016-01-07','Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1116','7775','Steph','None','Checking Account', '1000$', '2016-01-06','Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1117','5158','Brian','Some','Cash', '1000$', '2016-01-05','Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1118','5132','Joe','None','Debit Card', '1000$', '2016-01-04','Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1119','7124','Jesse','Some','Checking Account', '1000$', '2016-01-03','Yes');
INSERT INTO Student(sid, mid, name, grants, paymentmeth, payment, paydate, isMember)
VALUES ('1120','7154','Aiden','None','Credit Card', '1000$', '2016-01-02','Yes');

SELECT M.name
FROM Members M, Request R, Student S
WHERE M.mid = R.mid AND R.sid = S.sid AND S.isMember = BIT AND S.isMember = payment;

SELECT C.title
FROM Classes AS C INNER JOIN Members AS M ON C.cid = M.mid
GROUP BY M.mid, C.title
HAVING COUNT(*) = (SELECT COUNT(*) FROM Classes)

SELECT S.sid, S.name, M.address, M.phonenum, M.email
Roster = (SELECT COUNT (*) FROM Student s WHERE s.sid = S.sid AND s.name = S.name)
Students = (SELECT COUNT (*) FROM Members m WHERE m.address = S.address AND m.phonenum = S.phonenum = AND m.email = S.email)
FROM Student S, Members M

SELECT S.name
FROM Student AS S INNER JOIN Enrollment AS E ON S.sid = E.cid
GROUP BY S.sid, S.name
HAVING COUNT(*) = (SELECT COUNT (*) FROM Classes)

SELECT S.name, S.sid
FROM Student S , Classes C, Request R
WHERE C.maxsize > R.rtitle
