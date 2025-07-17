USE university_db;

-- 1. Get the total number of students
SELECT COUNT(*) AS total_students FROM Students;

-- 2. Get the total number of courses
SELECT COUNT(*) AS total_courses FROM Courses;

-- 3. Get the total number of enrollments
SELECT COUNT(*) AS total_enrollments FROM Enrollments;

-- 4. Find the top 3 most enrolled courses (by number of students)
SELECT
    C.course_name,
    C.course_code,
    COUNT(E.student_id) AS number_of_enrollments
FROM
    Courses C
JOIN
    Enrollments E ON C.course_id = E.course_id
GROUP BY
    C.course_name, C.course_code
ORDER BY
    number_of_enrollments DESC
LIMIT 3;

-- 5. List all students and the courses they are enrolled in
--    (Includes students not enrolled in any course)
SELECT
    S.student_name,
    S.major,
    COALESCE(C.course_name, 'Not Enrolled in Any Course') AS enrolled_course,
    COALESCE(C.department, 'N/A') AS course_department
FROM
    Students S
LEFT JOIN
    Enrollments E ON S.student_id = E.student_id
LEFT JOIN
    Courses C ON E.course_id = C.course_id
ORDER BY
    S.student_name, C.course_name;

-- 6. Find students who are not enrolled in any course
SELECT
    S.student_name,
    S.email,
    S.major
FROM
    Students S
LEFT JOIN
    Enrollments E ON S.student_id = E.student_id
WHERE
    E.enrollment_id IS NULL;

-- 7. Calculate the total credits each student is currently enrolled in
SELECT
    S.student_name,
    S.major,
    SUM(C.credits) AS total_credits_enrolled
FROM
    Students S
JOIN
    Enrollments E ON S.student_id = E.student_id
JOIN
    Courses C ON E.course_id = C.course_id
GROUP BY
    S.student_name, S.major
ORDER BY
    total_credits_enrolled DESC;

-- 8. Count the number of enrollments per department
SELECT
    C.department,
    COUNT(E.enrollment_id) AS total_enrollments_in_department
FROM
    Courses C
JOIN
    Enrollments E ON C.course_id = E.course_id
GROUP BY
    C.department
ORDER BY
    total_enrollments_in_department DESC;

-- 9. Find courses that have no enrollments (e.g., new courses, unpopular courses)
SELECT
    C.course_name,
    C.course_code,
    C.department
FROM
    Courses C
LEFT JOIN
    Enrollments E ON C.course_id = E.course_id
WHERE
    E.enrollment_id IS NULL;

-- 10. Get the average number of courses each enrolled student takes
SELECT
    AVG(courses_taken) AS average_courses_per_student
FROM (
    SELECT
        COUNT(E.course_id) AS courses_taken
    FROM
        Students S
    JOIN
        Enrollments E ON S.student_id = E.student_id
    GROUP BY
        S.student_id
) AS student_course_counts;
