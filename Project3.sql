exec sp_databases

DROP TABLE Instructor
DROP TABLE Classes
DROP TABLE TeachingClasses

CREATE TABLE Instructor (
  pid CHAR(20),
  name CHAR(30),
  discipline CHAR(30),
  CONSTRAINT InstructorsKey PRIMARY KEY (pid)
);

CREATE TABLE Classes (
  cid CHAR(20),
  title CHAR(30),
  dept CHAR(20),
  credhrs INTEGER
  PRIMARY KEY (cid)
);

CREATE TABLE TeachingClasses (
  pid CHAR(20) /* NOT NULL */,
  cid CHAR(20) /* NOT NULL */,
  teaching CHAR(20),
  PRIMARY KEY (pid, cid),
  FOREIGN KEY (pid) REFERENCES Instructor,
  FOREIGN KEY (cid) REFERENCES Classes
 );


INSERT INTO Instructor(pid, name, discipline) 
VALUES ('3841', 'Roman', 'Yes');
INSERT INTO Instructor(pid, name, discipline) 
VALUES ('7865', 'Joe', 'Yes');
INSERT INTO Instructor(pid, name, discipline) 
VALUES ('5644', 'Bob', 'No');
INSERT INTO Instructor(pid, name, discipline) 
VALUES ('4342', 'Jake', 'No');

select *
from Instructor;

INSERT INTO Classes (cid, title, dept, credhrs) 
VALUES ('3841', 'History', 'HIST', 3);
INSERT INTO Classes (cid, title, dept, credhrs) 
VALUES ('7865', 'Biology', 'BIO', 3);
INSERT INTO Classes (cid, title, dept, credhrs) 
VALUES ('4242', 'OS Design', 'CSCI', 3);

select *
from Classes;

INSERT INTO TeachingClasses(pid, cid, teaching)
VALUES ('53688', '1111', 'Yes')
INSERT INTO TeachingClasses(pid, cid, teaching)
VALUES ('53689', '1112', 'No')

select *
from TeachingClasses;