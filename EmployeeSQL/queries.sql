--List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e
INNER JOIN
	salaries s
ON
	e.emp_no = s.emp_no


--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	first_name,
	last_name,
	date_part('year', hire_date)
FROM
	employees
WHERE
	date_part('year', hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM
	dept_manager dm
INNER JOIN
	departments d
ON
	dm.dept_no = d.dept_no
INNER JOIN
	employees e
ON
	dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
	de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	dept_emp de
INNER JOIN
	employees e
ON
	de.emp_no = e.emp_no
INNER JOIN
	departments d
ON
	de.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	first_name,
	last_name,
	sex
FROM
	employees
WHERE
	first_name = 'Hercules'
AND
	LEFT(last_name, 1) = 'B';


--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
	de.emp_no,
	e.last_name,
	e.first_name
FROM
	dept_emp de
INNER JOIN
	employees e
ON
	de.emp_no = e.emp_no
WHERE
	de.dept_no = 'd007';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	dept_emp de
INNER JOIN
	departments d
ON
	de.dept_no = d.dept_no
INNER JOIN
	employees e
ON
	de.emp_no = e.emp_no
WHERE
	de.dept_no = 'd007'
OR
	de.dept_no = 'd005';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
	last_name,
	COUNT(DISTINCT emp_no)
AS
	"frequency_count"
FROM
	employees
GROUP BY
	last_name
ORDER BY
	frequency_count DESC;

