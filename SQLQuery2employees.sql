use first;

select * from employee;

create table Department(
did int,
dname varchar(20),
dlocation varchar(20)
);

insert into department values(
1, 'CA', 'NY');
insert into department values(
2, 'CS', 'Chicago');
insert into department values(
3, 'analytics', 'Boston');
insert into department values(
4, 'sales', 'NY');
insert into department values(
5, 'operations', 'Dallas');


select * from department

---INNER JOIN: returns records that have matching values in both tables(we'll get records that are common in table A & B). Also known as simple join.(non-matching nahi aayenge)
select employee.ename, employee.edept, department.dname, department.dlocation 
from employee
inner join department on employee.edept = department.dname

---LEFT JOIN: returns all the records from the left table, and the matched records from the right table.(all records from table A and only matched records from table B)
select employee.ename, employee.edept, department.dname, department.dlocation
from employee
left join department on employee.edept = department.dname;

---RIGHT JOIN: returns all the records from the right table, and the matched records from the left table.(all records from table B and only matched records from table A)
select employee.ename, employee.edept, department.dname, department.dlocation
from employee
right join department
on employee.edept = department.dname

---FULL JOIN: returns all rows from LEFT table and the RIGHT table with NULL values in place where the join condition is not met(non-matching).
select employee.ename, employee.edept, department.dname, department.dlocation
from employee
full join department
on employee.edept = department.dname;

---UPDATE using JOIN: 
--update age value by +10 in employee table wherever department location is NY.
update employee
set eage = eage + 10
from employee 
join department on employee.edept = department.dname
where dlocation = 'NY'
select * from employee

---DELETE using JOIN:
--delete records where department location is NY.
delete employee
from employee
join department on employee.edept = department.dname
where dlocation = 'NY'
select * from employee


------
create table student_details1(
sid int,
sname varchar(20),
smarks varchar(20),
);

insert into student_details1 values(
1, 'sam', 45);
insert into student_details1 values(
2, 'bob', 87);
insert into student_details1 values(
3, 'anne', 73);
insert into student_details1 values(
4, 'julia', 92);

create table student_details2(
sid int,
sname varchar(20),
smarks varchar(20),
);

insert into student_details2 values(
3, 'anne', 73);
insert into student_details2 values(
4, 'julia', 92);
insert into student_details2 values(
5, 'matt', 65);

select * from student_details1
select * from student_details2

---UNION OPERATOR: used to combine the result-set of two or more select statements.(if a record is present in both the tables we'll only get one of them in final result..no duplicates)
---the number and order of columns must be same in both the select queries
select * from student_details1
union
select * from student_details2

---UNION ALL: gives all the rows from both the tables including DUPLICATES
select * from student_details1
union all
select * from student_details2

---EXCEPT OPERATOR: combines 2 select statements and returns unique records from the left query which are not part of the right query.
select * from student_details1
except
select * from student_details2

---INTERSECT OPERATOR: helps to combine select statements and returns records which are common to both the select statements
select * from student_details1
intersect
select * from student_details2

---VIEW: a virtual table based on the result of an sql table.
create view female_emp as
select * from employee
where egender = 'female'
select * from female_emp

---DROPPIMG a VIEW:
drop view female_emp
select * from female_emp

---ALTER TABLE: used to add, delete or modify columns in an existing table.
---ADDING A COLUMN:
alter table employee
add edob date;
select * from employee
---DROPPING A COLUMN
alter table employee
drop column edob
select * from employee

---MERGE: combination of INSERT, DELETE and UPDATE statements(joins source and target table using commom column...can perform operations in target table)
create table employee_target(
eid int not null,
ename varchar(20),
esalary int,
eage int,
egender varchar(20),
edept varchar(20),
primary key(eid)
);
insert into employee_target values(
1, 'aamna', 950000, 20, 'female', 'CS');
insert into employee_target values(
2, 'iqra', 850000, 21, 'female', 'CA');
insert into employee_target values(
3, 'ibrahim', 750000, 19, 'male', 'analytics');
insert into employee_target values(
9, 'priya', 780000, 24, 'female', 'sales');
insert into employee_target values(
10, 'bob', 650000, 20, 'male', 'analytics');
insert into employee_target values(
4, 'sehrish', 650000, 22, 'female', 'CS');

select * from employee
select * from employee_target
delete from employee where ename = 'bob'

--
merge employee_target as T
using employee as S
		ON T.eid = S.eid
when matched
		then update set T.esalary = S.esalary, T.eage = S.eage
when not matched 
		then insert (eid, ename, esalary, eage, egender, edept)
		values(s.eid, s.ename, s.esalary, s.eage, s.egender, s.edept)
when not matched by source 
		then delete;


---STORED PROCEDURE
create procedure fetchallemp @gender varchar(20)
as
select * from employee where egender = @gender;

fetchallemp male;

--
create procedure getempcount @empcount int out
as
select @empcount = count(*) from employee;

declare @countofemps int
exec getempcount @countofemps out;

--

