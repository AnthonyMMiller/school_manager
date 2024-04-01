-- Functino to calculate students average grade
DELIMITER //
CREATE FUNCTION GetAverageGrade(student_id INT) RETURNS DECIMAL(5,2)
BEGIN
    DECLARE avg_grade DECIMAL(5,2);
    SELECT AVG(grade) INTO avg_grade FROM Grades WHERE student_id = student_id;
    RETURN avg_grade;
END //
DELIMITER ;

-- Function to see attendance as a percentage
DELIMITER //
CREATE FUNCTION GetAttendancePercentage(student_id INT) RETURNS DECIMAL(5,2)
BEGIN
    DECLARE total_classes INT;
    DECLARE attended_classes INT;
    SELECT COUNT(*) INTO total_classes FROM Attendance WHERE student_id = student_id;
    SELECT COUNT(*) INTO attended_classes FROM Attendance WHERE student_id = student_id AND status = 'Present';
    IF total_classes = 0 THEN
        RETURN 0;
    ELSE
        RETURN (attended_classes / total_classes) * 100;
    END IF;
END //
DELIMITER ;

-- Proceedure to enroll student. 
DELIMITER //
CREATE PROCEDURE EnrollStudent(IN student_id INT, IN course_id INT)
BEGIN
    INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES (student_id, course_id, CURDATE());
END //
DELIMITER ;

-- Procedure to update a students grade
DELIMITER //
CREATE PROCEDURE UpdateStudentGrade(IN student_id INT, IN course_id INT, IN new_grade DECIMAL(5,2))
BEGIN
    UPDATE Grades SET grade = new_grade WHERE student_id = student_id AND course_id = course_id;
END //
DELIMITER ;

