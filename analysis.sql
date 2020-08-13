--List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employee as emp
inner join salaries as sal
on emp.emp_no = sal.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employee
where hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department with: department number, department name, the manager's employee number, last name, first name.
select depm.dept_no, dept.dept_name, depm.emp_no, emp.last_name, emp.first_name
from department_manager as depm
inner join departments as dept on depm.dept_no = dept.dept_no
inner join employee as emp on emp.emp_no = depm.emp_no

--List each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employee as emp
inner join department_employee as depe on depe.emp_no = emp.emp_no
inner join departments as dept on depe.dept_no = dept.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employee
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employee as emp
inner join department_employee as depe on depe.emp_no = emp.emp_no
inner join departments as dept on depe.dept_no = dept.dept_no
where dept.dept_name = 'Sales'

--List all employees in the Sales and Development departments
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employee as emp
inner join department_employee as depe on depe.emp_no = emp.emp_no
inner join departments as dept on depe.dept_no = dept.dept_no
where dept.dept_name = 'Sales'
or dept.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "count"
from employee
group by last_name
order by "count" desc;

--"Search your ID number." You look down at your badge to see that your employee ID number is 499942.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name, emp.birth_date, emp.sex, emp.hire_date
from employee as emp
inner join department_employee as depe on depe.emp_no = emp.emp_no
inner join departments as dept on depe.dept_no = dept.dept_no
where emp.emp_no = '499942'
