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
    --A FUNCTIONS IS A BETTER SOLUTION:
	--CREATE FUNCTION Validate(@StringToCheck nvachar(20))
	--RETURNS BOOLEAN
	--AS
	--BEGIN
	--DECLARE
	--@Validation BOOLEAN
	--SET @Validation=@StringToCheck IS NOT NULL AND @StringToCheck != '' AND @StringToCheck NOT LIKE '% %'
	--RETURN @Validation
	--END
	IF ((@FirstName IS NOT NULL AND @FirstName != '' AND @FirstName NOT LIKE '% %')OR
		(@FirstName IS NOT NULL AND @FirstName != '' AND @FirstName NOT LIKE '% %')OR
		(@EmployeeName IS NOT NULL AND @EmployeeName != '' AND @EmployeeName NOT LIKE '% %'))
	BEGIN
		INSERT INTO Person 
		VALUES (@FirstName,@LastName); 

		INSERT INTO Address
		VALUES (@Street,@City,@State,@ZipCode); 

		INSERT INTO Employee
		VALUES 
		(
			IDENT_CURRENT('Address'),
			IDENT_CURRENT('Person'),
			LEFT(@CompanyName,20),
			@Position,
			@EmployeeName
		); 
	END

RETURN 0

