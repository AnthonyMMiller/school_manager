DELIMITER //

CREATE EVENT IF NOT EXISTS ArchiveAnnualAttendance
ON SCHEDULE EVERY 1 YEAR
STARTS '2024-07-01 00:00:00'  
DO
    BEGIN
        -- Insert old attendance records into the archive table
        INSERT INTO Attendance_Archive
        SELECT * FROM Attendance
        WHERE attendance_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

        -- Delete old records from the main table
        DELETE FROM Attendance
        WHERE attendance_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
    END;

//
DELIMITER ;
