CREATE VIEW [dbo].[EmployeeInfo] AS 
SELECT  
	E.Id AS EmployeeId,
	P.FirstName + P.LastName AS EmployeeFullName,
	A.ZipCode +'_'+ A.State+'_'+ A.City+'-'+A.Street AS EmployeeFullAddress,
	E.CompanyName+'_'+E.Position AS EmployeeCompanyInfo

FROM Employee E
INNER JOIN Address A ON A.Id = E.AddressId
INNER JOIN Person P ON P.Id = E.PersonId