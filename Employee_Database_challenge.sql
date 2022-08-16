-- DELIVERABLE 1:
-- PART 1:
-- A query is written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955. (10 pt)
-- The Retirement Titles table is exported as retirement_titles.csv
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;
-- PART 2:
-- A query is written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title. (15 pt)
-- The Unique Titles table is exported as unique_titles.csv. (5 pt)
SELECT 
	DISTINCT ON (t.emp_no) t.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY t.emp_no, t.from_date DESC;

SELECT * FROM unique_titles;
-- PART 3:
-- A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring. (10 pt)
-- The Retiring Titles table is exported as retiring_titles.csv. (5 pt)
SELECT
	t.title,
	COUNT(t.emp_no) as "Employee Count"
INTO retiring_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (t.to_date = '9999-01-01')
GROUP BY t.title
ORDER BY "Employee Count" DESC;

SELECT * FROM retiring_titles;
-- DELIVERABLE 2;
-- A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965. (25 pt)
-- The Mentorship Eligibility table is exported and saved as mentorship_eligibilty.csv. (5 pt)
SELECT 
	DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty;
