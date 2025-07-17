# University Course Management System Analysis

## Project Overview
This project demonstrates foundational SQL skills by modeling a simplified university course management system. 
It involves creating a relational database, populating it with sample data, and executing analytical queries to gain insights into student enrollments and course popularity.

## Database Schema
The project utilizes three core tables to manage university data:
1.  **`Students`**: Stores information about individual students.
2.  **`Courses`**: Contains details about the academic courses offered.
3.  **`Enrollments`**: Records which students are enrolled in which courses, acting as a many-to-many relationship table.

### Entity-Relationship Diagram (Conceptual)
+-----------+        +-------------+            +----------+
|  Students |        | Enrollments |            |  Courses |
+-----------+        +-------------+            +----------+
| student_id PK|     <---+enrollment_id PK|     | course_id PK|
| student_name|      |student_id FK+---->|      |course_name|
| email       |      |course_id FK+---->|       |department |
| major       |      |enrollment_date|          |credits   |
+-----------+        +-------------+            +----------+
