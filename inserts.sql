INSERT INTO Students (user_student_id, first_name, last_name, date_of_birth, address) VALUES
(123456, 'Alice', 'Smith', '2005-04-10', '123 Maple Street'),
(234567, 'Bob', 'Johnson', '2006-05-12', '456 Oak Avenue'),
(345678, 'Charlie', 'Brown', '2005-09-15', '789 Pine Road'),
(100001, 'Alice', 'Johnson', '2005-01-15', '123 Maple St.'),
(100002, 'Brian', 'Smith', '2004-05-22', '456 Oak St.'),
(100003, 'Chloe', 'Davis', '2005-11-30', '789 Pine St.'),
(100004, 'David', 'Martinez', '2004-03-14', '321 Birch St.'),
(100005, 'Ella', 'Garcia', '2005-07-08', '654 Cedar St.'),
(100006, 'Felix', 'Brown', '2004-08-26', '987 Spruce St.'),
(100007, 'Grace', 'Jones', '2005-12-15', '135 Elm St.'),
(100008, 'Henry', 'Miller', '2004-04-03', '246 Aspen St.'),
(100009, 'Isla', 'Wilson', '2005-09-21', '369 Willow St.'),
(100010, 'Jake', 'Taylor', '2004-02-11', '147 Cherry St.'),
(100011, 'Kara', 'Anderson', '2005-05-19', '258 Poplar St.'),
(100012, 'Liam', 'Thomas', '2004-10-30', '369 Sycamore St.');

INSERT INTO Teachers (first_name, last_name, hire_date) VALUES
('John', 'Doe', '2010-08-25'),
('Jane', 'Doe', '2012-09-01'),
('Emily', 'White', '2015-01-15'),
('Jane', 'Smith', '2012-09-01'),
('Emily', 'White', '2015-01-15'),
('Mark', 'Brown', '2013-03-20'),
('Laura', 'Davis', '2014-05-22'),
('Peter', 'Miller', '2016-11-10'),
('Sarah', 'Wilson', '2011-02-09'),
('Daniel', 'Taylor', '2017-08-30'),
('Olivia', 'Lee', '2018-01-25'),
('James', 'Harris', '2019-03-15'),
('Sophia', 'Martin', '2010-07-19'),
('Michael', 'Clark', '2012-10-11');

INSERT INTO Subjects (subject_name) VALUES
('Mathematics'),
('Science'),
('History'),
('English'),
('Art'),
('Music'),
('Physical Education'),
('Biology'),
('Chemistry'),
('Physics'),
('Literature'),
('Geography');


INSERT INTO TeacherSubjects (teacher_id, subject_id) VALUES
(1, 1), 
(2, 2),  
(3, 3),  
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(1, 2),
(2, 3),
(3, 4);


INSERT INTO Classrooms (room_number, capacity) VALUES
('101', 30),
('102', 30),
('103', 20),
('104', 30),
('105', 25),
('106', 20),
('107', 30),
('108', 25),
('109', 20),
('110', 30),
('111', 25),
('112', 20);


INSERT INTO Courses (course_name, teacher_id, classroom_id) VALUES
('Algebra I', 1, 1),
('Biology', 2, 2),
('World History', 3, 3),
('English Literature', 4, 4),
('Introduction to Art', 5, 5),
('Music Theory', 6, 6),
('Physical Education', 7, 7),
('Advanced Biology', 8, 8),
('Organic Chemistry', 9, 9),
('Physics I', 10, 10),
('American Literature', 11, 11),
('World Geography', 12, 12);

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-09-01'),
(1, 2, '2023-09-01'),
(2, 1, '2023-09-01'),
(2, 2, '2023-01-10'),
(3, 3, '2023-01-10'),
(2, 3, '2023-01-10'),
(1, 4, '2023-01-10'),
(2, 4, '2023-01-10'),
(3, 5, '2023-01-10'),
(4, 6, '2023-01-10'),
(5, 7, '2023-01-10'),
(6, 8, '2023-01-10'),
(7, 9, '2023-01-10'),
(8, 10, '2023-01-10'),
(9, 11, '2023-01-10'),
(10, 12, '2023-01-10'),
(11, 10, '2023-01-10'),
(12, 11, '2023-01-10');


INSERT INTO Parents (first_name, last_name, phone_number, email, address) VALUES
('Sarah', 'Smith', '555-1234', 'sarah.smith@email.com', '123 Maple Street'),
('Robert', 'Johnson', '555-5678', 'robert.johnson@email.com', '456 Oak Avenue'),
('Sarah', 'Johnson', '555-1234', 'sarah.johnson@email.com', '123 Maple St.'),
('Robert', 'Smith', '555-5678', 'robert.smith@email.com', '456 Oak St.'),
('Emily', 'Davis', '555-9012', 'emily.davis@email.com', '789 Pine St.'),
('Michael', 'Martinez', '555-3456', 'michael.martinez@email.com', '321 Birch St.'),
('Laura', 'Garcia', '555-7890', 'laura.garcia@email.com', '654 Cedar St.'),
('Peter', 'Brown', '555-2345', 'peter.brown@email.com', '987 Spruce St.'),
('Anna', 'Jones', '555-6789', 'anna.jones@email.com', '135 Elm St.'),
('David', 'Miller', '555-4321', 'david.miller@email.com', '246 Aspen St.'),
('Olivia', 'Wilson', '555-8765', 'olivia.wilson@email.com', '8417 Germann rd.');


INSERT INTO StudentParents (student_id, parent_id, relationship) VALUES
(1, 1, 'Mother'),
(2, 2, 'Father'),
(3, 1, 'Mother'),
(4, 3, 'Father'),
(5, 4, 'Mother'),
(6, 5, 'Father'),
(7, 6, 'Mother'),
(8, 7, 'Father'),
(9, 8, 'Mother'),
(10, 9, 'Father'),
(11, 10, 'Mother'),
(12, 11, 'Father');


INSERT INTO Grades (student_id, course_id, grade) VALUES
(1, 1, 88.5),
(1, 2, 92.0),
(3, 3, 75.0),
(4, 4, 88.0),
(5, 5, 92.5),
(6, 6, 79.0),
(7, 7, 95.0),
(8, 8, 80.5),
(9, 9, 85.0),
(10, 10, 91.0),
(11, 11, 87.5),
(12, 12, 78.0),
(1, 7, 82.0),
(2, 8, 89.0),
(3, 9, 76.5);

INSERT INTO Attendance (student_id, course_id, attendance_date, status) VALUES
(1, 1, '2023-01-15', 'Present'),
(1, 1, '2023-01-22', 'Absent'),
(1, 2, '2023-01-15', 'Present'),
(1, 2, '2023-01-22', 'Present'),
(1, 1, '2023-01-10', 'Present'),
(2, 2, '2023-01-10', 'Present'),
(3, 3, '2023-01-10', 'Absent'),
(4, 4, '2023-01-10', 'Present'),
(5, 5, '2023-01-10', 'Late'),
(6, 6, '2023-01-10', 'Present'),
(7, 7, '2023-01-10', 'Present'),
(8, 8, '2023-01-10', 'Absent'),
(9, 9, '2023-01-10', 'Present'),
(10, 10, '2023-01-10', 'Late'),
(11, 11, '2023-01-10', 'Present'),
(12, 12, '2023-01-10', 'Present'),
(1, 2, '2023-01-10', 'Present'),
(2, 3, '2023-01-10', 'Absent'),
(3, 4, '2023-01-10', 'Present');


