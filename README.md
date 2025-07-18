# University Course Management System Analysis

## Project Overview
This project demonstrates foundational SQL skills by modeling a simplified university course management system. 
It involves creating a relational database, populating it with sample data, and executing analytical queries to gain insights into student enrollments and course popularity.

## Database Schema
The project utilizes three core tables to manage university data:
1.  **`Students`**: Stores information about individual students.
2.  **`Courses`**: Contains details about the academic courses offered.
3.  **`Enrollments`**: Records which students are enrolled in which courses, acting as a many-to-many relationship table.

| Entity        | Attribute          | Type/Key      | Description                     |
| :------------ | :----------------- | :------------ | :------------------------------ |
| **Students** | student_id         | PK            | Unique identifier for students  |
|               | student_name       |               | Full name of the student        |
|               | email              |               | Student's email address         |
|               | major              |               | Academic major of the student   |
| **Enrollments** | enrollment_id      | PK            | Unique identifier for enrollments |
|               | student_id         | FK            | Links to the Students table     |
|               | course_id          | FK            | Links to the Courses table      |
|               | enrollment_date    |               | Date the student enrolled       |
| **Courses** | course_id          | PK            | Unique identifier for courses   |
|               | course_name        |               | Name of the course              |
|               | department         |               | Department offering the course  |
|               | credits            |               | Number of credits awarded       |

## Files in this Repository

* `db_schema.sql`: SQL script to define and create the database tables.
* `sample_data.sql`: SQL script to insert illustrative sample data into the tables.
* `analysis_queries.sql`: SQL queries designed to extract meaningful insights from the data.

## How to Set Up and Run

### Prerequisites
* These scripts use general SQL syntax and have been verified to work correctly within SSMS (SQL Server Management Studio).

### Steps
1.  **Create the Database:**
    -- Check if the database `university_db` already exists
    
    `IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'university_db')`

    `BEGIN`
    -- If it does not exist, create the database

    `CREATE DATABASE university_db;`
    `END;`

3.  **Create Tables:**
    Execute the `db_schema.sql` file. This will set up the `Students`, `Courses`, and `Enrollments` tables.
    
4.  **Insert Sample Data:**
    Execute the `sample_data.sql` file. This will populate tables with example records.
    
5.  **Run Analysis Queries:**
    Open `analysis_queries.sql` in your SQL client. Execute the queries one by one to see the analytical results.

## Analysis Examples (from `analysis_queries.sql`)

* **Total Number of Students and Courses:** Basic counts for system overview.
* **Courses with Most Enrollments:** Identifies popular courses.
* **Students and Their Enrolled Courses:** Lists each student and the courses they are taking.
* **Students Not Enrolled in Any Course:** Helps identify inactive student records.
* **Enrollment Count Per Department:** Aggregates enrollments by academic department.
* **Average Credits Enrolled Per Student:** Calculates the average credit load.
---
