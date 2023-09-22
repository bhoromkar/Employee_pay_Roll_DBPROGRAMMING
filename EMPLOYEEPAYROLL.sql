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
ALTER TABLE employee
ADD  modifieddate date;


ALTER TABLE Employee
ADD CONSTRAINT FK_DesignationId
 FOREIGN KEY (DesignationId) REFERENCES Designation(DesignationId);
 
 ALTER TABLE Employee
ADD CONSTRAINT FK_DepartmentID
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

 alter table department add  designationid int;
 alter table department 
 add constraint fk_designationid_deparment
foreign key (designationid) REFERENCES Designation(DesignationId)
  
  
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
 insert into Employee (FirstName,LastName,DateofBirth,EmpAddress,ContactNumber,HireDate,Email,DesignationId,DepartmentID )
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
INSERT INTO Designation (DesignationName)VALUES('SENIOR'),('INTERMEDIATE'),('JUNOR'),('INTERN');
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





---- joins
---Retrieve employee information along with their department names and designations
select employee.firstname, employee.lastname, employee.employeeid, employee.dateofbirth,employee.empaddress,employee.contactnumber,Employee.Email,employee.hiredate, 
Department.departmentname,Designation.DesignationName
from employee
inner join Department
on employee.DepartmentID = department.DepartmentID
inner join designation
on employee.designationid = designation.designationid

select * from Employee 

--
--Retrieve all employees and their corresponding salaries, if available
--(SELECT ALL RECORD FROM LEFT and matchrd recored in right


	
	select employee.firstname, employee.lastname, employee.employeeid, employee.dateofbirth,employee.empaddress,employee.contactnumber,Employee.Email,employee.hiredate, 

    salary.BasicSalary
FROM
    employee
LEFT JOIN
  salary   ON  employee.employeeid = salary.employeeid ;



--------	RIGHT JOIN query:(ALL THE RECORD FROM RIGHT TABLE ABLE AND MATCHED RECORD FROM LEGT TABLE
---Retrieve all salaries and the corresponding employee names, if available
	
	
	select employee.firstname, employee.lastname, employee.employeeid, employee.dateofbirth,employee.empaddress,employee.contactnumber,Employee.Email,employee.hiredate, 
    salary.BasicSalary
FROM
salary
    right JOIN
   employee  ON  salary.employeeid= employee.employeeid
   WHERE BasicSalary IS NOT NULL;


   select employee.firstname, employee.lastname, employee.employeeid, employee.dateofbirth,employee.empaddress,employee.contactnumber,Employee.Email,employee.hiredate, 

    salary.BasicSalary
FROM
    employee
RIGHT JOIN
  salary   ON  employee.employeeid = salary.employeeid ;


  SELECT * FROM EMPLOYEE;
  SELECT * FROM SALARY;
  ----OUTER JOIN
  select employee.firstname, employee.lastname, employee.employeeid, employee.dateofbirth,employee.empaddress,employee.contactnumber,Employee.Email,employee.hiredate, 
    salary.BasicSalary
FROM
salary   
FULL OUTER JOIN
   employee  ON  salary.employeeid= employee.employeeid


create database userDB;
use userDb;
create table users(
userId int primary key  identity(1,1) not null,
Username NVARCHAR(255),
Password NVARCHAR(255)
)
GO
/*

THROW [ error_number ,  
        message ,  
        state ];
Code language: SQL (Structured Query Language) (sql)
In this syntax:
error_number
The error_number is an integer that represents the exception. The error_number must be greater than 50,000 and less than or equal to 2,147,483,647.

message
The message is a string of type NVARCHAR(2048) that describes the exception.

state
The state is a TINYINT with the value between 0 and 255. The state indicates the state associated with the message.
*/
   ---- Create the stored procedure
-- Create the stored procedure
CREATE PROCEDURE ValidateUser
    @Username NVARCHAR(255),
    @Password NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
	BEGIN TRY
    DECLARE @UserCount INT;

    -- Check if the username already exists in the users table
    SELECT @UserCount = COUNT(*)
    FROM users
    WHERE username = @Username;

    -- If the username exists, raise an error
    IF( @UserCount > 0)
        PRINT 'Username exists.';
    ELSE
       INSERT INTO users (username, password)
    VALUES (@Username, @Password);

    PRINT 'User registered successfully.';
END TRY
BEGIN CATCH
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH

    -- If the username is unique, insert the new user
   
END


EXEC ValidateUser OMKAR1 ,OMKAR@20

DROP PROC ValidateUser

SELECT * FROM USERS
DROP TABLE USERS
GO


use EmployeePayrollDB
go

CREate PROC SpCheckEmployeeByID
@Employeeid int,
@EmployeeExists int output 
AS
BEGIN
/*
Declare @firstname varchar(255),
Declare @lastname varchar(255),
Declare @DateofBirth date not null ,
Declare @EmpAddress varchar(255) not null,
Declare @ContactNumber bigint,
Declare @Email varchar(255),
Declare @HireDate date, 
Declare @DesignationId int ,
Declare @DepartmentID int,
*/

  IF EXISTS (SELECT 1 FROM employee WHERE employeeid = @EmployeeID)
        SET @EmployeeExists = 1;  -- Employee exists
    ELSE
        SET @EmployeeExists = 0;  -- Employee does not exist
	 EnD
	 GO
	 DECLARE @EmployeeIDToCheck INT = 123; -- Replace with the desired EmployeeID
DECLARE @EmployeeExists BIT;
	 exec SpCheckEmployeeByID 3 , output;
	 IF @EmployeeExists = 1
    PRINT 'Employee exists.';
ELSE
    PRINT 'Employee does not exist.';
	select * from employee

	go
------ create a stored procedure that will take the
--Employee ID of a person and checks if it is in the table. There are two
--conditions It will create a new record if the Employee It is not stored in the table
     ---If the record is already in the table, it willupdate that
go
create proc SpEmployee
	@Employeeid int,
 @firstname varchar(255),
 @lastname varchar(255),
 @DateofBirth date ,
 @EmpAddress varchar(255) ,
 @ContactNumber bigint,
 @Email varchar(255),
 @HireDate date, 
 @DesignationId int ,
 @DepartmentID int
 as 
 begin
 IF EXISTS (SELECT 1 FROM EMPLOYEE WHERE EmployeeID= @Employeeid)
 begin
 UPDATE EMPLOYEE SET FirstName = @firstname ,
 LastName= @lastname,
 DateofBirth=@DateofBirth ,
 EmpAddress=@EmpAddress ,
 ContactNumber=@ContactNumber,
 HireDate= @HireDate,
 Email=@Email ,
 DesignationId=@DesignationId,
 DepartmentID =@DepartmentID
 WHERE EmployeeID= @Employeeid;
 PRINT 'Employee Updated';
 end
 Else
 begin
 insert into employee  (FirstName,LastName,DateofBirth,EmpAddress,ContactNumber,Email, HireDate ,DesignationId,DepartmentID )
 values   (@firstname,@lastname,@DateofBirth,@EmpAddress,@ContactNumber,@Email, @HireDate,@DesignationId,@DepartmentID )
 print 'new Employee inserted succesfully';
 end 
 end 
 go


 DECLARE @employeeid  int = 14 ; 
 IF EXISTS (SELECT 1 FROM EMPLOYEE WHERE EmployeeID= @Employeeid)
 BEGIN 
 PRINT 'EMPLOYEE IS ALREADY IN TABLE'
 END
 ELSE
 BEGIN
 exec SpEmployee 14,nklhjbn,kjhi,'1990-02-02',mumbai,46446499,'bjdb@mail.com','2020-01-01',2,2
 END


 select * from salary
 
 go
 alter proc SpEmployeeSalary
 @EmployeeID int 
 AS
 BEGIN
 SELECT  SUM(NETSALARY) AS TotalSalary ,PayrollPeriodID FROM SALARY WHERE EmployeeID= @EmployeeID group by PayrollPeriodID 
 End

 exec SpEmployeeSalary  3
 GO
 /*
 create function getage(
 @dateofbirth date 
)
RETURN 
 AS
 begin 
 age =
 go
 */
 -- Create a custom function to calculate total salary
 go
CREATE FUNCTION CalculateTotalSalary (@employee_id INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @total_salary DECIMAL(10, 2);

    SELECT @total_salary = (ISNULL(basICsalary, 0) + ISNULL(Allowances, 0) )- ISNULL(Deductions, 0)
    FROM SALARY
    WHERE employeeid = @employee_id;

    RETURN @total_salary;
END;
GO
SELECT DBO.CalculateTotalSalary(4)




 SELECT GETDATE()
 SELECT DATEADD(DAY,1,GETDATE())
  SELECT DATEADD(WEEK,1,GETDATE()) AS WEEKS
  SELECT DATEADD(MONTH,1,GETDATE()) AS MONTHS 
   SELECT DATEADD(YEAR,1,GETDATE())  AS YEARS

   SELECT DATEDIFF(YEAR,DATEOFBIRTH,GETDATE()) AS AGE ,DateofBirth
   FROM Employee
   
   SELECT DATEOFBIRTH,FIRSTNAME ,
   Case
   WHEN DATEADD(YEAR,DATEDIFF(YY,DATEOFBIRTH,GETDATE()),DATEOFBIRTH)> GETDATE()
   THEN DATEDIFF(YY,DATEOFBIRTH,GETDATE()) -1
   ELSE 
   DATEDIFF(YY,DATEOFBIRTH,GETDATE()) END AS AGE
   FROM EMPLOYEE
   go
     
create function getCountByDepartment(@departmentId NVARCHAR(255))
returns table 
AS

return(
SELECT  COUNT(*)as  noOfEmployee
   FROM EMPLOYEE
  WHERE DepartmentID = @departmentID
  GROUP BY DEPARTMENTID

);

GO


DROP FUNCTION DBO.getCountByDepartment


SELECT departmentid, COUNT(*)as  noOfEmployee
  FROM employee
  GROUP BY DepartmentID;

select leaveid, count(*) as noOfLeave
from leave
group by LeaveID

-- Create a custom function to get the number of employees in a specific department
ALTER FUNCTION GetEmployeeCountInDepartment (@departmentID NVARCHAR(255))
RETURNS TABLE
AS
RETURN
(
    SELECT COUNT(*) AS employee_count,DepartmentID
    FROM employee
    WHERE departmentID = @departmentID
	GROUP BY DepartmentID
);

SELECT 
    * 
FROM 
    GetEmployeeCountInDepartment(2);


--inline table fuction
ALTER FUNCTION GETLEAVEDEAILSBYEMPLOYEE(@EMPLOYEEID INT)
RETURNS TABLE
AS
RETURN(
select LEAVEID ,count(*) as noOfLeave
from leave
WHERE EmployeeID= @EMPLOYEEID
GROUP BY LeaveID
);

SELECT *FROM GETLEAVEDEAILSBYEMPLOYEE(7)


----CREATE indexes
drop index employee.IdxStartDate
create  INDEX IdxStartDate
on employee(hiredate)
where hiredate >= '2019-01-01' and hiredate <='2023-01-01';

create index idx_employee on employee(EmployeeId);

drop index employee.idx_EmployeeBY_Department
Create index idx_EmployeeBY_Department
on employee(departmentid)
where departmentid = '1';

Create index idx_EmployeeBY_Departmentid
on employee(departmentid);


--Query using an index on the NetSalary column to speed up searching for employees with specific salary ranges

create index idx_salary_specified_range
on salary(netsalary);
select * from salary where netsalary >= 30000 and  netsalary <= 50000


create index idx_employee_by_designation
on designation(designationname)

select * from Employee


---create view
--CREATE VIEW [view_name] AS
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition;

--Query using a view to get employees who have taken leaves within a specific date range
--Query using a view to get employees with their respective department and designation names

go
create view [employee_leave] as
select e.FirstName, e.LastName,l.LeaveID  from Employee as e right join leave as l on e.EmployeeID = l.EmployeeID
where l.StartDate >= '2023-05-10' and l.EndDate <='2023-05-14';
go
SELECT * FROM [employee_leave];
go
create view [employee_department_details] as 
select e.EmployeeID,e.FirstName,e.LastName,dep.DepartmentName,deg.DesignationName                    
from employee as e inner join department as dep on e.DepartmentID = dep.DepartmentID inner join Designation as deg on e.designationid= deg.DesignationId

select * from[employee_department_details];


---triggers
CREATE TRIGGER tr_UpdateHireDate
ON Employee
AFTER INSERT
AS
BEGIN
    
    UPDATE Employee
    SET HireDate = GETDATE() 
    WHERE EmployeeID IN (SELECT EmployeeID FROM INSERTED);
END;
go
--TRIGGER FOR UPDATE
create TRIGGER tr_UpdateModifiedDate
ON Employee
AFTER UPDATE
AS
BEGIN
    
    UPDATE Employee
    SET modifieddate = GETDATE() 
    WHERE EmployeeID IN (SELECT EmployeeID FROM INSERTED);
	print 'user data updated'
END;
go
create TRIGGER tr_deleteSalaryOFemployee
ON Employee
AFTER delete
AS
BEGIN
    
    delete from salary 
    WHERE EmployeeID IN (SELECT EmployeeID FROM deleted);
	print 'user data deleted'
END;
go
--Trigger to enforce a constraint where the EndDate of a leave must be greater than or equal to the StartDate

CREATE TRIGGER tr_EnforceLeaveConstraint
ON Leave
INSTEAD OF INSERT
AS
BEGIN 
    
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE EndDate < StartDate
    )
	
    BEGIN 
        
       PRINT 'EndDate must be greater than or equal to StartDate.';
    END 
    ELSE
    BEGIN
       
        INSERT INTO Leave (StartDate, EndDate)
        SELECT StartDate, EndDate
        FROM INSERTED;
    END
	END;
GO

DELETE FROM Employee
WHERE EmployeeID = 13 ;
select * from employee;
select * from salary;
GO
 -- Insert a default salary record for the new employee
CREATE TRIGGER tr_AutoInsertSalary
ON Employee
AFTER INSERT
AS
BEGIN
   
    INSERT INTO Salary (EmployeeID, BasicSalary)
    SELECT EmployeeID, 25000
    FROM INSERTED;
END;
GO
--


--Cursors
DECLARE @FirstName NVARCHAR(255)
DECLARE EmployeeCursor CURSOR FOR
SELECT FirstName
FROM Employee

OPEN EmployeeCursor

FETCH NEXT FROM EmployeeCursor INTO @FirstName

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @FirstName 
    FETCH NEXT FROM EmployeeCursor INTO @FirstName
END

CLOSE EmployeeCursor
DEALLOCATE EmployeeCursor
go


---2 Query using a cursor to update the basic salary of all employees by a certain percentage
declare @basicsalary bigint 
declare @total bigint
declare @increase decimal(4,2)
declare @employeeid int
set @increase =10.00
declare incrementsalaryCursor cursor for 
select employeeid, basicsalary 
from salary
open incrementsalaryCursor


fetch next from incrementsalaryCursor into @employeeid, @basicsalary 
while @@fetch_status =0
begin 
--set @basicsalary =@basicsalary +@increase
set @total = (@BasicSalary * (1 + (@Increase / 100)))
UPDATE salary  SET BasicSalary= @total WHERE EmployeeID= @employeeid
print @total
fetch next from incrementsalaryCursor into @employeeid, @basicsalary 

end
close incrementsalaryCursor
deallocate incrementsalaryCursor
go
  select * from salary
go

--5 Query using a cursor to calculate the total salary for each employee and display the results

declare @basicsalary bigint
declare @allowance int
declare @deduction int 
declare @total int 
declare @employeeid int
declare cr_totalsalary cursor for 
select EmployeeID, basicsalary 
from salary
open cr_totalsalary
fetch next from  cr_totalsalary into  @employeeid , @basicsalary  
while @@FETCH_STATUS=0
begin
set @allowance = (@basicsalary * (0.3))
set @deduction = (@basicsalary * (0.15))
set @total =((@basicsalary+@allowance)-(@deduction))
PRINT @employeeid print  @basicsalary print @total
fetch next from  cr_totalsalary into  @employeeid , @basicsalary 
end
close cr_totalsalary
deallocate cr_totalsalary
go

--Query using a cursor to update employee designations based on their years of service

declare @serviceyears int
declare @hiredate date 
DECLARE @NEWdesignationid INT
DECLARE @EMPLOYEEID INT
DECLARE @designationid INT
declare cr_promoteemployee cursor for 
select EmployeeId , hiredate, designationid 
from Employee
open cr_promoteemployee
fetch next from cr_promoteemployee into @employeeid,@hiredate,@designationid
while @@FETCH_STATUS=0
begin

  set  @serviceyears =  DATEDIFF(YEAR,@hiredate,GETDATE())

IF @serviceyears <2
BEGIN
SET @newdesignationid = 7
END
ELSE iF  @serviceyears  >= 2 AND @serviceyears <= 6
BEGIN
  SET @newdesignationid = 6   
END
ELSE  
BEGIN
 SET @NEWdesignationid =8
END
 UPDATE EMPLOYEE  SET DesignationId= @NEWdesignationid WHERE EmployeeID= @employeeid
 PRINT  @designationid  PRINT  @employeeid
fetch next from cr_promoteemployee into @employeeid,@hiredate,@designationid
End 

close cr_promoteemployee
deallocate cr_promoteemployee

select * from department



insert into Employee (FirstName,LastName,DateofBirth,EmpAddress,ContactNumber,HireDate,Email,DepartmentID )
 values('bjvjv' ,'vkjvjk', '1984-10-18','dubai',5456611,'2018-02-01','Jih@MAIL.COM' ,'6,5')
 insert into Department (DepartmentName) values('default')
/* INSERT INTO Employee (employeeid) VALUES (13);

-- Insert department details
INSERT INTO employee (departmentid) VALUES (6,5);
SET IDENTITY_INSERT Employee on;

INSERT INTO Employee (employeeid) VALUES (13);

-- Insert department details
INSERT INTO Department (departmentid) VALUES (6),(5);
SET IDENTITY_INSERT Department on; 
-- Insert employee's departments
INSERT INTO Department (EmployeeID, departmentid)
SELECT e.EmployeeID, d.departmentid
FROM Department e
CROSS JOIN Department d
WHERE e.EmployeeID= 'JOFRA'
  AND d.departmentid IN (6, 5);

SET IDENTITY_INSERT Department on;  
*/
--Cursor to assign a default department for employees who don't have one:
   --Suppose we have a Department table with a default department (DepartmentID = 1) representing employees without an assigned department.
   --We want to check if any employees have a NULL DepartmentID and assign them to the default department.
   go
   declare @employeeid int
   declare @departmentid int
   DECLARE @DEFAULTID INT
   SET @DEFAULTID = 4
   declare cr_defaultdeparment cursor for
   select  employeeid ,departmentid from Employee where departmentid is null
  
   open cr_defaultdeparment
   fetch next from cr_defaultdeparment into @employeeid ,@departmentid
while @@FETCH_STATUS=0
begin 
 UPDATE Employee
    SET DepartmentID = @DefaultID
    WHERE EmployeeID = @employeeid
PRINT @employeeid  PRINT @DefaultID
 fetch next from cr_defaultdeparment into @employeeid ,@departmentid
 END
 close cr_defaultdeparment
deallocate cr_defaultdeparment
go


DECLARE @EmployeeID INT;
DECLARE @DefaultDepartmentID INT;
SET @DefaultDepartmentID = 4;

-- Declare the cursor
DECLARE employee_cursor CURSOR FOR
SELECT EmployeeID
FROM Employee
WHERE DepartmentID IS NULL;

-- Open the cursor
OPEN employee_cursor;

-- Fetch the first employee
FETCH NEXT FROM employee_cursor INTO @EmployeeID;

-- Loop through the employees
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Update the DepartmentID for the current employee
    UPDATE Employee
    SET DepartmentID = @DefaultDepartmentID
    WHERE EmployeeID = @EmployeeID;

    -- Fetch the next employee
    FETCH NEXT FROM employee_cursor INTO @EmployeeID;
END;

-- Close and deallocate the cursor
CLOSE employee_cursor;
DEALLOCATE employee_cursor;
go

select * from designation
select * from employee
-----subqueries

--Query to get employees who have salaries greater than the average salary in their department

--select * from deparment
SELECT e.employeeid ,e.firstname,e.lastname,s.BasicSalary
FROM employee e
JOIN department d ON e.departmentid = d.departmentid
join salary s  on e.EmployeeID= s.EmployeeID
WHERE s.BasicSalary > (SELECT AVG(BasicSalary) as avgsalary FROM salary WHERE d.departmentid = e.departmentid)

--Query to retrieve employees who have taken leaves longer than the average leave duration+
SELECT  e.employeeid ,e.firstname,e.lastname,l.leaveid, DATEDIFF(day, startdate, enddate) + 1 AS leave_duration
FROM employee e
join Leave l on e.EmployeeID= l.employeeid
WHERE (DATEDIFF(day, startdate, enddate) + 1) > (SELECT AVG(DATEDIFF(day, startdate, enddate) + 1) FROM Leave)

--

  SELECT e.employeeid, e.FirstName,  d.departmentname
FROM employee AS e
INNER JOIN department AS d ON e.departmentid = d.departmentid
join salary s  on e.EmployeeID= s.EmployeeID
WHERE s.basicsalary >= (SELECT MAX(basicsalary)*0.9 FROM salary WHERE d.departmentid = e.departmentid)



CREATE TABLE EmployeeDepartments (
    EmployeeID INT,
    DepartmentID INT,
    PRIMARY KEY (EmployeeID, DepartmentID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);



-- Associate employee with departments
INSERT INTO EmployeeDepartments (EmployeeID, DepartmentID)
VALUES (1, 1),
       (1, 3); 

	   select * from Employee