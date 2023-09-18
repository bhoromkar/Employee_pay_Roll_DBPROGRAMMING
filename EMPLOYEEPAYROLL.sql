create database EmployeePayrollDB
USE EMPLOYEEPayrollDB


create table Employee(
EmployeeID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
FirstName varchar(255) not null,
LastName varchar(255),
DateofBirth date not null ,
EmpAddress varchar(255) not null,
ContactNumber bigint,
Email varchar(255),
HireDate date, 
DesignationId int ,
DepartmentID int
)

create table Department(
DepartmentID INT Primary Key IDENTITY(1,1) NOT NULL,
DepartmentName VARCHAR(255),
EmployeeID int
)

create table Designation(
DesignationId  INT Primary Key IDENTITY(1,1) NOT NULL,
DesignationName varchar(255)
)
create table salary(
SalaryID  int Primary Key IDENTITY(1,1) NOT NULL,
EmployeeID int ,
PayrollPeriodID int,
BasicSalary int,
Allowances as ([BasicSalary] *(0.2)),
Deductions as ([BasicSalary] *(0.1)),
NetSalary as ((([BasicSalary] )+([BasicSalary] *(0.2)))-(([BasicSalary] *(0.1))))
)

create table PayrollPeriod(
PayrollPeriodID int Primary Key IDENTITY(1,1) NOT NULL,
StartDate date,
EndDate   date
)

create table Attendancerecords(
AttendanceID INT Primary Key IDENTITY(1,1) NOT NULL,
EmployeeID int ,
AttendanceDate date,
ClockIn time,
ClockOut time
)

CREATE TABLE Leave(
LeaveID		 INT Primary Key IDENTITY(1000,10) NOT NULL,
EmployeeID int,
LeaveType 	varchar(255) CHECK (LeaveType IN ('sick', 'vacation'))	,
StartDate	 date,
EndDate		date
)	

create table EmpTraining(
TrainingID  INT Primary Key IDENTITY(2000,20) NOT NULL, 
TrainingName varchar(255),
Description varchar(255),
TrainerName varchar(255),
StartDate date,
EndDate date,   
EmployeeID int
)
ALTER TABLE Department
DROP COLUMN ManagerID;


ALTER TABLE Department
ADD  EmployeeID int;


ALTER TABLE Employee
ADD CONSTRAINT FK_DesignationId
 FOREIGN KEY (DesignationId) REFERENCES Designation(DesignationId);
 
 ALTER TABLE Employee
ADD CONSTRAINT FK_DepartmentID
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);
  
  
  ALTER TABLE salary
ADD CONSTRAINT FK_EmployeeId
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

  ALTER TABLE salary
ADD CONSTRAINT FK_PayrollPeriodID
 FOREIGN KEY (PayrollPeriodID) REFERENCES PayrollPeriod(PayrollPeriodID);

 ALTER TABLE Attendancerecords 
 ADD CONSTRAINT Fk_EmployeeID_ATTENDENCE
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

 ALTER TABLE Department 
 ADD CONSTRAINT FK_EMPLOYEE_DEPARMENTID
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

 ALTER TABLE Leave
 ADD CONSTRAINT FK_EMPLOYEE_LEAVEID
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

 ALTER TABLE EmpTraining 
 ADD CONSTRAINT FK_EMPLOYEE_Emp
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);
 
 --YYYY-MM-DD.
 insert into Employee (FirstName ,LastName ,DateofBirth ,EmpAddress , ContactNumber,HireDate ,Email ,DesignationId,DepartmentID )
 values('john' ,'smith', '1985-02-12','LONDON',21651661,'2016-12-10','JOHNSMITH@MAIL.COM' ,1,1),
		('CHRIS' ,'LYNN', '1995-04-21','NEWYORK',55645645,'2018-02-10','CHRISLYNN@MAIL.COM' ,2,1),
		('ROHIT' ,'KUMAR', '1990-05-11','DELHI',564646446,'2019-06-20','ROHITKUMAR@MAIL.COM' ,4,1),
		('ABC' ,'DOE', '1993-11-01','SYDENY',561165,'2018-10-20','ABCDOE@MAIL.COM' ,4,1),
		('NAVIN' ,'SINGH', '1991-01-01','MUMBAI',51651,'2020-10-22','NAVINSINGH@MAIL.COM' ,3,2),
		('VINAY' ,'MANE', '1997-03-25','MUMBAI',4949484,'2021-10-22','VINAYMANE@MAIL.COM' ,3,2),
	   ('DAVID' ,'HEAD', '1997-03-25','LONDON',498444,'2017-08-20','DAVIDHEAD@MAIL.COM' ,2,3),
	    ('PAT' ,'GREEN', '1986-10-05','AUSTRALIA',166816165,'2022-10-18','PATGREEEN@MAIL.COM' ,2,3),
		('KJDN' ,'KXMBL', '1996-11-30','KOLKATA',798864,'2021-06-14','KD@MAIL.COM' ,4,1),
		('JOFRA' ,'ARACHER', '1990-06-08','DELHI',6166158,'2020-10-02','SFDG@MAIL.COM' ,4,1),
		('ROOT' ,'KEVIN', '1994-08-05','MUMBAI',1484984,'2019-07-23','JJYM@MAIL.COM' ,4,1);


INSERT INTO Designation (DesignationName)VALUES('PRESIDENT'),('MANAGER'),('ACCOUNTANT'),('SOFTAWARE RNGINEER');
insert into Department (DepartmentName) values('IT'),('Finance'),('HUMAN RESOURSES');
SELECT * FROM Designation;
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM PayrollPeriod;
insert into PayrollPeriod (StartDate,EndDate) values('2023-04-01','2023-04-30'),('2023-05-01','2023-05-31'),('2023-06-01','2023-06-30'),('2023-07-01','2023-07-31');
		
INSERT INTO Attendancerecords (EmployeeID,AttendanceDate,ClockIn,ClockOut) VALUES (13,'2023-05-01','09:31:01','18:31:01'),
(13,'2023-05-02','09:31:01','18:31:01'),(13,'2023-05-03','09:31:01','18:31:01'),
(13,'2023-05-04','09:31:01','18:31:01'),(13,'2023-05-05','09:31:01','18:31:01'),
(13,'2023-05-08','09:31:01','18:31:01'),(13,'2023-05-09','09:31:01','18:31:01')
;
SELECT * FROM Attendancerecords;

Insert into salary(EmployeeID ,PayrollPeriodID ,BasicSalary )
values(3,2,250000),
(3,3,250000),(3,4,250000),(4,1,50000),(4,2,50000),(4,3,50000),(5,1,35000),
(5,2,35000),(5,3,35000),(5,4,35000),(7,1,25000),(7,1,30000),(8,1,25000)


SELECT * FROM leave ;

insert into Leave(EmployeeID ,LeaveType , StartDate	,  EndDate)values( 4, 'sick','2023-05-11','2023-05-13'	)	,( 7, 'vacation','2023-06-12','2023-06-13'	)		  	
 INSERT INTO EmpTraining (TrainingName, Description, TrainerName, StartDate, EndDate, EmployeeID)
VALUES
    ('Employee Orientation', 'Introduction to company policies', 'John Smith', '2023-01-10', '2023-01-15', 8),
    ('Project Management', 'Managing projects effectively', 'Alice Johnson', '2023-02-05', '2023-02-20',4 ),
    ('Software Development', 'Advanced coding techniques', 'Michael Brown', '2023-03-15', '2023-03-30', 6),
    ('Team Building', 'Building a strong team', 'Sarah Davis', '2023-04-20', '2023-05-05', 10),
    ('Communication Skills', 'Improving interpersonal communication', 'Robert Wilson', '2023-05-10', '2023-05-25', 13);


	select * from EmpTraining;

--Fetch LastRecord fromTable
SELECT TOP 1 *
FROM Employee
ORDER BY EmployeeID desc ;

--last fve records
SELECT TOP 5 *
FROM  Employee
ORDER BY EmployeeID DESC;

--Display Even rows in Employee table
SELECT *
FROM Employee
WHERE EmployeeID % 2 = 0;

--50 record
SELECT TOP 50 PERCENT *
FROM Employee
ORDER BY EmployeeID DESC;

--AT LEAST 3 CHARACTER AT START , AT LIST 2 CHAR AFTER "@" AND ,At least two character after .(dot)
SELECT *
FROM Employee
WHERE Email like  '%___@__%.__%';  -- one employee ignored having 2 character at start


--distinct 
SELECT EmpAddress
FROM Employee
GROUP BY EmpAddress;






