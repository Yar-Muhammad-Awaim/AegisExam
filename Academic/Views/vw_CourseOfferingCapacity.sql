CREATE VIEW [Academic].[vw_CourseOfferingCapacity]
AS
WITH EnrollmentStats AS
(
    SELECT
        e.OfferingId,
        COUNT_BIG(*) AS EnrolledCount
    FROM [Academic].Enrollment AS e
    WHERE e.Status <> 'DROPPED'
    GROUP BY e.OfferingId
),
WaitlistStats AS
(
    SELECT
        cw.OfferingId,
        COUNT_BIG(*) AS WaitlistCount
    FROM [Academic].CourseWaitlist AS cw
    GROUP BY cw.OfferingId
)
SELECT
    co.OfferingId,
    c.CourseId,
    c.Code AS CourseCode,
    c.Name AS CourseName,
    sem.SemesterId,
    sem.Name AS SemesterName,
    co.Status AS OfferingStatus,
    co.Capacity,
    ISNULL(es.EnrolledCount, 0) AS EnrolledCount,
    ISNULL(ws.WaitlistCount, 0) AS WaitlistCount,
    CASE
        WHEN co.Capacity IS NULL THEN NULL
        ELSE co.Capacity - CONVERT(INT, ISNULL(es.EnrolledCount, 0))
    END AS AvailableSeats,
    CASE
        WHEN co.Capacity IS NULL THEN 0
        WHEN ISNULL(es.EnrolledCount, 0) >= co.Capacity THEN 1
        ELSE 0
    END AS IsFull,
    i.InstructorId,
    ip.FirstName + ' ' + ISNULL(ip.LastName, '') AS InstructorName
FROM [Academic].CourseOffering AS co
INNER JOIN [Academic].Course AS c
    ON c.CourseId = co.CourseId
INNER JOIN [Academic].Semester AS sem
    ON sem.SemesterId = co.SemesterId
INNER JOIN [Identity].Instructor AS i
    ON i.InstructorId = co.InstructorId
INNER JOIN [Identity].Person AS ip
    ON ip.PersonId = i.PersonId
LEFT JOIN EnrollmentStats AS es
    ON es.OfferingId = co.OfferingId
LEFT JOIN WaitlistStats AS ws
    ON ws.OfferingId = co.OfferingId;
GO

