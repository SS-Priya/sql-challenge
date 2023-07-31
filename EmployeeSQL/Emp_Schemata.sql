
CREATE TABLE titles (
    title_id VARCHAR(15)  NOT NULL,
    title VARCHAR(20),
    PRIMARY KEY (title_id)
);

CREATE TABLE employee_details (
    emp_no INTEGER   NOT NULL,
    emp_title VARCHAR(20) NOT NULL,
    birth_date VARCHAR(15),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    sex VARCHAR(5),
    hire_date VARCHAR(15),
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
	
);

CREATE TABLE salary_details(
    emp_no INTEGER NOT NULL,
    salary INTEGER,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employee_details(emp_no)
     
);

CREATE TABLE departments (
    dept_no VARCHAR(15)   NOT NULL,
    dept_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (dept_no)
	
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(15)  NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
    emp_no INTEGER   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employee_details(emp_no),
    PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employee_details(emp_no),
    dept_no VARCHAR(15) NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no,dept_no)
    
);

