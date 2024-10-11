-- This script creates a table called 'students'
CREATE TABLE students (
	id SERIAL PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	email TEXT UNIQUE NOT NULL,
	school_enrollment_date DATE
	);

-- This script creates a table called 'professors'
CREATE TABLE professors (
	id SERIAL PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	department TEXT
	);

-- This script creates a table called 'courses'
CREATE TABLE courses (
	id SERIAL PRIMARY KEY,
	course_name TEXT,
	course_description TEXT,
	professor_id INT REFERENCES professors(id)
	);

-- This script creates a table called 'enrollments'
CREATE TABLE enrollments (
	student_id INT REFERENCES students(id),
	course_id INT REFERENCES courses(id),
	enrollment_date DATE,
	PRIMARY KEY (student_id, course_id)
	);

-- NOTE: I Collected data from ChatGPT
-- This script inserts data into the 'students' table
INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com', '2022-09-01'),
    ('Bob', 'Smith', 'bob.smith@example.com', '2021-09-01'),
    ('Charlie', 'Brown', 'charlie.brown@example.com', '2023-01-15'),
    ('Daisy', 'Miller', 'daisy.miller@example.com', '2022-03-21'),
    ('Eve', 'Taylor', 'eve.taylor@example.com', '2021-11-10');

-- This script inserts data into the 'professors' table
INSERT INTO professors (first_name, last_name, department)
VALUES
    ('John', 'Doe', 'Computer Science'),
    ('Jane', 'Adams', 'Mathematics'),
    ('Michael', 'Clark', 'Physics'),
    ('Emily', 'Davis', 'History');

-- This script inserts data into the 'courses' table
INSERT INTO courses (course_name, course_description, professor_id)
VALUES
    ('Data Structures', 'Introduction to Data Structures', 1),  -- Taught by John Doe
    ('Calculus', 'Basic concepts in calculus', 2),  -- Taught by Jane Adams
    ('Modern History', 'Study of 20th-century events', 4);  -- Taught by Emily Davis

-- This table inserts data into the 'enrolments' table
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2023-09-01'),  -- Alice in Data Structures
(2, 1, '2023-09-01'),  -- Bob in Data Structures
(3, 2, '2023-09-02'),  -- Charlie in Calculus
(4, 3, '2023-09-03'),  -- Daisy in Modern History
(5, 2, '2023-09-02');  -- Eve in Calculus

-- This script alters data into 'courses' table
UPDATE courses
SET course_name = 'Physics 101'
WHERE id = 3;

UPDATE courses
SET course_description = 'Introduction to Physics'
WHERE course_name = 'Physics 101';
