/*
( JOINS )
TO RETREVE OR PERFORM THE TASKS. 
CARTISIAN PRODUCT IN THE BACKGROUND AND IN THE FORM OF MATRIX. 
CONDITIONS: 
	1. ONE COL SHOULD BE SAME (VALUES ONLY). 
	2. MIN TABLE -> 1 (SELF JOIN). 
TYPES: 
	1. INNER JOIN > COMMON DATA
	2. LEFT OUTER JOIN / LEFT JOIN > LEFT AND RIGHT MATCHED AND ALL LEFT. 
	3. RIGHT OUTER JOIN/ RIGHT JOIN > LEFT AND RIGHT MATCHED AND ALL RIGHT.
	-- BELOW ARE VARIATIONS OF THE ABOVE
	4. FULL OUTER JOIN > L + R + COMMON
	5. SELF JOIN (1 TABLE) > 
		FOREIGN KEY: 1 (IMP).  
	6. LEFT EXCLUSIVE JOIN > 
		FETCH THE ROWS CORRESPOND TO NULL VALUES. STRICTLY PRESENT IN LEFT TABLE. LEFT DATA.
	7. RIGHT EXCLUSIVE JOIN
SYNTAX: SHORT CODES 
	SELECT TBL1.*. TBL2.*
	FROM TABL1
	<TYPE JOIN> TABLE2 ON TBL1.COL = TBL2.COL; 

	
				---EXPERIMENT 02: JOINS--------------
	NEED?: 
		EMPLOYEE (EID, ENAME, DESIGNATION)
				  101
				  102
				  103

		DEPT (DID, DNAME, EMPLOYEE_ID)
							  102

	P.S: DISPLAY EMPLOYEE NAME ALONG WITH THEIR DEPARTMENTS NAME

	1. CONDITION: ONE COL SHOULD BE SAME
					(VALUES SHOULD BE SAME)

	2. MIN TABLE FOR JOINS: 1 (SELF JOIN)

	TYPES: 
			1. INNER JOIN (MATCHING DATA / COMMON DATA)
			2. LEFT OUTER JOIN / LEFT JOIN
				(LEFT TABLE WHOLE DATA + COMMON DATA)
			3. RIGHT OUTER JOIN / RIGHT JOIN
				(RIGHT TABLE WHOLE DATA + COMMON DATA)
			4. FULL OUTER JOIN
				(L + R + COMMON DATA)
			5. SELF JOIN (TICKY CASE: 1)
					FOREING KEY: 1

			6. LEFT EXCLUSIVE JOIN
			7. RIGHT EXCLUSIVE JOIN

	WE CAN ADD NAMES IN ALTER CASES SO THAT WE CAN DROP THEM LATER.
	FROM LEFT EXPLOERE WE CAN ALSO DO THAT BY DRAG AND DROP. 

*/

--SELECT *FROM Employee_tbl
--SELECT *FROM department

-----SYNTAX: SHORT CODES
--SELECT Employee_tbl.*, department.*
--FROM Employee_tbl
--INNER JOIN
--department
--ON
--Employee_tbl.EmpId = department.EmpId


----RETIREVE SPECIFIC COLUMNS
----P.S: DISPLAY EMPLOYEE NAME ALONG WITH THEIR DEPARTMENTS NAME
----ALIAS: TEMPORARY NOMENCALTURE - TEMPORARY NAMES
--SELECT E.EMPNAME, E.DESIGNATION , D.DEPTNAME
--FROM Employee_tbl AS E
--INNER JOIN
--department AS D
--ON
--E.EmpId = D.EmpId


----LEFT OUTER JOIN
--SELECT E.*, D.*
--FROM Employee_tbl AS E
--LEFT OUTER JOIN
--department AS D
--ON
--E.EmpId = D.EmpId

----RIGHT OUTER JOIN
--SELECT E.*, D.*
--FROM Employee_tbl AS E
--RIGHT OUTER JOIN
--department AS D
--ON
--E.EmpId = D.EmpId


--SELECT E.*, D.*
--FROM Employee_tbl AS E
--FULL OUTER JOIN
--department AS D
--ON
--E.EmpId = D.EmpId


----LEFT EXCLUSIVE JOIN
----FETCH THE ROWS CORRESPOND TO NULL VALUES
--SELECT E.*
--FROM Employee_tbl AS E
--LEFT OUTER JOIN
--department AS D
--ON
--E.EmpId = D.EmpId
--WHERE D.EMPID IS NULL

/* 
MEDIUM
	ps: CREATE A TABLE EMPLOYEE (EMPID, ENAME, DEPARTMENT, MANAGERID)
	-ALTER COMMAND


	EMPNAME, EMPDEPT, NAMAGERNAME, MANAGERDEPT

*/ 

USE AIT_1A; 

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL  
);

ALTER TABLE Employee
ADD CONSTRAINT FK_EMPLOYEE FOREIGN KEY (ManagerID) references Employee(EmpID);

--Drop Constraint FK_EMPLOYEE;

INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Alice', 'HR', NULL),        
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);


SELECT E1.EmpName [Employee Name], E2.EmpName [Manager Name], E1.Department [Emp_dept],
E1.Department [Manager_dept]
from Employee as E1
left outer join Employee as E2 on E1.ManagerID = E2.EmpID; 



--------------(HARD LEVEL)-------------------------------
--(B) part
-- Create Year_tbl (holds actual NPV values)
CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

-- Create Queries table (requested values)
CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

-- Insert data into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

-- Insert data into Queries
INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);


select * from Year_tbl; 
select * from Queries; 

select q.id, q.year, Isnull(y.NPV, 0) [NPV]
from Queries as q
left outer join Year_tbl as y on q.id = y.id and q.YEAR = y.YEAR
order by q.id;  