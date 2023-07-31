--1) List the employee number, last name, first name, sex, and salary of each employee.

select  ed.emp_no,ed.last_name,ed.first_name,ed.sex, sd.salary
from employee_details ed 
join salary_details sd
on(ed.emp_no=sd.emp_no)
order by ed.emp_no ;

--2) List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name ,last_name , hire_date 
from employee_details
where hire_date like  '%1986'


--3) List the manager of each department along with 
--their department number, department name, employee number, last name, and first name.

select d.dept_no,d.dept_name,dm.emp_no,
ed.last_name, ed.first_name
from departments d
join dept_manager dm
on(dm.dept_no=d.dept_no)
join employee_details ed 
on (dm.emp_no= ed.emp_no)

--4) List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.

select d.dept_no,de.emp_no,ed.last_name, ed.first_name, d.dept_name
from departments d
join dept_emp de
on(de.dept_no=d.dept_no)
join employee_details ed 
on (de.emp_no= ed.emp_no)

--5)List the first name, last name, and sex of each employee whose first name is
--Hercules and whose last name begins with the letter B.

select first_name,last_name,sex
from employee_details
where
first_name='Hercules' and last_name like 'B%'

--6)List each employee in the Sales department, 
--including their employee number, last name, and first name.

select de.emp_no,ed.last_name,ed.first_name,d.dept_name
from employee_details ed
join dept_emp de
on(de.emp_no=ed.emp_no)
join departments d
on(d.dept_no =de.dept_no) 
where d.dept_name='Sales'


--7)List each employee in the Sales and Development departments, 
--including their employee number, last name,
--first name, and department name.

select de.emp_no,ed.last_name,ed.first_name,d.dept_name
from employee_details ed
join dept_emp de
on(de.emp_no=ed.emp_no)
join departments d
on(d.dept_no =de.dept_no) 
where d.dept_name='Sales' or d.dept_name='Development'

--8) List the frequency counts, in descending order,of all 
--the employee last names (that is, how many employees share each last name).

select last_name,count(last_name) as  "count_names" 
from employee_details
group by last_name 
order by count_names desc