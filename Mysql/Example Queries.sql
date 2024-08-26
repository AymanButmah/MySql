use final;

# 1) simple retrieval
SELECT PersonName
FROM person
WHERE PersonID <= 1;

# 2) compound condition (AND, OR, NOT)
SELECT TextbookTitle
FROM textbook
WHERE TextbookISBN = 203 OR TextbookISBN = 204;

# 3) computed fields
SELECT SUM(FacultySalary) AS AddedSalary
FROM Faculty
WHERE FacultySalary >= 0; 

# 4) built in sql function (min)
SELECT MIN(StudentGPA) AS LowestGPA
FROM Student;

# 5) built in sql function (max)
SELECT MAX(StudentGPA) AS HighestGPA
FROM Student;

# 6) built in sql function (count)
SELECT COUNT(PersonID) AS AmountOfPersons
FROM Person;

# 7) subquery
SELECT SectionID
FROM Section
WHERE RoomNumber = (SELECT RoomNumber FROM classrooms WHERE RoomNumber = 304);

# 8) grouping
SELECT CourseName
FROM course
WHERE TextbookISBN < 205
GROUP BY CourseID;

# 9) sorting
SELECT CourseName
FROM course
WHERE TextbookISBN < 205
ORDER BY CourseID;

# 10) joining multiple tables (queries from more than one table)
SELECT section.SectionID, person.PersonID
FROM section, person
WHERE section.PersonID = person.PersonID;

# 11) union
SELECT StudentName FROM Student
WHERE StudentName LIKE 'A%'
UNION
SELECT FacultyName FROM Faculty
WHERE FacultyName LIKE 'A%';

# 12) special operators (LIKE, IN, BETWEEN, etc)
SELECT FacultyName
FROM Faculty
WHERE FacultyTitle LIKE 'Head%';

# 13) views
CREATE VIEW FacultyHeads AS
SELECT FacultySalary
FROM Faculty
WHERE FacultySalary >= 7500;

# 14) updating tables
UPDATE faculty
SET FacultySalary = 65000
WHERE FacultyName = 'Mary George';

# 15) delete querybuildingsbuildings
DELETE FROM course
WHERE CourseName = 'Calculus II';

SELECT Course.CourseName, Textbook.TextbookTitle
FROM Course
RIGHT JOIN Textbook ON Course.TextbookISBN = Textbook.TextbookISBN;

# --------

# 1. Inner Join between College and Buildings
SELECT College.CollegeName, Buildings.BuildingName
FROM College
INNER JOIN Buildings ON College.CollegeName = Buildings.CollegeName;

# 2. Left Join between Buildings and Classrooms
SELECT Buildings.BuildingName, Classrooms.RoomNumber
FROM Buildings
LEFT JOIN Classrooms ON Buildings.BuildingID = Classrooms.BuildingID;

# 3. Right Join between Course and Textbook
SELECT Course.CourseName, Textbook.TextbookTitle
FROM Course
RIGHT JOIN Textbook ON Course.TextbookISBN = Textbook.TextbookISBN;

# 4. Full Outer Join (Simulated with Union) between Faculty and Interns
SELECT Faculty.FacultyName AS Name, Faculty.FacultySalary AS Salary
FROM Faculty
UNION
SELECT Interns.InternID AS Name, Interns.InternHourlyWage AS Salary
FROM Interns;

# 5. Self Join on Person Table
SELECT p1.PersonName AS Person1, p2.PersonName AS Person2
FROM Person p1
INNER JOIN Person p2 ON p1.PersonID <> p2.PersonID
WHERE p1.PersonPhoneNumber = p2.PersonPhoneNumber;

# 6. Join between Section and Course
SELECT Section.SectionID, Course.CourseName
FROM Section
INNER JOIN Course ON Section.CourseID = Course.CourseID;

# 7. Join between Section, Buildings, and Classrooms
SELECT Section.SectionID, Buildings.BuildingName, Classrooms.RoomNumber
FROM Section
INNER JOIN Buildings ON Section.BuildingID = Buildings.BuildingID
INNER JOIN Classrooms ON Section.RoomNumber = Classrooms.RoomNumber;

# 8. Join between Student and Person
SELECT Student.StudentName, Person.PersonPhoneNumber
FROM Student
INNER JOIN Person ON Student.PersonID = Person.PersonID;

# 9. Join between Faculty and Section
SELECT Faculty.FacultyName, Section.SectionID
FROM Faculty
INNER JOIN Section ON Faculty.PersonID = Section.PersonID;

# 10. Join between Interns, Person, and College
SELECT Interns.InternID, Person.PersonName, College.CollegeName
FROM Interns
INNER JOIN Person ON Interns.PersonID = Person.PersonID
INNER JOIN Buildings ON Person.PersonID = Buildings.BuildingID
INNER JOIN College ON Buildings.CollegeName = College.CollegeName;

# 11. Join between Course and Section with a Filter
SELECT Course.CourseName, Section.SectionDate
FROM Course
INNER JOIN Section ON Course.CourseID = Section.CourseID
WHERE Section.SectionDate < '2024-01-01';

# 12. Left Join between Faculty and Person
SELECT Faculty.FacultyName, Person.PersonPhoneNumber
FROM Faculty
LEFT JOIN Person ON Faculty.PersonID = Person.PersonID;

# 13. Right Join between Interns and Person
SELECT Interns.InternID, Person.PersonName
FROM Interns
RIGHT JOIN Person ON Interns.PersonID = Person.PersonID;

# 14. Join between Student and Section
SELECT Student.StudentName, Section.SectionID
FROM Student
INNER JOIN Section ON Student.PersonID = Section.PersonID;

# 15. Join between Buildings, College, and Section
SELECT Buildings.BuildingName, College.CollegeName, Section.SectionID
FROM Buildings
INNER JOIN College ON Buildings.CollegeName = College.CollegeName
INNER JOIN Section ON Buildings.BuildingID = Section.BuildingID;

# 16. Join between Course, Textbook, and Section
SELECT Course.CourseName, Textbook.TextbookTitle, Section.SectionID
FROM Course
INNER JOIN Textbook ON Course.TextbookISBN = Textbook.TextbookISBN
INNER JOIN Section ON Course.CourseID = Section.CourseID;

# 17. Join between Faculty and Course
SELECT Faculty.FacultyName, Course.CourseName
FROM Faculty
INNER JOIN Section ON Faculty.PersonID = Section.PersonID
INNER JOIN Course ON Section.CourseID = Course.CourseID;

# 18. Join between Student, Person, and Interns
SELECT Student.StudentName, Person.PersonPhoneNumber, Interns.InternHourlyWage
FROM Student
INNER JOIN Person ON Student.PersonID = Person.PersonID
INNER JOIN Interns ON Person.PersonID = Interns.PersonID;

# 19. Join between Buildings, Classrooms, and Section
SELECT Buildings.BuildingName, Classrooms.RoomNumber, Section.SectionID
FROM Buildings
INNER JOIN Classrooms ON Buildings.BuildingID = Classrooms.BuildingID
INNER JOIN Section ON Classrooms.RoomNumber = Section.RoomNumber;

# 20. Join between Student, Faculty, and Section
SELECT Student.StudentName, Faculty.FacultyName, Section.SectionID
FROM Student
INNER JOIN Section ON Student.PersonID = Section.PersonID