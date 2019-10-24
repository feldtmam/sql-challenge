
-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
Select
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.gender,
	sal.salary
From "Employees" As emp --not sure why the table name need to be in " " but it won't recognize it otherwise
Inner Join "Salary" As sal
On emp.emp_no = sal.emp_no
Order By emp.emp_no;

--List employees who were hired in 1986.
Select
	last_name, 
	first_name,
	hire_date
from "Employees"
where date_part('year', hire_date) In ('1986');

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.
Select 
	dept.dept_no As "Department #",
	dept.dept_name As "Department Name",
	dm.emp_no As "Employee #",
	emp.last_name As "Last Name",
	emp.first_name As "First Name",
	dm.from_date As "Start Date",
	dm.to_date As "End Date"
From "Dept_Manager" as dm
Inner Join "Departments" as dept On dm.dept_no = dept.dept_no
Inner Join "Employees" as emp On dm.emp_no = emp.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
Select 
	de.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
From "Dept_Emp" As de
Inner Join "Departments" As dept On dept.dept_no = de.dept_no
Inner Join "Employees" As emp On emp.emp_no = de.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
Select
	first_name,
	last_name
From "Employees"
where first_name = 'Hercules' and last_name Like ('B%');

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
Select
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
From "Employees" As emp 
Inner Join "Dept_Emp" As de On de.emp_no = emp.emp_no
Inner Join "Departments" As dept On dept.dept_no = de.dept_no
where dept.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
Select
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
From "Employees" As emp 
Inner Join "Dept_Emp" As de On de.emp_no = emp.emp_no
Inner Join "Departments" As dept On dept.dept_no = de.dept_no
where dept.dept_name In ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
Select
	last_name,
	Count(last_name) As "Number of Employees with Last Name"
From "Employees"
Group By last_name;
	