CREATE TABLE [dbo].[Company]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(20) NOT NULL, 
    [AddressId] INT NOT NULL,
    FOREIGN KEY (AddressId) REFERENCES Address(Id)
)
