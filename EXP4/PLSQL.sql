/*
	PLSQL 
	select to store we need PLSQL. 
	1. conditional statesmenst: 
		 if, else, else-if ladder, case statements. 
	
		SQL server: -- here output is msg not a table. 
		if condition
			print ''
		else if condition
			print ''
		else condition
			print ''
	
		Post gress 
		
		Do
		$$ --> deliminators makes sure the server doesnot intervien btw the code blocks.
		Declare 

		Begin 
			if condtion then 
				raise notice 'Message';  --> raise notice is equal to print
			elsif condition then raise notice 'msg3';
			else 
				raise notice 'msg2'; 
			endif 
		ENd;
		$$
	
	
	
	2. 
*/

use sql_query; 
select * from employee


select min(salary) as min_salary,
       avg(salary) as avg_salary,
       case
           when avg(salary) > 78000 then 'big'
           else 'small'
       end as remarks
from employee;



declare 
	@avg_sal INT; 
select @avg_sal = AVG(salary) from employee 
begin 
	print @avg_sal 
end