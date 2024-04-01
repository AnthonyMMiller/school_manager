-- Summary of each student's performance
CREATE VIEW StudentPerformanceSummary AS
SELECT 
    s.student_id,
    s.user_student_id,
    s.first_name,
    s.last_name,
    AVG(g.grade) AS average_grade,
    (SELECT COUNT(*) FROM Attendance a WHERE a.student_id = s.student_id AND a.status = 'Present') / 
    (SELECT COUNT(*) FROM Attendance a WHERE a.student_id = s.student_id) * 100 AS attendance_rate,
    COUNT(e.course_id) AS courses_enrolled
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Grades g ON s.student_id = g.student_id
GROUP BY 
    s.student_id;


-- Detailed information
CREATE VIEW CourseEnrollmentDetails AS
SELECT 
    c.course_id,
    c.course_name,
    t.first_name AS teacher_first_name,
    t.last_name AS teacher_last_name,
    COUNT(e.student_id) AS number_of_students
FROM 
    Courses c
JOIN 
    Teachers t ON c.teacher_id = t.teacher_id
JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_id;
