# Database : university_db
## Tables: students, courses, enrollments

### Check if the database 'university_db' already exists

```sql
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'university_db')
BEGIN
    -- If it does not exist, create the database
    CREATE DATABASE university_db
END;
```
### Use the newly created database
```sql
USE university_db
```
**1. students Table**
```sql
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'students')
BEGIN
    CREATE TABLE students (
        student_id INT PRIMARY KEY IDENTITY(1,1), -- SQL Server equivalent of AUTO_INCREMENT
        student_name VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        major VARCHAR(100),
        enrollment_date DATE NOT NULL
    );
END;
```

**2. courses Table**
```sql
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'courses')
BEGIN
    CREATE TABLE courses (
        course_id INT PRIMARY KEY IDENTITY(1,1), -- SQL Server equivalent of AUTO_INCREMENT
        course_name VARCHAR(255) NOT NULL,
        course_code VARCHAR(20) UNIQUE NOT NULL,
        department VARCHAR(100),
        credits INT NOT NULL
    );
END;
```
**3. enrollments Table (Many-to-Many relationship between students and courses)**
```sql
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'enrollments')
BEGIN
    CREATE TABLE enrollments (
        enrollment_id INT PRIMARY KEY IDENTITY(1,1), -- SQL Server equivalent of AUTO_INCREMENT
        student_id INT NOT NULL,
        course_id INT NOT NULL,
        enrollment_date DATE NOT NULL,
        -- Ensure a student can't enroll in the same course multiple times
        UNIQUE (student_id, course_id),
        FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
        FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
    );
END;
```
**Add indexes for performance on frequently queried columns**
```sql
-- Check if index exists before creating
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'idx_student_id' AND
        object_id = OBJECT_ID('Enrollments')
)
BEGIN
    CREATE INDEX idx_student_id ON Enrollments(student_id);
END;
```
```sql
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'idx_course_id' AND
        object_id = OBJECT_ID('Enrollments')
)
BEGIN
    CREATE INDEX idx_course_id ON Enrollments(course_id);
END;
```
```sql
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'idx_enrollment_date' AND
        object_id = OBJECT_ID('Enrollments')
)
BEGIN
    CREATE INDEX idx_enrollment_date ON Enrollments(enrollment_date);
END;
```
