CREATE DATABASE Case_Sample_db;

USE Case_Sample_db;

-- Create Pupil table
CREATE TABLE  Pupil(
    Pupil_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade DECIMAL(3, 1)
);

-- Insert data into Pupil table
INSERT INTO  Pupil ( Pupil_id, first_name, last_name, age, grade) VALUES
(1, 'John', 'Doe', 18, 85.5),
(2, 'Jane', 'Smith', 17, 90.0),
(3, 'Michael', 'Johnson', 16, 75.0),
(4, 'Emily', 'Brown', 18, 92.5),
(5, 'David', 'Wilson', 17, 88.0);

-- Select Pupil_id, first_name, last_name, grade, and categorize students based on grade
SELECT 
    Pupil_id,
    first_name,
    last_name,
    grade,
    CASE
        WHEN grade >= 90.0 THEN 'A'
        WHEN grade >= 80.0 THEN 'B'
        WHEN grade >= 70.0 THEN 'C'
        ELSE 'F'
    END AS grade_category
FROM 
    Pupil;

