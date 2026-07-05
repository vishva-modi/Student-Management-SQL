CREATE DATABASE StudentManagement;
USE StudentManagement;

CREATE TABLE Students (
  StudentID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(50),
  Gender CHAR(1),
  Age INT,
  Grade VARCHAR(2),
  MathsScore INT,
  ScienceScore INT,
  EnglishScore INT
);

SHOW TABLES;

INSERT INTO Students
(Name, Gender, Age, Grade, MathsScore, ScienceScore, EnglishScore)
VALUES
('Vishva','F',20,'A',85,70,90),
('Meet','M',20,'A',75,80,90),
('Saxi','F',19,'A',65,78,92),
('Yashvi','F',18,'A',84,75,80),
('Neha','F',21,'A',80,75,91),
('Rahul','M',20,'A',84,80,60),
('Arjun','M',19,'A',45,80,90),
('Kavya','F',19,'A',75,70,50),
('Pooja','F',20,'A',75,79,97),
('Rohan','M',18,'A',86,70,60);

SELECT * FROM Students;

-- Calculate Average Score
SELECT 
AVG(MathsScore),
AVG(ScienceScore),
AVG(EnglishScore)
FROM Students;

-- Count Students By Grade
SELECT Grade, COUNT(*)
FROM Students
GROUP BY Grade;

-- Update Students Grade
UPDATE Students SET Grade='B' WHERE StudentID=2;
UPDATE Students SET Grade='C' WHERE StudentID=3;
UPDATE Students SET Grade='B' WHERE StudentID=5;
UPDATE Students SET Grade='C' WHERE StudentID=7;
UPDATE Students SET Grade='B' WHERE StudentID=8;

SELECT Grade, COUNT(*)
FROM Students
GROUP BY Grade;

-- Calculate Top Perfomer
SELECT *,
(MathsScore+ScienceScore+EnglishScore) AS Total
FROM Students
ORDER BY Total DESC
LIMIT 1;

-- Calculate Students per Grade
SELECT Grade, COUNT(*)
FROM Students
GROUP BY Grade;

-- Calculate Average by gender
SELECT Gender,
AVG(Mathsscore),
AVG(Sciencescore),
AVG(englishscore)
FROM Students
GROUP BY Gender;


-- Math>80
SELECT *
FROM Students
WHERE MathsScore > 80;

-- Update grade
UPDATE Students
SET Grade='A'
WHERE StudentID=5;