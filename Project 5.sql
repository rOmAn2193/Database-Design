Find the pnames of parts which cost $1.00 or more.

	SELECT P.pname
	FROM Parts P
	WHERE P.cost >= 1.00;

Find the snames of suppliers who supply a part named '5 mm hex bolt'

	SELECT S.sname
	FROM Suppliers S, Parts P
	WHERE S.sid = P.sid AND P.pname = '5 mm hex bolt';

Find the pnames of parts for which there is some supplier.

	SELECT P.pname
	FROM Parts P, Catalog C
	WHERE P.pid = C.pid;

Find the snames of suppliers who supply both red parts and green parts.

	SELECT S.sname
	FROM Suppliers S, Catalog C, Parts P
	WHERE S.sid = C.sid AND C.pid = P.pid AND P.color = 'red'
	INTERSECT
	SELECT S2.sname
	FROM Suppliers S2, Catalog C2, Parts P2
	WHERE S2.sid = C2.sid AND C2.pid = P2.pid AND P.color = 'green';
	

Find the snames of suppliers who supply red parts but not green parts.

	SELECT S.sname
	FROM Suppliers S, Catalog C, Parts P
	WHERE S.sid = C.sid AND C.pid = P.pid AND P.color = 'red'
	MINUS
	SELECT S2.sname
	FROM Suppliers S2, Catalog C2, Parts P2
	WHERE S2.sid = C2.sid AND C2.pid = P2.pid AND P.color = 'green';
	