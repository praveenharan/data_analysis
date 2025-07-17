-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS university_db;

-- Use the newly created database
USE university_db;

-- 1. Students Table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    major VARCHAR(100),
    enrollment_date DATE NOT NULL
);

-- 2. Courses Table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    department VARCHAR(100),
    credits INT NOT NULL
);

-- 3. Enrollments Table (Many-to-Many relationship between Students and Courses)
CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    -- Ensure a student can't enroll in the same course multiple times
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Add indexes for performance on frequently queried columns
CREATE INDEX idx_student_id ON Enrollments(student_id);
CREATE INDEX idx_course_id ON Enrollments(course_id);
CREATE INDEX idx_enrollment_date ON Enrollments(enrollment_date);