CREATE DATABASE school;
-- Switch to the new database
USE school;

-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    course_id INT
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

-- Insert data into students table
INSERT INTO students (student_id, first_name, last_name, course_id) VALUES
(1, 'Alice', 'Johnson', 101),
(2, 'Bob', 'Smith', 102),
(3, 'Charlie', 'Williams', NULL),
(4, 'David', 'Brown', 103);

-- Insert data into courses table
INSERT INTO courses (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'History');

-- Perform left join
SELECT 
    students.student_id,
    students.first_name,
    students.last_name,
    courses.course_name
FROM 
    students
LEFT JOIN 
    courses
ON 
    students.course_id = courses.course_id;


