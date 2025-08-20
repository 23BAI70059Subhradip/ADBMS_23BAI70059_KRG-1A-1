/* 
In joins there was cartisian products. 
to remove and improve the speed; 


Q1(Q2(Q3)) > inner query 
main query
2. execution :> Q3> Q2> Q1; 
3. operators (connectors or conditions) used with subquery: 
	a. =, < , > , ! = (<>): ssubquery returning one output. (single output)
	b. In (multi output)
	c. Not In. 
	d. Any (or) 
	e. All (and) 
4. types of suqueries: 
	a. Scaler subquery: which returns only output. (OP1). 
	b. Multi-row/ multi-value SQ: returns multiple rows (OP2,3,4,5).
	c. self-contained sq: which has no dependency on outer query. 
		Q1 (Q2) : Q2 is independent of Q1. 
	d. CO-related (joins are better than this): inner and outer query must be related to each other. 
		Q1 (Q2) : Q2 > Q1:: Q2 can't be run seperately. 
		create mmore overhead, also they are avoided

where: 
	1. where
	2. select
	3. from

How: 
	find the value of subquery and then work with outer query.

which ever column name is used with outer query the same datatype column name dtype should be with the sq.


ANY -> upperbound is checked. 52000,50000 -> 52000
ALL -> check the lower bound. 52000,50000 -> 50000


also can be done in Set in database 
1. set 
2. union all
3. union
4. intersect
5. except (a-b) 
rules: 
	1. number of cols involving in the op should be same. 
	2. 

*/ 


-- Easy-> create a employee table and emp_id >>>>> find the maximum vakue for emp_id excluding the duplicates. 

--create database sql_query; 
--use sql_query;

--CREATE TABLE employee (
--    emp_id INT
--); 
--INSERT INTO employee (emp_id) VALUES
--(1), (2), (3), (4), (5),
--(6), (7), (8), (9), (10),
--(1), (3), (4), (5),
--(6), (7), (8), (9), (10),
--(1),  (11), (12);


--select * from employee 
--where emp_id not in 
--(select emp_id from employee group by emp_id having count(*) > 1);


CREATE TABLE TBL_PRODUCTS
(
	ID INT PRIMARY KEY IDENTITY,
	[NAME] NVARCHAR(50),
	[DESCRIPTION] NVARCHAR(250) 
)

CREATE TABLE TBL_PRODUCTSALES
(
	ID INT PRIMARY KEY IDENTITY,
	PRODUCTID INT FOREIGN KEY REFERENCES TBL_PRODUCTS(ID),
	UNITPRICE INT,
	QUALTITYSOLD INT
)

INSERT INTO TBL_PRODUCTS VALUES ('TV','52 INCH BLACK COLOR LCD TV')
INSERT INTO TBL_PRODUCTS VALUES ('LAPTOP','VERY THIIN BLACK COLOR ACER LAPTOP')
INSERT INTO TBL_PRODUCTS VALUES ('DESKTOP','HP HIGH PERFORMANCE DESKTOP')


INSERT INTO TBL_PRODUCTSALES VALUES (3,450,5)
INSERT INTO TBL_PRODUCTSALES VALUES (2,250,7)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,4)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,9)


SELECT *FROM TBL_PRODUCTS
SELECT *FROM TBL_PRODUCTSALES

-- task01 >> find id, name, desc, of the prod who have'nt been sold or atleast once.
select *
from TBL_PRODUCTS where id not in
(select distinct PRODUCTID  from TBL_PRODUCTSALES );

--task02 >> find the total number of quant sold for each product >> if no prod sold mark it as null. use sql in select. 
select t.id, t.[name],(select sum(QUALTITYSOLD) from TBL_PRODUCTSALES where t.id = PRODUCTID) [Quality Sold]
from TBL_PRODUCTS t; 

-- HW >> SQ with from cause, leetcode 1890