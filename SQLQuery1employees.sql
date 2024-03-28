use first;
create table employee(

eid int not null,
ename varchar(20),
esalary int,
eage int,
egender varchar(20),
edept varchar(20),
primary key(eid)
);

insert into employee values(1, 'aamna', 950000, 20, 'female', 'CS');
insert into employee values(2, 'iqra', 850000, 21, 'female', 'CA');
insert into employee values(3, 'ibrahim', 750000, 19, 'male', 'analytics');
insert into employee values(4, 'sehrish', 650000, 23, 'female', 'CS');
insert into employee values(5, 'anas', 890000, 24, 'male', 'CA');
insert into employee values(6, 'maisara', 850000, 30, 'female', 'Sales');
insert into employee values(7, 'jibran', 800000, 29, 'male', 'analytics');
insert into employee values(8, 'nabeel', 600000, 26, 'male', 'tech');


--extracting columns
SELECT ename FROM employee;
SELECT eage FROM employee;
SELECT ename, eage, esalary FROM employee;

--extracting all data
SELECT * FROM employee;
 
---DISTINCT CLAUSE: selecting distinct values from a column
SELECT DISTINCT egender FROM employee;

--WHERE CLAUSE: used to extract recoords which satisfy a given condition
--extract only female employees
SELECT * FROM employee where egender = 'female';
--employees whose age is less than 30
SELECT * FROM employee where eage < 30;
--employees whose salary is greater than 800000
SELECT * FROM employee where esalary > 800000;


---FEW LOGICAL OPERATORS: Extracting records on the basis of mutiple conditions

---AND: displays record if all the conditions seperated by AND are TRUE(more than one conditions).
SELECT * FROM employee where egender = 'male' and eage < 20;
SELECT * FROM employee where edept = 'CS' and esalary > 800000;

---OR: displays records where atleast one of conditions is satisfied.
SELECT * FROM employee where edept = 'CS' or edept = 'analytics'; 
SELECT * FROM employee where esalary > 700000 or eage > 21;

---NOT: displays record if the condition is NOT TRUE.
SELECT * FROM employee where not egender = 'female';
SELECT * FROM employee where not eage < 21;

---LIKE: extract records where a particular pattern is present. Used in conjuction with WILDCARD characters- %(represents substitution for 0, 1 or muliple charac) and _(represents substitution of  a single char).
--extract employees whose name starts with 'A'
SELECT * FROM employee Where ename like 'A%';
--extract employees whose age is in 20's
SELECT * FROM employee where eage like '2_'

---BETWEEN: used to select values within a given range(upper range is exclusive)
--extract records where eage is between 21 and 25
SELECT * FROM employee where eage between 21 and 25;
--employees whose salary is between 700000 and 900000
SELECT * from employee where esalary between 700000 and 900000;


---AGGREGATE FUNCTIONS 

---MIN(): gives smallest value in a column.
--find youngest employee's age
SELECT min(eage) from employee;
--find the least salary
SELECT min(esalary) from employee;

---MAX(): gives you the largest value in a column.
--max salary
SELECT max(esalary) from employee;
--max age
SELECT max(eage) from employee;

---COUNT(): returns the number of rows that match the specified criteria.
--find number of male emloyees
SELECT count(*) from employee where egender = 'male';
--find number of female emloyees
SELECT count(*) from employee where egender = 'female';

---SUM(): gives total sum of a numeric column.
--find sum of salaries of all employees
SELECT sum(esalary) from employee;

---AVG(): gives the average value of a numeric column.
--average age of employees
SELECT avg(eage) from employee;


---STRING FUNCTIONS

---LTRIM(): removes blanks on the left side of the character expression.

---LOWER(): converts all characters to lower case letters.
SELECT 'THIS IS IDK WHAT'
SELECT LOWER('THIS IS IDK WHAT')

---UPPER(): converts all the characters in upper case.
SELECT 'hello world'
SELECT UPPER('hello world')

---REVERSE(): reverses all the characters in the string.
SELECT 'i love icecream'
SELECT REVERSE('i love icecream')

---SUBSTRING(): gives the substring from the original string
SELECT 'this is a string'
SELECT substring('this is a string', 11, 6)

---ORDER BY clause: used to sort data in ascending or descending order(by default- ascending).
--sort the table in ascending order with respect to salary.
SELECT * FROM employee order by esalary;
--sort the table in descending order with respect to salary.
SELECT * FROM employee order by esalary DESC;

---TOP clause: used to fetch the TOP N records(useful in large tables).
--top 3 records from table
SELECT TOP 3 * from employee
--fetch top 3 oldest employees from the company
SELECT TOP 3 * FROM employee order by eage DESC;

---GROUP BY: used to get aggregate result with respect to a group.
--find average salary with respect to gender(average salary of male and female employees seperately)
SELECT avg(esalary), egender from employee group by egender;
--average age wrt department and sort in descending order
SELECT avg(eage), edept from employee group by edept order by avg(eage) desc;

---HAVING clause: used in combination with GROUP BY to impose conditions on groups.
--group table wrt department and display only those department  where the average salary is greater than 800000
select edept, avg(esalary) as average_salary
from employee
group by edept 
having avg(esalary) > 800000

---UPDATE Statement: used to modify the existing records in a table
--update aamna's age to 21 
update employee set eage = 21 where ename = 'aamna'
select * from employee
--change dept of all female employees to 'tech'
update employee set edept = 'tech' where egender = 'female'
select * from employee
--make all the salaries equal to 900000
update employee set esalary = 900000
select * from employee

---DELETE Statement: used to delete existing records(whole row) in the table
--delete record where age of the employee is 24
delete from employee where eage = 24
select * from employee
--delete sehrish's record
delete from employee where ename = 'sehrish'
select * from employee

--- TRUNCATE Statement: deletes all the data inside the table(deletes all the records..structure of the table remains same(rows will delete, columns wont))
truncate table employee
select * from employee



