--Drop Table
Drop Table Employee IF Exists Cascade;
Drop Table Dep_Emp IF Exists Cascade;
Drop Table DepartmentManager IF Exists Cascade;
Drop Table Departments IF Exists Cascade;
Drop Table Salaries If Exists Cascade;
Drop Table Title if Exists Cascade;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ypA8rD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee" (
    "EmployeeID" varchar(30)   NOT NULL,
    "FirstName" varchar(30)   NOT NULL,
    "LastName" varchar(30)   NOT NULL,
    "BirthDate" date   NOT NULL,
    "HireDate" date   NOT NULL,
    "Gender" varchar(30)   NOT NULL,
    "EmployeeTitleID" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "EmployeeID"
     )
);
CREATE TABLE "Departments" (
    "DepartmentID" varchar(30)  NOT NULL,
    "DepartmentName" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DepartmentID"
     )
);
CREATE TABLE "Dep_Emp" (
    "DepartmentID" varchar(30)   NOT NULL,
    "EmployeeID" varchar(30)   NOT NULL
);

CREATE TABLE "DepartmentManager" ( 
    "EmployeeID" varchar(30)   NOT NULL,
    "DepartmentID" varchar(30)   NOT NULL
);

CREATE TABLE "Salaries" (
    "SalaryID"   serial  NOT NULL,
    "Salary" int   NOT NULL,
    "EmployeeID" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "SalaryID"
     )
);
CREATE TABLE "Title" (
    "TitleID" varchar(30)   NOT NULL,
    "Title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "TitleID"
     )
);

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "Title" ADD CONSTRAINT "fk_Title_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");


--List the following details of each employee: employee number, last name, first name, sex, and salary
Select * from "Employee"
Select * from "Salaries"

Select "Employee"."EmployeeID","LastName","FirstName","Gender","Salary"
from "Employee" inner join "Salaries"
on "Employee"."EmployeeID" = "Salaries"."EmployeeID"

--List first name, last name, and hire date for employees who were hired in 1986
Select * from "Employee"

Select "FirstName","LastName","HireDate"
from "Employee"
where "HireDate" > '1985-12-31' And "HireDate" < '1987-01-01'
order by "HireDate"

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select * from "DepartmentManager"
Select * from "Departments"
Select * from "Employee"

Select "Departments"."DepartmentID" as "DepartmentNumber","Departments"."DepartmentName",
"Employee"."EmployeeID" as "ManagerEmployeeNumber","LastName","FirstName"
from "Employee" 
inner join "DepartmentManager" on "Employee"."EmployeeID" = "DepartmentManager"."EmployeeID"
inner join "Departments" on "DepartmentManager"."DepartmentID" = "Departments"."DepartmentID"

--List the department of each employee with the following information: employee number, last name, first name, and department name.

Select "Employee"."EmployeeID","LastName","FirstName","Departments"."DepartmentName"
from "Employee" 
inner join "Dep_Emp" on "Employee"."EmployeeID" = "Dep_Emp"."EmployeeID"
inner join "Departments" on "Dep_Emp"."DepartmentID" = "Departments"."DepartmentID"

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select * from "Employee"

Select "FirstName","LastName","Gender"
from "Employee"
where "FirstName" = 'Hercules' and "LastName" like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select * from "Departments"

Select "Employee"."EmployeeID","LastName","FirstName","DepartmentName"
from "Employee" inner join "Dep_Emp"
on "Employee"."EmployeeID" = "Dep_Emp"."EmployeeID"
inner join "Departments" on "Departments"."DepartmentID" ="Dep_Emp"."DepartmentID"
where "DepartmentName"='Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select "Employee"."EmployeeID","LastName","FirstName","DepartmentName"
from "Employee" inner join "Dep_Emp"
on "Employee"."EmployeeID" = "Dep_Emp"."EmployeeID"
inner join "Departments" on "Departments"."DepartmentID" ="Dep_Emp"."DepartmentID"
where "DepartmentName"='Sales' OR "DepartmentName" = 'Development' 

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

Select "LastName",count("LastName") as FrequencyCount
from "Employee"
Group By "LastName" 
Order By FrequencyCount Desc

--Epilogue

select s.salary, t.title from Salaries as s join Employee as e on (s.EmployeeID = e.EmployeeID) 
join Title as t on (e.EmployeeTitleID = t.TitleID)
where e.EmployeeID = '499942'


