--Q1 List the employee number, last name, first name, sex, and salary of each employee.---

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no;



--Q2 List the first name, last name, and hire date for the employees who were hired in 1986.---


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';                                                                                                 



--Q3 List the manager of each department along with their department number, department name, employee number, last name, and first name.---

SELECT dm.emp_no, e.first_name, e.last_name, dm.dept_no, d.dept_name 
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no;



--Q4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.---

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
ORDER BY d.dept_no;



--Q5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.---

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--Q6 List each employee in the Sales department, including their employee number, last name, and first name.---

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'



--Q7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.---

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e 
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'


--Q8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).---

SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;