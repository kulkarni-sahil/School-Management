--creatin school management database
CREATE DATABASE SchoolManagement
GO

--using schoolmgmt database
USE SchoolManagement
GO

--admin table
CREATE TABLE Admin
(
	AdminId INT IDENTITY(1,1),
	AdminName VARCHAR(20) NOT NULL,
	AdminEmail VARCHAR(50) NOT NULL,
	AdminPassword VARCHAR(30) NOT NULL,
	CONSTRAINT PK_AdminId PRIMARY KEY(AdminId)
)
GO

--teacher table
CREATE TABLE Teachers
(
	TeacherId INT IDENTITY(1,1),
	TeacherName VARCHAR(20) NOT NULL,
	TeacherGender VARCHAR(1) NOT NULL,
	TeacherDOB DATETIME NOT NULL,	
	TeacherContact VARCHAR(10) NOT NULL,
	TeacherAddress VARCHAR(100)NOT NULL,
	TeacherEmail VARCHAR(50) NOT NULL,
	TeacherPassword VARCHAR(30) NOT NULL,
	CONSTRAINT PK_TeacherId PRIMARY KEY(TeacherId)
)
GO

--cashier table
CREATE TABLE Cashiers
(
	CashierId INT IDENTITY(1,1),
	CashierName VARCHAR(20) NOT NULL,
	CashierEmail VARCHAR(50) NOT NULL,
	CashierPassword VARCHAR(30) NOT NULL,
	CONSTRAINT PK_CashierId PRIMARY KEY(CashierId)
)
GO

--grade table
CREATE TABLE Grades
(
	GradeId INT IDENTITY(1,1),	
	GradeName VARCHAR(20) NOT NULL,
	GradeFees INT NOT NULL,
	TeacherId INT,
	CONSTRAINT pk_GradeId PRIMARY KEY(GradeId),
	CONSTRAINT fk_GradeTeacherId FOREIGN KEY(TeacherId)
	REFERENCES Teachers(TeacherId)
)
GO

--student table
CREATE TABLE Students
(
	StudentId INT IDENTITY(1,1),
	StudentName VARCHAR(20) NOT NULL,
	StudentGender VARCHAR(1) NOT NULL,
	StudentDOB DATETIME NOT NULL,
	StudentBloodGroup VARCHAR(3) NOT NULL,
	StudentContact VARCHAR(10) NOT NULL,
	StudentAddress VARCHAR(100)NOT NULL,
	StudentFees INT NOT NULL,
	GradeId INT NOT NULL,
	StudentEmail VARCHAR(50) NOT NULL,
	StudentPassword VARCHAR(30) NOT NULL,
	CONSTRAINT PK_StudentId PRIMARY KEY (StudentId),
	CONSTRAINT FK_GradeId FOREIGN KEY (GradeId)
	REFERENCES Grades(GradeId) 
)
GO

--Fees Table
CREATE TABLE Fees
(
	InvoiceId INT IDENTITY(1,1),
	PaymentDate DATETIME NOT NULL,
	AmountPaid INT NOT NULL,
	StudentId INT NOT NULL,
	CashierId INT NOT NULL,
	CONSTRAINT PK_FeesId PRIMARY KEY (InvoiceId),
	CONSTRAINT FK_FeeStudentId FOREIGN KEY (StudentId)
	REFERENCES Students(StudentId),
	CONSTRAINT FK_FeeCashierId FOREIGN KEY (CashierId)
	REFERENCES Cashiers(CashierId)
)
GO

--Attendence Table
CREATE TABLE Attendence
(
	AttendenceId INT IDENTITY(1,1),
	TodayDate Date NOT NULL,
	Attended VARCHAR(1) NOT NULL,
	StudentId INT NOT NULL,
	CONSTRAINT PK_AttendenceId PRIMARY KEY (AttendenceId),
	CONSTRAINT FK_AttendenceStudentId FOREIGN KEY (StudentId)
	REFERENCES Students(StudentId)
)
GO


