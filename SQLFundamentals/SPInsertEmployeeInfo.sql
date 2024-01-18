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
	VALUES 
	(
		CASE
		WHEN @FirstName IS NOT NULL AND CHARINDEX(' ',@EmployeeName) = 0 THEN @EmployeeName
		ELSE '' 
		END,
		CASE
		WHEN @LastName IS NOT NULL AND CHARINDEX(' ',@LastName) = 0 THEN @LastName
		ELSE '' 
		END
	); 

	INSERT INTO Address
	VALUES (@Street,@City,@State,@ZipCode); 

	INSERT INTO Employee
	VALUES 
	(
		IDENT_CURRENT('Address'),
		IDENT_CURRENT('Person'),
		LEFT(@CompanyName,20),
		@Position,
		CASE
		WHEN @EmployeeName IS NOT NULL AND CHARINDEX(' ',@EmployeeName) = 0 THEN @EmployeeName
		ELSE '' 
		END
	); 

RETURN 0
