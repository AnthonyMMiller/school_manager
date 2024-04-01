-- student grades and attendance report
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    e.enrollment_date,
    g.grade,
    a.attendance_date,
    a.status AS attendance_status
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
LEFT JOIN 
    Grades g ON s.student_id = g.student_id AND c.course_id = g.course_id
LEFT JOIN 
    Attendance a ON s.student_id = a.student_id AND c.course_id = a.course_id
WHERE 
   s.user_student_id = 123456 #[SpecificUserStudentID]
ORDER BY 
    c.course_name, a.attendance_date;

*************************************************************************************************************************

-- Teachers information (name, subjects taught, hire date, work aniversary, and years of experience)
SELECT 
    t.teacher_id,
    t.first_name,
    t.last_name,
    GROUP_CONCAT(sub.subject_name SEPARATOR ', ') AS subjects_taught,
    t.hire_date,
    DATE_FORMAT(t.hire_date, '%M %d') AS work_anniversary,
    TIMESTAMPDIFF(YEAR, t.hire_date, CURDATE()) AS years_of_experience
FROM 
    Teachers t
JOIN 
    TeacherSubjects ts ON t.teacher_id = ts.teacher_id
JOIN 
    Subjects sub ON ts.subject_id = sub.subject_id
GROUP BY 
    t.teacher_id
ORDER BY 
    t.teacher_id;

*************************************************************************************************************************

-- See the number of students enrolled in a course, room number, capacity number and precentage used. 
SELECT 
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS number_of_students_enrolled,
    cl.room_number,
    cl.capacity,
    COUNT(e.student_id) / cl.capacity * 100 AS percent_capacity_used
FROM 
    Enrollments e
JOIN 
    Courses c ON e.course_id = c.course_id
JOIN 
    Classrooms cl ON c.classroom_id = cl.classroom_id
GROUP BY 
    c.course_id
ORDER BY 
    c.course_id;

***********************************************************************************************************

-- Search parents info using student user ID. 

SELECT 
    s.user_student_id,
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    p.first_name AS parent_first_name,
    p.last_name AS parent_last_name,
    p.phone_number,
    p.email,
    p.address
FROM 
    Students s
JOIN 
    StudentParents sp ON s.student_id = sp.student_id
JOIN 
    Parents p ON sp.parent_id = p.parent_id
WHERE 
    s.user_student_id = 123456; #[SpecificUserStudentID]

*******************************************************************************************************

-- View students performance as a collective.
SELECT 
    s.student_id,
    s.user_student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    g.grade,
    CASE 
        WHEN g.grade < 70 THEN 'Poor Performer'
        WHEN g.grade >= 90 THEN 'Top Performer'
        ELSE 'Average Performer'
    END AS performance_category
FROM 
    Students s
JOIN 
    Grades g ON s.student_id = g.student_id
JOIN 
    Courses c ON g.course_id = c.course_id
ORDER BY 
    s.student_id, c.course_id;


********************************************
-- Update Students address
UPDATE Students
SET address = 'New Address'
WHERE student_id = 100002 #[SpecificStudentID];

*****************************************
-- update teachers subjects they teach. 
UPDATE TeacherSubjects
SET subject_id = [NewSubjectID]
WHERE teacher_id = 100007 #[SpecificTeacherID];


*************************************
-- Update classroom
UPDATE Courses
SET classroom_id = 15 #[NewClassroomID]
WHERE course_id = 11 #[SpecificCourseID];

**************************************
-- Update students grade
UPDATE Grades
SET grade = 77 #[NewGrade]
WHERE student_id = 100010 /*[SpecificStudentID]*/ AND course_id = 18 #[SpecificCourseID];

***********************************
-- Delete enrollment
DELETE FROM Enrollments
WHERE student_id = 345678 /*[SpecificStudentID]*/ AND course_id = 3 #[SpecificCourseID];

********************************************
-- Delete teacher (would be better to archive into another table time permitting)
DELETE FROM Teachers
WHERE teacher_id = 8 #[SpecificTeacherID];

************************************
-- Delete course
DELETE FROM Courses
WHERE course_id = 12 #[SpecificCourseID];

**************************************
-- Comprehensive query that uses many tables
SELECT 
    c.course_id,
    c.course_name,
    t.first_name AS teacher_first_name,
    t.last_name AS teacher_last_name,
    cl.room_number,
    cl.capacity,
    COUNT(e.student_id) AS number_of_students_enrolled
FROM 
    Courses c
JOIN 
    Teachers t ON c.teacher_id = t.teacher_id
JOIN 
    Classrooms cl ON c.classroom_id = cl.classroom_id
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_id

*************************************************
-- Query that uses sub query. Shows students with above average enrollments.
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    COUNT(e.course_id) AS courses_enrolled
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
GROUP BY 
    s.student_id
HAVING 
    COUNT(e.course_id) > (SELECT AVG(course_count) FROM (SELECT COUNT(course_id) AS course_count FROM Enrollments GROUP BY student_id) AS avg_courses)



