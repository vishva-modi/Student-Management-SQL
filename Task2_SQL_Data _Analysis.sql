USE studentmanagement;
  
  SELECT * FROM students;
  
  -- create table for courses
  CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- create table for enrollment
CREATE TABLE enrollments (
  student_id INT,
  course_id INT,
  FOREIGN KEY (student_id)
REFERENCES students(StudentID),
  FOREIGN KEY (course_id)
REFERENCES courses(id)
);

-- insert data in course table
INSERT INTO courses VALUES
(1, "Database"),
(2, "Python"),
(3, "Java"),
(4, "Web Development");

SELECT StudentID, name  FROM students;

-- insert data into enrollments table
INSERT INTO enrollments
(student_id, course_id, grade)
VALUES
(1,1,88),
(2,2,75),
(3,3,91),
(4,4,82),
(5,1,39),
(6,2,85),
(7,3,78),
(8,4,95),
(9,1,35),
(10,2,90);

DESCRIBE enrollments;
ALTER TABLE enrollments
ADD grade INT;

-- Students enrolled in each course
SELECT s.Name AS Student_Name,
	   c.name AS Course_Name
FROM enrollments e
JOIN students s ON e.student_id = s.StudentID
JOIN courses c ON e.course_id = c.id;

-- Average grade per course
SELECT c.name AS Course_Name,
       AVG(e.grade) AS Average_Grade
FROM enrollments e
JOIN courses c ON e.course_id = c.id
GROUP BY c.name;

-- Top 3 students overall
SELECT s.Name,
       AVG(e.grade) AS Average_Grade
FROM enrollments e
JOIN students s ON e.student_id = s.StudentID
GROUP BY s.Name
ORDER BY Average_Grade DESC
LIMIT 3;

-- Count students who failed(grade<40)
SELECT COUNT(*) AS Failed_Students
FROM enrollments
WHERE grade < 40;










  
  