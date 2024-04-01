CREATE DATABASE school_mgm;
USE school_mgm;

-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    user_student_id INT UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address TEXT
);

-- Teachers table
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE
);

-- Subjects table
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100)
);

-- TeacherSubjects junction table (linking teachers to subjects)
CREATE TABLE TeacherSubjects (
    teacher_id INT,
    subject_id INT,
    PRIMARY KEY (teacher_id, subject_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    teacher_id INT,
    classroom_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
    -- classroom_id will be a foreign key once Classrooms table is defined
);

-- Classrooms table
CREATE TABLE Classrooms (
    classroom_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10),
    capacity INT
);

-- Update Courses table to add classroom_id as a foreign key
ALTER TABLE Courses
ADD FOREIGN KEY (classroom_id) REFERENCES Classrooms(classroom_id);

-- Enrollments table (junction table between Students and Courses)
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Parents table
CREATE TABLE Parents (
    parent_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);

-- StudentParents junction table (linking students to their parents/guardians)
CREATE TABLE StudentParents (
    student_id INT,
    parent_id INT,
    relationship VARCHAR(50),  -- e.g., "Mother", "Father", "Guardian", etc.
    PRIMARY KEY (student_id, parent_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (parent_id) REFERENCES Parents(parent_id)
);

CREATE TABLE Alerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    alert_type VARCHAR(50),  -- e.g., "Low Attendance", "Poor Performance", etc.
    alert_message TEXT,
    alert_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Students_Archive (
    archive_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,  -- Original ID of the student
    user_student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address TEXT,
    archived_date DATE  -- Date when the record was moved to the archive
);
CREATE TABLE StudentPerformance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    average_grade DECIMAL(5,2),  -- e.g., 89.50 for an 89.5% average grade
    total_courses_taken INT,
    total_courses_passed INT,
    total_courses_failed INT,
    attendance_percentage DECIMAL(5,2),  -- e.g., 95.00 for 95% attendance
    honors BOOLEAN DEFAULT FALSE,  -- e.g., if the student is on the honor roll
    academic_status ENUM('Good Standing', 'Probation', 'At Risk'),  -- based on grades or other criteria
    last_updated DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),  -- e.g., 89.50 for an 89.5% grade
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Attendance table
CREATE TABLE Attendance (
    student_id INT,
    course_id INT,
    attendance_date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    PRIMARY KEY (student_id, course_id, attendance_date),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Attendance Archive table for previous school years. 
CREATE TABLE Attendance_Archive LIKE Attendance;



-- Triggers-------------------------------------


DELIMITER $$
CREATE TRIGGER ArchiveDeletedStudent
BEFORE DELETE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO Students_Archive (student_id, user_student_id, first_name, last_name, date_of_birth, address, archived_date)
    VALUES (OLD.student_id, OLD.user_student_id, OLD.first_name, OLD.last_name, OLD.date_of_birth, OLD.address, CURDATE());
END;
$$
DELIMITER ;


DELIMITER //
CREATE TRIGGER CheckAttendanceAfterUpdate
AFTER UPDATE ON Attendance
FOR EACH ROW
BEGIN
    DECLARE attendance_percentage DECIMAL(5,2);
    
    -- Call the procedure to calculate attendance percentage
    SET attendance_percentage = CalculateAttendancePercentage(NEW.student_id);
    
    -- Check if the attendance percentage falls below 70%
    IF attendance_percentage < 70 THEN
        -- Insert an alert into the Alerts table
        INSERT INTO Alerts (student_id, alert_type, alert_message, alert_date)
        VALUES (NEW.student_id, 'Low Attendance', CONCAT('Attendance below 70%. Current attendance: ', attendance_percentage, '%'), CURDATE());
    END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER CheckGradeAfterUpdateOrInsert
AFTER INSERT ON Grades
FOR EACH ROW
BEGIN
    -- Check if the grade is below 60%
    IF NEW.grade < 60 THEN
        -- Insert an alert into the Alerts table
        INSERT INTO Alerts (student_id, alert_type, alert_message, alert_date)
        VALUES (NEW.student_id, 'Low Grade', CONCAT('Grade below 60%. Current grade: ', NEW.grade, '% in course ID ', NEW.course_id), CURDATE());
    END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER CheckGradeAfterUpdate
AFTER UPDATE ON Grades
FOR EACH ROW
BEGIN
    -- Check if the grade is below 60%
    IF NEW.grade < 60 THEN
        -- Insert an alert into the Alerts table
        INSERT INTO Alerts (student_id, alert_type, alert_message, alert_date)
        VALUES (NEW.student_id, 'Low Grade', CONCAT('Grade below 60%. Updated grade: ', NEW.grade, '% in course ID ', NEW.course_id), CURDATE());
    END IF;
END;
//
DELIMITER ;




