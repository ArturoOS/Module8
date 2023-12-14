CREATE PROCEDURE [dbo].[SPInsertEmployeeInfo]
	@EmployeeName nvarchar(20) = NULL,
	@FirstName nvarchar(20) = NULL,
	@LastName nvarchar(20) = NULL,
	@CompanyName nvarchar(20),
	@Position nvarchar(20) = NULL,
	@Street nvarchar(20),
	@City nvarchar(20) = NULL,
	@State nvarchar(20) = NULL,
	@ZipCode nvarchar(20) = NULL
AS
	
	INSERT INTO Person
	VALUES (@FirstName,@LastName); 

	INSERT INTO Address
	VALUES (@Street,@City,@State,@ZipCode); 

	INSERT INTO Employee
	VALUES (IDENT_CURRENT('Address'),IDENT_CURRENT('Person'),@CompanyName,@Position,@EmployeeName); 

RETURN 0
