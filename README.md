# SQL-Challenge- Employee Database : A Mystery in Two Parts

# Background

Conduct a research project on employees of the corporation from the 1980s and 1990s.All that remain of the database of employees from that period are six CSV files.

Design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, perform the following:
1.  Data Modeling
2.  Data Engineering
3.  Data Analysis

# Objectives

# Data Modeling
Inspect the CSVs and sketch out an ERD of the tables using QuickDBD
![QuickDBD ER diagram](https://github.com/RoshiniGau/SQL-Challenge/blob/master/Images/SchemaDesign.png)

# Data Engineering
1. Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
2. Import each CSV file into the corresponding SQL table.

https://github.com/RoshiniGau/SQL-Challenge/blob/master/SQLFiles/EmployeeTable.sql

# Data Analysis
1. List the following details of each employee: employee number, last name, first name, gender, and salary.
2. List employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List all employees in the Sales department, including their employee number, last name, first name, and department name.
6. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
7. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

https://github.com/RoshiniGau/SQL-Challenge/blob/master/SQLFiles/FinalScript.sql

# Bonus

1. Create a bar chart of average salary by title.
![Average Salary by Title](https://github.com/RoshiniGau/SQL-Challenge/blob/master/Images/avg_salary_by_title.png)

2. Create a histogram of common salary ranges of employees
![Salary Ranges](https://github.com/RoshiniGau/SQL-Challenge/blob/master/Images/Common%20Salary%20Ranges.png)

# Summary
1. Drew ERD of employee database tables,specifying data types,primary key and foreign key.
2. Created tables and constraints and wrote queries.
3. Imported csv files to visualize the data.


 

