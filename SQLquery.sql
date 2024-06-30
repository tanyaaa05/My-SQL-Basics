-- Create a new database named demo_query
CREATE DATABASE demo_query;

-- Switch to the new database
USE demo_query;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert data into employees table
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES
(1, 'John', 'Doe', 1, 50000.00),
(2, 'Jane', 'Smith', 2, 60000.00),
(3, 'Michael', 'Johnson', 1, 55000.00),
(4, 'Emily', 'Brown', 3, 65000.00),
(5, 'David', 'Wilson', 2, 62000.00);

-- Insert data into departments table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering');

-- (1). Using an Inner Query to Find Employees in HR Department
-- Inner query: Selecting employee_ids from employees table for employees in HR department
SELECT employee_id
FROM employees
WHERE department_id = (
    -- Outer query: Selecting department_id for 'HR' department from departments table
    SELECT department_id
    FROM departments
    WHERE department_name = 'HR'
);

-- (2). Using an Outer Query to List Employees with Salaries Greater Than Average
-- Outer query: Selecting all employees with salaries greater than the average salary
SELECT *
FROM employees
WHERE salary > (
    -- Inner query: Calculating average salary
    SELECT AVG(salary)
    FROM employees
);


