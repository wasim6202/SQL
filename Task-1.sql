CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50),
    CourseID INT
);
CREATE TABLE Courses (
    CourseID INT,
    CourseName VARCHAR(50)
);
-- Students data
INSERT INTO Students VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL),
(4, 'David', 104);

-- Courses data
INSERT INTO Courses VALUES
(101, 'Mathematics'),
(102, 'Physics'),
(103, 'Chemistry');
-- inner Join
SELECT s.StudentName, c.CourseName
FROM Students s
INNER JOIN Courses c
ON s.CourseID = c.CourseID;
-- Left Join
SELECT s.StudentName, c.CourseName
FROM Students s
LEFT JOIN Courses c
ON s.CourseID = c.CourseID;
-- Right Join
SELECT s.StudentName, c.CourseName
FROM Students s
RIGHT JOIN Courses c
ON s.CourseID = c.CourseID;
-- Full Outer Join
SELECT s.StudentName, c.CourseName
FROM Students s
LEFT JOIN Courses c ON s.CourseID = c.CourseID
UNION
SELECT s.StudentName, c.CourseName
FROM Students s
RIGHT JOIN Courses c ON s.CourseID = c.CourseID;
