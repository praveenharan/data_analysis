USE university_db;

-- Insert sample data into Students
INSERT INTO Students (student_name, email, major, enrollment_date) VALUES
('Alice Wonderland', 'alice.w@example.com', 'Computer Science', '2022-09-01'),
('Bob The Builder', 'bob.b@example.com', 'Engineering', '2022-09-01'),
('Charlie Chaplin', 'charlie.c@example.com', 'Film Studies', '2023-01-15'),
('Diana Ross', 'diana.r@example.com', 'Music', '2023-01-15'),
('Eve Harrington', 'eve.h@example.com', 'Drama', '2023-09-01'); -- Eve is not yet enrolled in any course

-- Insert sample data into Courses
INSERT INTO Courses (course_name, course_code, department, credits) VALUES
('Introduction to Programming', 'CS101', 'Computer Science', 3),
('Data Structures', 'CS201', 'Computer Science', 4),
('Calculus I', 'MA101', 'Mathematics', 3),
('Linear Algebra', 'MA201', 'Mathematics', 3),
('Thermodynamics', 'ENGR301', 'Engineering', 4),
('Film History', 'FLM101', 'Film Studies', 3),
('Music Theory I', 'MUS101', 'Music', 3);

-- Insert sample data into Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-09-05'), -- Alice in CS101
(1, 2, '2023-09-05'), -- Alice in CS201
(1, 3, '2023-09-05'), -- Alice in MA101
(2, 3, '2023-09-06'), -- Bob in MA101
(2, 5, '2023-09-06'), -- Bob in ENGR301
(3, 6, '2023-09-10'), -- Charlie in Film History
(4, 7, '2023-09-12'), -- Diana in Music Theory I
(2, 4, '2024-01-20'); -- Bob in MA201 (new semester)