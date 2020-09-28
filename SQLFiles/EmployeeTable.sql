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
    "DepartmentID" varchar(30)   NOT NULL,
    "DepartmentName" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DepartmentID"
     )
);

CREATE TABLE "Dep_Emp" (
    "DepartmentID" varchar(30)   NOT NULL,
    "EmployeeID" varchar(30)   NOT NULL
);

CREATE TABLE "Salaries" (
    "SalaryID" int   NOT NULL,
    "Salary" int   NOT NULL,
    "EmployeeID" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "SalaryID"
     )
);

CREATE TABLE "Title" (
    "TitleID" int   NOT NULL,
    "Title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "TitleID"
     )
);

CREATE TABLE "DepartmentManager" (
    "EmployeeID" varchar(30)   NOT NULL,
    "DepartmentID" varchar(30)   NOT NULL
);

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");

