CREATE DATABASE UniversityManagement
DROP DATABASE UniversityManagement
USE UniversityManagement
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Class (
  ClassCode          char(12) NOT NULL, 
  CourseWork_Program varchar(50) NOT NULL, 
  SupervisorID       char(10) NOT NULL, 
  PRIMARY KEY (ClassCode));

CREATE TABLE Department (
  DepartmentCode char(2) NOT NULL, 
  DepartmentName varchar(50) NOT NULL, 
  OfficeNumber   int NOT NULL UNIQUE, 
  OfficePhone    varchar(12) NOT NULL, 
  ManagerID      char(10) NULL, 
  StartDate      date NULL, 
  PRIMARY KEY (DepartmentCode));

CREATE TABLE Grade (
  StudentID      char(8) NOT NULL, 
  SubjectCode    char(6) NOT NULL, 
  TheoryGrade    decimal(5, 2) NOT NULL, 
  PracticalGrade decimal(5, 2) NOT NULL, 
  PRIMARY KEY (StudentID));

CREATE TABLE Instructor (
  InstructorID   char(10) NOT NULL, 
  LastName       varchar(10) NOT NULL, 
  FirstName      varchar(40) NOT NULL, 
  BirthDate      datetime NOT NULL, 
  StartDate      datetime NOT NULL, 
  Sex            char(1) NOT NULL, 
  DepartmentCode char(2) NOT NULL, 
  PRIMARY KEY (InstructorID));

CREATE TABLE Instructors_Qualifications (
  SpecializedTraning varchar(50) NULL, 
  TrainingInstitute  varchar(50) NOT NULL, 
  GraduationYear     datetime NOT NULL, 
  InstructorID       char(10) NOT NULL, 
  QualificationCode  char(12) NOT NULL, 
  PRIMARY KEY (InstructorID, 
  QualificationCode));

CREATE TABLE Province (
  Province_ID  char(2) NOT NULL, 
  ProvinceName varchar(40) NOT NULL, 
  PRIMARY KEY (Province_ID));

CREATE TABLE Qualification (
  QualificationCode char(12) NOT NULL, 
  QualificationName varchar(50) NOT NULL, 
  PRIMARY KEY (QualificationCode));

CREATE TABLE Section (
  NoOfSemester  int NOT NULL, 
  SectionNumber int NOT NULL, 
  TrainingYear  int NOT NULL, 
  ClassCode     char(12) NOT NULL, 
  InstructorID  char(10) NOT NULL, 
  SubjectCode   char(6) NOT NULL, 
  PRIMARY KEY (NoOfSemester, 
  SectionNumber));

CREATE TABLE Sex (
  Type        char(1) NOT NULL, 
  Description varchar(8) NOT NULL, 
  PRIMARY KEY (Type));

CREATE TABLE Student (
  StudentID        char(8) NOT NULL, 
  SSN              char(12) NOT NULL UNIQUE, 
  LastName         varchar(10) NOT NULL, 
  FirstName        varchar(40) NOT NULL, 
  PhoneNumber      int NOT NULL, 
  Province_ID      char(2) NOT NULL, 
  CurrentAddress   varchar(40) NULL, 
  PermanentAddress varchar(40) NOT NULL, 
  BirthDate        date NOT NULL, 
  Sex              char(1) NOT NULL, 
  ClassCode        char(12) NOT NULL, 
  PRIMARY KEY (StudentID));

CREATE TABLE Subject (
  SubjectCode       char(6) NOT NULL, 
  SubjectName       varchar(50) NOT NULL, 
  TotalCredit       int NOT NULL, 
  TheoryCredit      int NOT NULL, 
  PracticalCredit   int NOT NULL, 
  Prerequisite_Code char(6) NULL, 
  DepartmentCode    char(2) NOT NULL, 
  PRIMARY KEY (SubjectCode));

CREATE TABLE Teaching (
  InstructorID char(10) NOT NULL, 
  SubjectCode  char(6) NOT NULL, 
  StartDate    datetime NOT NULL, 
  EndDate      datetime NULL, 
  PRIMARY KEY (InstructorID, 
  SubjectCode));

-- CREATE FOREIGN KEYS FOR TABLES IN THE DATABASE
ALTER TABLE Subject ADD CONSTRAINT FKSubject504889 FOREIGN KEY (Prerequisite_Code) REFERENCES Subject (SubjectCode);
ALTER TABLE Department ADD CONSTRAINT FKDepartment522635 FOREIGN KEY (ManagerID) REFERENCES Instructor (InstructorID);
ALTER TABLE Instructor ADD CONSTRAINT FKInstructor514852 FOREIGN KEY (Sex) REFERENCES Sex (Type);
ALTER TABLE Student ADD CONSTRAINT FKStudent704530 FOREIGN KEY (Sex) REFERENCES Sex (Type);
ALTER TABLE Subject ADD CONSTRAINT FKSubject149673 FOREIGN KEY (DepartmentCode) REFERENCES Department (DepartmentCode);
ALTER TABLE Student ADD CONSTRAINT FKStudent16607 FOREIGN KEY (Province_ID) REFERENCES Province (Province_ID);
ALTER TABLE Teaching ADD CONSTRAINT FKTeaching118409 FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID);
ALTER TABLE Teaching ADD CONSTRAINT FKTeaching501219 FOREIGN KEY (SubjectCode) REFERENCES Subject (SubjectCode);
ALTER TABLE Instructor ADD CONSTRAINT FKInstructor921316 FOREIGN KEY (DepartmentCode) REFERENCES Department (DepartmentCode);
ALTER TABLE Class ADD CONSTRAINT FKClass654558 FOREIGN KEY (SupervisorID) REFERENCES Instructor (InstructorID);
ALTER TABLE Section ADD CONSTRAINT FKSection321311 FOREIGN KEY (ClassCode) REFERENCES Class (ClassCode);
ALTER TABLE Section ADD CONSTRAINT FKSection416119 FOREIGN KEY (InstructorID, SubjectCode) REFERENCES Teaching (InstructorID, SubjectCode);
ALTER TABLE Grade ADD CONSTRAINT FKGrade428757 FOREIGN KEY (StudentID) REFERENCES Student (StudentID);
ALTER TABLE Grade ADD CONSTRAINT FKGrade135231 FOREIGN KEY (SubjectCode) REFERENCES Subject (SubjectCode);
ALTER TABLE Instructors_Qualifications ADD CONSTRAINT FKInstructor470716 FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID);
ALTER TABLE Instructors_Qualifications ADD CONSTRAINT FKInstructor697732 FOREIGN KEY (QualificationCode) REFERENCES Qualification (QualificationCode);
ALTER TABLE Student ADD CONSTRAINT FKStudent740747 FOREIGN KEY (ClassCode) REFERENCES Class (ClassCode);

-- DROP FOREGIN KEYS AND TABLES IN THE DATABASE
/*
ALTER TABLE Subject DROP CONSTRAINT FKSubject504889;
ALTER TABLE Department DROP CONSTRAINT FKDepartment522635;
ALTER TABLE Instructor DROP CONSTRAINT FKInstructor514852;
ALTER TABLE Student DROP CONSTRAINT FKStudent704530;
ALTER TABLE Subject DROP CONSTRAINT FKSubject149673;
ALTER TABLE Student DROP CONSTRAINT FKStudent16607;
ALTER TABLE Teaching DROP CONSTRAINT FKTeaching118409;
ALTER TABLE Teaching DROP CONSTRAINT FKTeaching501219;
ALTER TABLE Instructor DROP CONSTRAINT FKInstructor921316;
ALTER TABLE Class DROP CONSTRAINT FKClass654558;
ALTER TABLE Section DROP CONSTRAINT FKSection321311;
ALTER TABLE Section DROP CONSTRAINT FKSection416119;
ALTER TABLE Grade DROP CONSTRAINT FKGrade428757;
ALTER TABLE Grade DROP CONSTRAINT FKGrade135231;
ALTER TABLE Instructors_Qualifications DROP CONSTRAINT FKInstructor470716;
ALTER TABLE Instructors_Qualifications DROP CONSTRAINT FKInstructor697732;
ALTER TABLE Student DROP CONSTRAINT FKStudent740747;
DROP TABLE Class;
DROP TABLE Department;
DROP TABLE Grade;
DROP TABLE Instructor;
DROP TABLE Instructors_Qualifications;
DROP TABLE Province;
DROP TABLE Qualification;
DROP TABLE Section;
DROP TABLE Sex;
DROP TABLE Student;
DROP TABLE Subject;
DROP TABLE Teaching;
*/

-- Insert values of each table into the database
INSERT INTO Sex VALUES ('M', 'Male'), ('F', 'Female'), ('O', 'Others')

INSERT INTO Department VALUES('SE', 'Software Engineering', 001, '0987654321', NULL, NULL), 
				             ('CF', 'Computing Fundamentals', 002, '0345213897', NULL, NULL), 
				             ('IA', 'Information Assurance', 003, '0975123658', NULL, NULL),
				             ('IB', 'International Business', 004, '0398741254', NULL, NULL)

INSERT INTO Instructor VALUES ('0000000001', 'Bao', 'Ma Ngoc Long', '1997-11-21', '2019-01-01', 'M', 'CF'),
							  ('0000000002', 'Hieu', 'Tran Hoa', '1998-05-21', '2020-01-10', 'M', 'SE'),
							  ('0000000003', 'Phung', 'Do Nguyen Yen', '1995-06-10', '2021-01-12', 'F', 'SE'),
							  ('0000000004', 'Duy', 'Nguyen Chinh Khuong', '1996-01-31', '2020-10-05', 'M', 'SE'),
							  ('0000000005', 'Loc', 'Tran Quang', '1998-04-23', '2019-08-10', 'M', 'CF'),
							  ('0000000006', 'Long', 'Vu', '1996-11-22', '2019-01-10', 'M', 'IB'),
							  ('0000000007', 'Viet', 'Le', '1994-12-22', '2019-03-21', 'M', 'IA')

INSERT INTO Subject VALUES ('ACC101', 'Principles of Accounting', 9, 6, 3, NULL, 'IB'),
						   ('ECO111', 'Microeconomics', 9, 6, 3, NULL, 'IB'),
						   ('DBI202', 'Introduction to Databases', 12, 6, 6, NULL, 'CF'),
						   ('PRO192', 'Object-oritented Programming', 8, 4, 4, NULL, 'CF'),
						   ('PRJ301', 'Java Web Application', 12, 6, 6, 'DBI202 ', 'CF'),
						   ('SWE201', 'Introduction to Software Engineering', 9, 6, 3, NULL, 'SE')

INSERT INTO Teaching VALUES ('0000000006', 'ECO111', '2021-10-04', NULL), 
							('0000000001', 'PRO192', '2021-03-20', NULL),
							('0000000003', 'PRJ301', '2021-04-10', NULL),
							('0000000003', 'SWE201', '2021-04-20', NULL)

INSERT INTO Class VALUES ('SE1716', 'IT-Software Engineering', '0000000005'),
						 ('SE1724', 'IT-Software Engineering', '0000000002')

INSERT INTO Class VALUES ('SE1800', 'IT-Software Engineering', '0000000005'),
						 ('SE1810', 'IT-Software Engineering', '0000000004'),
						 ('SE1814', 'IT-Software Engineering', '0000000004'),
						 ('IB1802', 'IT-Software Engineering', '0000000006')

INSERT INTO Student VALUES ('00000001', '000000000001', 'A', 'Nguyen Van', 1111246899, '01', NULL, '46/8 Quang Trung', '2002-03-20', 'M', ''),
						   ('00000002', '000000000002', 'Bao', 'Le Phan Trung', 23366688, '02', NULL, '750 Cach Mang Thang Tam', '2000-01-21', 'F', ''),
						   ('00000003', '000000000003', 'Quang', 'Ho Nguyen Minh', 22888899, '03', NULL, 'Trang Bom', '2003-12-22', 'M', ''),
						   ('00000004', '000000000004', 'Hung', 'Chu Tien', 123477999, '04', NULL, 'Phu Cuong', '2000-10-11', 'M', ''),
						   ('00000005', '000000000005', 'Duc', 'Nguyen Anh', 1334567788, '03', NULL, 'Chanh Nghia', '1999-08-07', 'M', ''),
						   ('00000006', '000000000006', 'Kiet', 'Tran Minh', 133446689, '02', NULL, '87 Phung Khac Khoan', '2000-05-12', 'F', ''),
						   ('00000007', '000000000007', 'Hiep', 'Hoang Sy', 11235689, '07', NULL, '28 Le Loi', '2001-12-12', 'O', ''),
						   ('00000008', '000000000008', 'Thanh', 'Nguyen Hoang', 234506777, '06', NULL, '40/5 Le Lai', '2003-12-31', 'O', ''),
						   ('00000009', '000000000009', 'Khoi', 'Vo Dang', 13566889, '02', NULL, 'Dang Van Bi', '1998-11-03', 'O', ''),
						   ('00000010', '000000000010', 'Phuc', 'Nguyen Minh', 334457888, '01', NULL, 'Ha Hoi', '2000-01-02', 'F', ''),
						   ('00000011', '000000000011', 'Khang', 'Nguyen Si Hoang', 1111234457, '01', NULL, 'An Duong Vuong', '2001-03-02', 'M', ''),
						   ('00000012', '000000000012', 'Tam', 'Nguyen Huynh Thanh', 223355889, '04', NULL, 'Kinh Vuong', '1999-03-20', 'F', ''),
						   ('00000013', '000000000013', 'Thien', 'Nguyen Hoang Anh', 3444679, '04', NULL, 'Hoa Lac', '2003-05-21', 'F', ''),
						   ('00000014', '000000000014', 'Phat', 'Nguyen Hoang', 102345678, '03', NULL, 'Phuoc Long A', '2003-09-11', 'O', ''),
						   ('00000015', '000000000015', 'Tien', 'Nguyen Quang', 122334589, '07', NULL, 'Quang Trung', '2001-12-10', 'O', ''),
						   ('00000016', '000000000016', 'Hao', 'Le Chi', 223566999, '01', NULL, 'Nguyen Hue', '2000-09-23', 'M', '')

INSERT INTO Section VALUES ('1', '3', 2023, 'SE1800', '0000000001', 'PRO192'),
						   ('1', '2', 2023, 'SE1814', '0000000001', 'PRO192'),
						   ('1', '4', 2023, 'IB1802', '0000000006', 'ECO111')

INSERT INTO Province VALUES ('01', 'Ho Chi Minh City'),
							('02', 'Binh Duong Province'),
							('03', 'Dong Nai Province'),
							('04', 'Cam Ranh Province'),
							('05', 'Soc Trang Province'),
							('06', 'Can Tho City'),
							('07', 'Vung Tau Province')

INSERT INTO Grade VALUES('00000010', 'DBI202', 7.0, 7.5),
						('00000007', 'DBI202', 6, 8),
						('00000005', 'PRJ301', 7.0, 8.0)

INSERT INTO Qualification VALUES('01ab', 'Bachelor of Computer Science'), 
								('02ab', 'Bachelor of Data Science'),
								('03ab', 'Bachelor of Business Administration'),
								('01abc', 'Master of Computer Science'),
								('02abz', 'Master of Business Administration')
								
INSERT INTO Instructors_Qualifications 
VALUES('Machine Learning', 'Swinburne University', '2022-03-20', '0000000001', '01abc'),
	  (NULL, 'RMIT University', '2021-02-18', '0000000006', '02abz'),
	  (NULL, 'FPT University', '2018-09-30', '0000000005', '01ab')
----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Department
SELECT * FROM Instructor
SELECT * FROM Subject
SELECT * FROM Teaching
SELECT * FROM Section
SELECT * FROM Class
SELECT * FROM Province
SELECT * FROM Student
SELECT * FROM Grade
SELECT * FROM Qualification
SELECT * FROM Instructors_Qualifications
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 01. Find the instructor whose lastname is 'Long'
SELECT *
FROM Instructor
WHERE LastName = 'Long'

-- 02. Find the department of the employee whose name is 'Do Nguyen Yen Phung'. Output: DepartmentCode, Name, OfficeNumber
SELECT d.DepartmentCode, d.DepartmentName, d.OfficeNumber
FROM Instructor i JOIN Department d ON i.DepartmentCode = d.DepartmentCode
WHERE (i.FirstName + ' ' + i.LastName) = 'Do Nguyen Yen Phung'

-- 03. Create a function to calculate the number of instructors in a specific department
GO
CREATE FUNCTION fn_calcNumOfEmployeesInADepartment (@departmentCode char(2))
RETURNS int
AS
	BEGIN
		DECLARE @numOfEmployees int = (
			SELECT COUNT(i.InstructorID)
			FROM Instructor i
			WHERE i.DepartmentCode = @departmentCode
		)
		RETURN @numOfEmployees
	END
GO
SELECT dbo.fn_calcNumOfEmployeesInADepartment('SE') AS [NumOfEmployees]
SELECT dbo.fn_calcNumOfEmployeesInADepartment('CF') AS [NumOfEmployees]

-- 04. In every department, find the employee who has a Master degree. Output: DepartmentCode, DepartmentName
SELECT d.DepartmentCode,d.DepartmentName
FROM Department d full join Instructor i on d.DepartmentCode = i.DepartmentCode 
			full join Instructors_Qualifications q  on i.InstructorID = q.InstructorID 
			full join Qualification l on q.QualificationCode = l.QualificationCode
WHERE l.QualificationName like 'Master of%'

-- 05. Find the information of the subject with a code is DBI202
SELECT *
FROM Subject s 
WHERE s.SubjectCode = 'DBI202'

-- 06. Calculate the number of instructors based on the sex. Output: Sex, DepartmentCode, DepartmentName, NumberOfInstructors
SELECT i.Sex, d.DepartmentCode, d.DepartmentName, COUNT(i.Sex) AS [NumberOfInstructors]
FROM Instructor i JOIN Department d ON i.DepartmentCode = d.DepartmentCode
GROUP BY i.Sex, d.DepartmentCode, d.DepartmentName

-- 07. Find the information of the instructor(s) teaching a subject called 'Java Web Application'
SELECT * 
FROM Instructor
WHERE InstructorID = (
	SELECT i.InstructorID
	FROM (Instructor i JOIN Teaching t ON i.InstructorID = t.InstructorID)
			JOIN Subject s ON t.SubjectCode = s.SubjectCode
	WHERE s.SubjectCode = (SELECT SubjectCode FROM Subject WHERE SubjectName = 'Java Web Application')
)

-- 08. Find the subject(s) that has/have a practical credit is greater than 5. Output: SubjectCode, SubjectName
SELECT SubjectCode, SubjectName
FROM Subject
WHERE PracticalCredit > 5

-- 09. Find the subject that has a highest credit of all subjects. Output: SubjectCode, SubjectName, DepartmentCode, DepartmentName
SELECT s.SubjectCode, s.SubjectName, s.DepartmentCode, d.DepartmentName
FROM Subject s JOIN Department d ON s.DepartmentCode = d.DepartmentCode
GROUP BY s.SubjectCode, s.SubjectName, s.DepartmentCode, d.DepartmentName
HAVING MAX(s.TotalCredit) >= ALL (
	SELECT MAX(s.TotalCredit)
	FROM Subject s
	GROUP BY s.SubjectCode, s.SubjectName
)

-- 10. Find the subject that has a lowest credit of all subjects. Output: SubjectCode, SubjectName, DepartmentCode, DepartmentName
SELECT s.SubjectCode, s.SubjectName, s.DepartmentCode, d.DepartmentName
FROM Subject s JOIN Department d ON s.DepartmentCode = d.DepartmentCode
GROUP BY s.SubjectCode, s.SubjectName, s.DepartmentCode, d.DepartmentName
HAVING MAX(s.TotalCredit) <= ALL (
	SELECT MAX(s.TotalCredit)
	FROM Subject s
	GROUP BY s.SubjectCode, s.SubjectName
)

-- 11. Find the information of manager who manages the department 'Computing Fundamentals'
SELECT *
FROM Instructor
WHERE InstructorID = (
	SELECT ManagerID
	FROM Department
	WHERE DepartmentName = 'Computing Fundamentals'
)

-- 12. Find the qualification of instructor whose id is '0000000001'. Output: QualificationCode, QualificationName
SELECT q.QualificationCode, q.QualificationName
FROM Instructors_Qualifications iq JOIN Qualification q ON iq.QualificationCode = q.QualificationCode
WHERE iq.InstructorID = '0000000001'

-- 13. Find the training institute of the qualification's name is 'Bachelor of Computer Science'
SELECT iq.TrainingInstitute
FROM Qualification q JOIN Instructors_Qualifications iq ON q.QualificationCode = iq.QualificationCode
WHERE q.QualificationName = 'Bachelor of Computer Science'

-- 14. Find the information of the pre-requisite subject of the subject'code is 'PRJ301'. Output: SubjectCode, SubjectName
SELECT s1.SubjectCode, s1.SubjectName
FROM Subject s1
WHERE s1.SubjectCode = (
	SELECT s2.Prerequisite_Code
	FROM Subject s2
	WHERE s2.SubjectCode = 'PRJ301'
)

-- 15. Find the information of the instructor teaching subjects in department 'International Business'
SELECT *
FROM Instructor
WHERE InstructorID IN (
	SELECT t.InstructorID
	FROM Subject s JOIN Teaching t ON s.SubjectCode = t.SubjectCode
	WHERE s.DepartmentCode = (SELECT DepartmentCode FROM Department WHERE DepartmentName = 'International Business')
)

-- 16. Find the information of students who participate in class 'SE1716'
SELECT *
FROM Student
WHERE ClassCode = 'SE1716'
-- 17. Find the information of students whose are in 'Ho Chi Minh City'
SELECT *
FROM Student s
WHERE s.Province_ID = (
	SELECT Province_ID
	FROM Province
	WHERE ProvinceName = 'Ho Chi Minh City'
)

-- 18. Create a function to calculate the number of students in a particular city/province
-- SELECT * FROM Province
GO
CREATE FUNCTION fn_calcNumOfStudentsInAProvince_City (@provinceName varchar(50))
RETURNS INT
AS
	BEGIN
		DECLARE @numOfStudents int = (
			SELECT COUNT(s.StudentID)
			FROM Student s JOIN Province p ON s.Province_ID = p.Province_ID
			WHERE p.ProvinceName = @provinceName
		)
		RETURN @numOfStudents
	END
GO
SELECT dbo.fn_calcNumOfStudentsInAProvince_City('Binh Duong Province') AS NumberOfStudents
SELECT dbo.fn_calcNumOfStudentsInAProvince_City('Ho Chi Minh City') AS NumberOfStudents

-- 19. Create a view to store the information of subjects taught in a class SE1716. Output: ClassCode, SubjectCode, SubjectName
GO
CREATE VIEW vw_SubjectOfClassSE1716
AS
	SELECT DISTINCT s.ClassCode, sec.SubjectCode, Subject.SubjectName
	FROM Student s JOIN Class cl ON s.ClassCode = cl.ClassCode
				JOIN Section sec ON cl.ClassCode = sec.ClassCode
				JOIN Subject ON Subject.SubjectCode = sec.SubjectCode
	WHERE s.ClassCode = 'SE1716'
GO
SELECT * FROM vw_SubjectOfClassSE1716

-- 20. Create a procedure to calculate the final grade of a student, with studentId is a parameter
-- A student is considered to pass a subject if final grade is greater than or equal to 5.00
-- final grade = (theoryGrade + practicalGrade) / 2
GO
CREATE PROCEDURE proc_calcAStudentGrade
@studentID char(8) 
AS
	BEGIN
		DECLARE @theoryGrade decimal (5, 2) = (SELECT TheoryGrade FROM Grade WHERE StudentID = @studentID)
		DECLARE @practicalGrade decimal (5, 2) = (SELECT PracticalGrade FROM Grade WHERE StudentID = @studentID)
		DECLARE @finalGrade decimal (5, 2)
		SET @finalGrade = (@theoryGrade + @practicalGrade) / 2
		IF (@finalGrade >= 5)
			SELECT @finalGrade AS Grade, 'Passed' AS [Result]
		ELSE
			SELECT @finalGrade AS Grade, 'Not passed' AS [Result]
	END
GO
EXEC proc_calcAStudentGrade '00000005'

-- 21. Create a trigger for checking number of students in a specific class
-- If a class is more than 30 students, the new student is not inserted into the class
GO
CREATE TRIGGER tr_checkNoOfStudentsInClass ON Student
FOR INSERT
AS
	DECLARE @maxOfStudents int = 30
	DECLARE @studentClass char(12) = (SELECT ClassCode FROM Student)
	DECLARE @noOfStudents int = (
		SELECT COUNT(inserted.StudentID)
		FROM inserted
		WHERE ClassCode = @studentClass
	)
	IF (@noOfStudents > @maxOfStudents)
		BEGIN
			SELECT 'The maximum student in a class is 30 students' AS Result
			ROLLBACK
		END
	ELSE
		SELECT * FROM inserted
		SELECT @noOfStudents AS NoOfStudents
GO

-- 22. Find the class(es) that are taught in semester 1. Output: NoOfSemester, SectionNumber, ClassCode
SELECT s.NoOfSemester, s.SectionNumber, s.ClassCode
FROM Section s 
WHERE s.NoOfSemester = 1

-- 23. Find the supervisor's information of class SE1716
SELECT *
FROM Instructor
WHERE InstructorID = (
	SELECT SupervisorID
	FROM Class
	WHERE ClassCode = 'SE1716'
)

