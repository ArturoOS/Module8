CREATE VIEW [dbo].[EmployeeViewInfo] AS 
SELECT  
	E.Id AS EmployeeId,
	CASE
		WHEN P.FirstName IS NOT NULL THEN P.FirstName
		ELSE P.LastName 
	END AS EmployeeFullNameEmployeeFullName,
	A.ZipCode +'_'+ A.State+'_'+ A.City+'-'+A.Street AS EmployeeFullAddress,
	LEFT(E.CompanyName, 20)+E.Position AS EmployeeCompanyInfo
FROM Employee E
INNER JOIN Address A ON A.Id = E.AddressId
INNER JOIN Person P ON P.Id = E.PersonId
ORDER BY E.CompanyName, A.City ASC offset 0 rows