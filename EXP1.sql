create database AIT_1A; 
use AIT_1A;

create table TBL_Author(
	Author_id Int primary key, 
	Author_name varchar(max), -- max keyword 255 is the size 
	countory varchar(max)
)

exec sp_help TBL_Books; 

create table TBL_Books(
	Book_id Int primary key, 
	Book_title varchar(max), -- max keyword 255 is the size 
--	--insertion violation and anomolies: insert, update and delete
--	-- cascading ??
	AuthorId Int 
	Foreign key (AuthorId) references TBL_Author(Author_id), 
)

INSERT INTO TBL_Author (Author_id, Author_name, countory) VALUES
(1, 'George Orwell', 'United Kingdom'),
(2, 'Haruki Murakami', 'Japan'),
(3, 'Chinua Achebe', 'Nigeria'),
(4, 'J.K. Rowling', 'United Kingdom'),
(5, 'Gabriel García Márquez', 'Colombia'),
(6, 'Mark Twain', 'United States');

INSERT INTO TBL_Books (Book_id, Book_title, AuthorId) VALUES
(101, '1984', 1),
(102, 'Kafka on the Shore', 2),
(103, 'Things Fall Apart', 3),
(104, 'Harry Potter and the Sorcerer Stone', 4),
(105, 'One Hundred Years of Solitude', 5),
(106, 'Adventures of Huckleberry Finn', 6);



---- problem 4
---- min table for join 1. Conditon >> atleast one col should be same. (name can diff but vals must be same). 
---- left is first table and right is on join. 
---- inner (matching rec), left outer (left table whole data+ common data), right outer (right table whole data+ common data), full outer join (left + right + common data), self join (1 table), left exclusive join, right exclusive joins.
---- blue pink and white. keyword. 
---- 
SELECT b.Book_title as 'Book Name', a.Author_name as [Author Name], a.countory [Country]
from TBL_Books as b
inner join TBL_Author as a 
on b.AuthorId = a.Author_id;



---------------------------------------------------------------------------------------------------
/* 
Medium 
-- grant and revoke.
 --grant permissions/priv on tbl_name to username
 --ex: grant select, update on emp to user_name;
 --revoke permissions/priv on tbl_name from username; 
 --ex: revoke update on emp from user_name; 

 subquery: 
	prob: employee(name, id, sal) 
		sal 70000,65000,32000,24000
		find second highest sal. 

		AGG FUNCTION: SLECT MAX(SAL) FROM EMP; - 70000; -Q1 ----> inner  
		SLECT MAX(SAL) FROM EMP where sal not in (Q1); - 65000;  ---> outer 

	
 */ 


use AIT_1A; 


-- Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);


-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Insert Courses
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Computer Networks', 1),
(111, 'Linux/Unix systems', 1),
(112, 'Matrix', 3),
(113, 'Space Physics', 2);


-- 3 
--select count(c.CourseName) as [Count], d.DeptName
--from Course as c
--inner join Department as d 
--on d.DeptID = c.DeptID
--group by d.DeptName;

SELECT 
    D.DeptName,
    (SELECT COUNT(*) 
     FROM Course C 
     WHERE C.DeptID = D.DeptID) AS CourseCount
FROM Department D;



--4
--select d.DeptID
--from Department as d 
--inner join Course as c on c.DeptID = d.DeptID
--group by d.DeptID
--having count(c.DeptId) >= 2; 

SELECT 
    DeptID,
    DeptName,
    (SELECT COUNT(*) 
     FROM Course 
     WHERE Course.DeptID = Department.DeptID) AS CourseCount
FROM Department 
where (SELECT COUNT(*) 
     FROM Course 
     WHERE Course.DeptID = Department.DeptID) > 2;



--to create a user : 
--	1. create login - admin
--	2. create user. 
create login test_login with password = 'Test@123';
create user test_user for login test_login; 
execute as user = 'test_user'; 
grant select on Course to test_user; 



-- read joins before next class. 
-- create soft copy of the experiment.
-- push data using cuchd id. github. 






