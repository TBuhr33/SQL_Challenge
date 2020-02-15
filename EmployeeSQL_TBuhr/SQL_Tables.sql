CREATE TABLE Departments (
    "dept_no" VARCHAR primary key NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);

CREATE TABLE Employees (
    "emp_no" int primary key  NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "birth_date" date   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" date   NOT NULL
);

CREATE TABLE Employee_Dept (
    "emp_no" int  NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
	foreign key (dept_no) references Departments (dept_no),
	foreign key (emp_no) references Employees (emp_no)
);

CREATE TABLE Manager (
    "dept_no" VARCHAR   NOT NULL,
	"emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
	foreign key (dept_no) references Departments (dept_no),
	foreign key (emp_no) references Employees (emp_no)
);

CREATE TABLE Salaries (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
	foreign key (emp_no) references Employees (emp_no)
);

CREATE TABLE Titles (
    "emp_no" int   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
	foreign key (emp_no) references Employees (emp_no)
);