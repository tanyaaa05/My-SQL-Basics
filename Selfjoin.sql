CREATE DATABASE company;

-- Switch to the new database
USE company;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    manager_id INT
);

-- Insert data into employees table
INSERT INTO employees (employee_id, first_name, last_name, manager_id) VALUES
(1, 'Alice', 'Johnson', NULL),
(2, 'Bob', 'Smith', 1),
(3, 'Charlie', 'Williams', 1),
(4, 'David', 'Brown', 2),
(5, 'Eve', 'Davis', 2);

-- Perform self join
SELECT 
    e1.employee_id AS EmployeeID,
    e1.first_name AS EmployeeFirstName,
    e1.last_name AS EmployeeLastName,
    e2.employee_id AS ManagerID,
    e2.first_name AS ManagerFirstName,
    e2.last_name AS ManagerLastName
FROM 
    employees e1
LEFT JOIN 
    employees e2
ON 
    e1.manager_id = e2.employee_id;

