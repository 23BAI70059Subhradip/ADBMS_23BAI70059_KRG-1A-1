use sql_query;

--drop table department;
--drop table employee;

CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Tables
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

exec sp_help employee;
exec sp_help department;

select * from employee;
select * from department;




select s.name, s.salary, s.department_id, d.dept_name
from employee s
inner join department d on d.id = s.department_id 
where s.salary in
(select max(e.salary) Max_sal
from employee e
group by department_id)
order by department_id; 



--- hard 
create table A(
    id int, 
    ename varchar(5), 
    salary int); 
create table B(
    id int, 
    ename varchar(5), 
    salary int); 
insert into A values
(1,'AA',1000),
(2,'BB',300);
insert into B values
(2,'BB',400),
(3,'CC',100);

exec sp_help A;
exec sp_help B;
select * from A; select * from B; 

select id, ename, Min(salary) as salary
from (
    select id, ename, salary from A
    union
    select id, ename, salary from B
) as combined
group by id, ename;

--you are using group by: You have to specify that col in select list.

select id, min(ename), Min(salary) as salary
from (
    select id, ename, salary from A
    union
    select id, ename, salary from B
) as combined
group by id;
