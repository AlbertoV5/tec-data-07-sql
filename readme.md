# Retirement Analysis of Pewlett Hackard


## Overview

In this analysis we made a series of queries to our database to obtain key information about the employees that are soon to retire from Pewlett Hackard.

Our database contains a few tables with many relations to the employee id. This is our database diagram:

![img](./EmployeeDB.png)


## Results

1.- All current employees that are nearing retirement, which means all those who were born between 1962 and 1965 and are currently employeed in the company.

```sql
SELECT * FROM retirement_titles
LIMIT 3;
```

<table><tr><th>emp_no</th><th>first_name</th><th>last_name</th><th>title</th><th>from_date</th><th>to_date</th></tr><tr><td>10001</td><td>Georgi</td><td>Facello</td><td>Senior Engineer</td><td>1986-06-26</td><td>9999-01-01</td></tr><tr><td>10004</td><td>Chirstian</td><td>Koblick</td><td>Engineer</td><td>1986-12-01</td><td>1995-12-01</td></tr><tr><td>10004</td><td>Chirstian</td><td>Koblick</td><td>Senior Engineer</td><td>1995-12-01</td><td>9999-01-01</td></tr></table>

2.- We filtered the previous result to make sure that we only get the latest title of each employee that is nearing retirement, that means that it is their current title.

```sql
SELECT * FROM unique_titles
LIMIT 3;
```

<table><tr><th>emp_no</th><th>first_name</th><th>last_name</th><th>title</th><th>from_date</th><th>to_date</th></tr><tr><td>10001</td><td>Georgi</td><td>Facello</td><td>Senior Engineer</td><td>1986-06-26</td><td>9999-01-01</td></tr><tr><td>10004</td><td>Chirstian</td><td>Koblick</td><td>Senior Engineer</td><td>1995-12-01</td><td>9999-01-01</td></tr><tr><td>10005</td><td>Kyoichi</td><td>Maliniak</td><td>Senior Staff</td><td>1996-09-12</td><td>9999-01-01</td></tr></table>

3.- We can then count how many employees per title are retiring.

```sql
SELECT * FROM retiring_titles
LIMIT 3;
```

<table><tr><th>title</th><th>Employee Count</th></tr><tr><td>Senior Engineer</td><td>25916</td></tr><tr><td>Senior Staff</td><td>24926</td></tr><tr><td>Engineer</td><td>9285</td></tr></table>

4.- Finally, we will look for all current employees that can qualify for the mentorship program, which means that is all those born in 1965.

```sql
SELECT * FROM mentorship_eligibilty
LIMIT 3;
```

<table><tr><th>emp_no</th><th>first_name</th><th>last_name</th><th>birth_date</th><th>from_date</th><th>to_date</th><th>title</th></tr><tr><td>10095</td><td>Hilari</td><td>Morton</td><td>1965-01-03</td><td>1994-03-10</td><td>9999-01-01</td><td>Senior Staff</td></tr><tr><td>10122</td><td>Ohad</td><td>Esposito</td><td>1965-01-19</td><td>1998-08-06</td><td>9999-01-01</td><td>Technique Leader</td></tr><tr><td>10291</td><td>Dipayan</td><td>Seghrouchni</td><td>1965-01-23</td><td>1987-03-30</td><td>9999-01-01</td><td>Senior Staff</td></tr></table>


## Summary

We can count the number of employees that are leaving the company by summing the rows in our `retiring_titles` table.

```sql
SELECT SUM("Employee Count")
FROM retiring_titles;
```

<table><tr><th>sum</th></tr><tr><td>72458</td></tr></table>

That means we will need to fill 72,458 positions in the company once those employees retire.

We want to check if there are enough employees that qualify for the mentorship program. So we can get the sum from our other table.

```sql
SELECT COUNT(emp_no)
FROM mentorship_eligibilty;
```

<table><tr><th>count</th></tr><tr><td>1549</td></tr></table>

There are only 1,549 employees in the mentorship program. Which seems like a low number of employees, so we may need to invest further in training of the next generation of Pewlett Hackard employees once the 52-55 generation retires.


## Closing Thoughts

SQL queries are a very powerful way to get information of the data in our database without needing big transformations or processing. The most powerful feature is probably the relations between the different tables, as you can construct fairly complex and powerful queries to fetch any arrangement of data you want.
