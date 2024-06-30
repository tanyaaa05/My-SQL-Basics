CREATE DATABASE employee;
-- Switch to the new database
USE employee;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert data into employees table
INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(1, 'John', 'Doe', 101),
(2, 'Jane', 'Smith', 102),
(3, 'Emily', 'Jones', 101),
(4, 'Michael', 'Brown', 103);

-- Insert data into departments table
INSERT INTO departments (department_id, department_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'Engineering');

-- Perform inner join
SELECT 
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    departments.department_name
FROM 
    employees
INNER JOIN 
    departments
ON 
    employees.department_id = departments.department_id;

