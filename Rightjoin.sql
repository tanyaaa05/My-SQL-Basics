CREATE DATABASE college;
-- Switch to the new database
USE college;


-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
-- Insert data into students table
INSERT INTO students (student_id, first_name, last_name, department_id) VALUES
(1, 'Anna', 'White', 101),
(2, 'Ben', 'Harris', 102),
(3, 'Chris', 'Green', NULL),
(4, 'Dana', 'Black', 103);

-- Insert data into departments table
INSERT INTO departments (department_id, department_name) VALUES
(101, 'Computer Science'),
(102, 'Business'),
(103, 'Engineering'),
(104, 'Arts');

-- Perform right join
SELECT 
    students.student_id,
    students.first_name,
    students.last_name,
    departments.department_id,
    departments.department_name
FROM 
    students
RIGHT JOIN 
    departments
ON 
    students.department_id = departments.department_id;

