CREATE VIEW [Proctoring].[vw_AttemptRiskOverview]
AS
WITH ActionStats AS
(
    SELECT
        pa.AttemptId,
        COUNT_BIG(*) AS ActionCount
    FROM [Proctoring].Action AS pa
    GROUP BY pa.AttemptId
),
FlagStats AS
(
    SELECT
        sf.AttemptId,
        COUNT_BIG(*) AS TotalFlags,
        SUM(CASE WHEN sf.Status = 'OPEN' THEN 1 ELSE 0 END) AS OpenFlags,
        MAX(sf.FlaggedAt) AS LastFlaggedAt
    FROM [Proctoring].SuspiciousFlag AS sf
    GROUP BY sf.AttemptId
)
SELECT
    a.AttemptId,
    er.RegId,
    ex.ExamId,
    ex.Title AS ExamTitle,
    st.StudentId,
    p.FirstName,
    p.LastName,
    a.Status AS AttemptStatus,
    a.StartTime,
    a.EndTime,
    ISNULL(ac.ActionCount, 0) AS ActionCount,
    ISNULL(fs.TotalFlags, 0) AS TotalFlags,
    ISNULL(fs.OpenFlags, 0) AS OpenFlags,
    fs.LastFlaggedAt,
    CASE
        WHEN ISNULL(fs.OpenFlags, 0) > 0 OR ISNULL(fs.TotalFlags, 0) >= 3 THEN 'HIGH'
        WHEN ISNULL(fs.TotalFlags, 0) = 2 OR ISNULL(ac.ActionCount, 0) >= 15 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS RiskLevel
FROM [Exam].Attempt AS a
INNER JOIN [Exam].ExamRegistration AS er
    ON er.RegId = a.RegId
INNER JOIN [Exam].Exam AS ex
    ON ex.ExamId = er.ExamId
INNER JOIN [Identity].Student AS st
    ON st.StudentId = er.StudentId
INNER JOIN [Identity].Person AS p
    ON p.PersonId = st.PersonId
LEFT JOIN ActionStats AS ac
    ON ac.AttemptId = a.AttemptId
LEFT JOIN FlagStats AS fs
    ON fs.AttemptId = a.AttemptId;
GO

