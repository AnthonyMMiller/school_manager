# school_manager
MySQL School Management database. 

# MySQL School Management System Database version 1.0
<img width="895" alt="final_schema" src="https://github.com/AnthonyMMiller/school_manager/assets/39473837/855b5fbb-1b72-4a04-9c1c-91e9db304fd6">

Objective: Create a database that can be used by schools to manage its students and teachers. When paired with a GUI, can make it easy to enroll students, check grades, check attendance, etc. This boiler plate can be easily expanded to include more functionality. 

**Overview**
This MySQL database is designed for educational institutions to efficiently manage and track students, classrooms, teachers, and parents. It facilitates the storage, retrieval, and manipulation of data related to the academic and administrative aspects of school operations.

**Features**
Student Tracking: Manage student details including personal information, academic records, and classroom assignments.
Classroom Management: Organize classrooms, including class schedules, assigned teachers, and enrolled students.
Teacher Records: Maintain comprehensive records of teachers, including their personal details, qualifications, and assigned classes.
Parent Information: Store and manage parent or guardian details, linked to their respective students for easy communication and updates.
Database Structure
The database consists of the following main tables:

Students: Stores student details such as name, age, grade, and classroom ID.
Classrooms: Contains information about each classroom including classroom ID, name, and capacity.
Teachers: Holds records of teachers including their name, subject specialties, and contact information.
Parents: Maintains parent or guardian details linked to students.
Classroom_Assignments: A junction table that links students to classrooms and assigned teachers.
Getting Started
Prerequisites
MySQL Server (5.7 or later)
MySQL Workbench or any MySQL client for database interaction
Installation
Clone or download the repository to your local machine.

Open MySQL Workbench and connect to your MySQL server.

Create a new schema for the school management system:
CREATE DATABASE SchoolManagementSystem;
USE SchoolManagementSystem;

Import the school_management_system.sql file provided in the repository to set up the database structure and initial data (if any).

In MySQL Workbench, you can do this by selecting Server > Data Import and then navigating to the location of the .sql file.

Basic Usage
Adding a New Student
INSERT INTO Students (name, age, grade, classroom_id) VALUES ('John Doe', 10, 5, 1);

Assigning a Teacher to a Classroom
INSERT INTO Classroom_Assignments (classroom_id, teacher_id) VALUES (1, 1);

Retrieving All Students in a Classroom
SELECT Students.name FROM Students
JOIN Classroom_Assignments ON Students.classroom_id = Classroom_Assignments.classroom_id
WHERE Classroom_Assignments.classroom_id = 1;

Useful functions: 
GetAverageGrade(student_id INT) can used a students grades and calculate the average grade.
GetAttendancePercentage(student_id INT) can be used to see an attendance percentage for a student. 

Useful Views:
StudentPerformanceSummary Performance summary for all students. 
CourseEnrollmentDetail Check all of your enrollments at a glance. 

Other features:
Alerts table can be used to send notifcations.

Contributing
Contributions to the School Management System database are welcome. Please feel free to fork the repository, make your changes, and submit a pull request.

License
None

Contact
For any queries or further assistance, please contact ammdatasolutions@gmail.com
