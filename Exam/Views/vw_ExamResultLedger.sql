CREATE VIEW [Exam].[vw_ExamResultLedger]
AS
SELECT
    ex.ExamId,
    ex.Title AS ExamTitle,
    ex.ExamType,
    ex.Status AS ExamStatus,
    er.RegId,
    st.StudentId,
    p.FirstName,
    p.LastName,
    p.Email,
    a.AttemptId,
    a.StartTime,
    a.EndTime,
    a.Status AS AttemptStatus,
    a.IsSubmitted,
    r.ResultId,
    r.GradeBandId,
    r.IsPublished,
    r.PublishedAt,
    r.FinalScore AS RecordedFinalScore,
    r.Percentage AS RecordedPercentage,
    so.NewScore AS LatestOverriddenScore,
    COALESCE(so.NewScore, r.FinalScore) AS EffectiveFinalScore
FROM [Exam].Result AS r
INNER JOIN [Exam].Attempt AS a
    ON a.AttemptId = r.AttemptId
INNER JOIN [Exam].ExamRegistration AS er
    ON er.RegId = a.RegId
INNER JOIN [Exam].Exam AS ex
    ON ex.ExamId = er.ExamId
INNER JOIN [Identity].Student AS st
    ON st.StudentId = er.StudentId
INNER JOIN [Identity].Person AS p
    ON p.PersonId = st.PersonId
OUTER APPLY
(
    SELECT TOP (1)
        soInner.NewScore
    FROM [Exam].ScoreOverride AS soInner
    WHERE soInner.AttemptId = a.AttemptId
    ORDER BY soInner.OverriddenAt DESC, soInner.OverrideId DESC
) AS so;
GO

