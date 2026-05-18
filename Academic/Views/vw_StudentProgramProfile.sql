CREATE VIEW [Academic].[vw_StudentProgramProfile]
AS
SELECT
    s.StudentId,
    s.RollNumber,
    s.EnrollmentYear,
    s.Status AS StudentStatus,
    p.PersonId,
    p.FirstName,
    p.LastName,
    p.Email,
    p.PhoneNumber,
    pr.ProgramId,
    pr.Name AS ProgramName,
    pr.DegreeLevel,
    d.DeptId,
    d.Name AS DepartmentName,
    f.FacultyId,
    f.Name AS FacultyName,
    u.UniversityId,
    u.Name AS UniversityName
FROM [Identity].Student AS s
INNER JOIN [Identity].Person AS p
    ON p.PersonId = s.PersonId
INNER JOIN [Academic].Program AS pr
    ON pr.ProgramId = s.ProgramId
INNER JOIN [Academic].Department AS d
    ON d.DeptId = pr.DeptId
INNER JOIN [Academic].Faculty AS f
    ON f.FacultyId = d.FacultyId
INNER JOIN [Academic].University AS u
    ON u.UniversityId = f.UniversityId;
GO
