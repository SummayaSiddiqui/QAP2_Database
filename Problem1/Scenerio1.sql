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