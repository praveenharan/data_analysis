# University Course Management System Analysis

## Project Overview
This project demonstrates foundational SQL skills by modeling a simplified university course management system. 
It involves creating a relational database, populating it with sample data, and executing analytical queries to gain insights into student enrollments and course popularity.

## Database Schema
The project utilizes three core tables to manage university data:
1.  **`Students`**: Stores information about individual students.
2.  **`Courses`**: Contains details about the academic courses offered.
3.  **`Enrollments`**: Records which students are enrolled in which courses, acting as a many-to-many relationship table.

Entity	Attribute	Type/Key	Description	
Students	student_id	PK	Unique identifier for students	
	student_name		Full name of the student	
	email		Student's email address	
	major		Academic major of the student	
Enrollments	enrollment_id	PK	Unique identifier for enrollments	
	student_id	FK	Links to the Students table	
	course_id	FK	Links to the Courses table	
	enrollment_date		Date the student enrolled	
Courses	course_id	PK	Unique identifier for courses	
	course_name		Name of the course	
	department		Department offering the course	
	credits		Number of credits awarded	
