CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [AddressId] INT NOT NULL, 
    [PersonId] INT NOT NULL, 
    [CompanyName] NVARCHAR(20) NOT NULL, 
    [Position] NVARCHAR(30) NULL, 
    [EmployeeName] NVARCHAR(100) NULL,
    FOREIGN KEY (AddressId) REFERENCES Address(Id),
    FOREIGN KEY (PersonId) REFERENCES Person(Id),
)
