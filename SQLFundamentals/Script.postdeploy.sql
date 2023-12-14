/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO Person
VALUES ('A nice firstname','A nice lastname'); 

INSERT INTO Address
VALUES ('A nice street','A nice city','A nice state','A nice zip code'); 

INSERT INTO Address
VALUES ('A nice company street','A nice company city','A nice company state','A nice company zip code'); 

INSERT INTO Employee
VALUES ((SELECT id from Address WHERE Street='A nice street'),(SELECT id from Person WHERE FirstName='A nice firstname'),'A nice company','A nice position','A nice employee name'); 

INSERT INTO Company
VALUES ('A nice company',(SELECT id from Address WHERE Street='A nice company street')); 