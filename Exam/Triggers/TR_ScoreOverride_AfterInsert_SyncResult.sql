CREATE TRIGGER [Exam].[TR_ScoreOverride_AfterInsert_SyncResult]
ON [Exam].ScoreOverride
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH AffectedAttempts AS
    (
        SELECT DISTINCT
            i.AttemptId
        FROM inserted AS i
    ),
    LatestOverride AS
    (
        SELECT
            so.AttemptId,
            so.NewScore,
            ROW_NUMBER() OVER
            (
                PARTITION BY so.AttemptId
                ORDER BY so.OverriddenAt DESC, so.OverrideId DESC
            ) AS RowNum
        FROM [Exam].ScoreOverride AS so
        INNER JOIN AffectedAttempts AS aa
            ON aa.AttemptId = so.AttemptId
    ),
    EffectiveScore AS
    (
        SELECT
            lo.AttemptId,
            CASE
                WHEN lo.NewScore < 0 THEN 0
                WHEN lo.NewScore > 100 THEN 100
                ELSE lo.NewScore
            END AS NormalizedScore
        FROM LatestOverride AS lo
        WHERE lo.RowNum = 1
    )
    UPDATE r
    SET
        r.FinalScore = es.NormalizedScore,
        r.Percentage = es.NormalizedScore,
        r.GradeBandId = band.BandId
    FROM [Exam].Result AS r
    INNER JOIN EffectiveScore AS es
        ON es.AttemptId = r.AttemptId
    INNER JOIN [Exam].Attempt AS a
        ON a.AttemptId = r.AttemptId
    INNER JOIN [Exam].ExamRegistration AS er
        ON er.RegId = a.RegId
    INNER JOIN [Exam].Exam AS ex
        ON ex.ExamId = er.ExamId
    OUTER APPLY
    (
        SELECT TOP (1)
            gb.BandId
        FROM [Exam].GradeBand AS gb
        WHERE gb.ScaleId = ex.GradeScaleId
          AND es.NormalizedScore BETWEEN gb.MinPercentage AND gb.MaxPercentage
        ORDER BY gb.MaxPercentage DESC, gb.MinPercentage DESC
    ) AS band;

    INSERT INTO [Audit].AuditLog
    (
        TableName,
        RecordId,
        ActionType,
        NewValue,
        PerformedBy,
        PerformedAt
    )
    SELECT
        'Exam.ScoreOverride',
        i.OverrideId,
        'INSERT',
        CONCAT('AttemptId=', CONVERT(VARCHAR(20), i.AttemptId), ';NewScore=', CONVERT(VARCHAR(20), i.NewScore)),
        ad.PersonId,
        GETDATE()
    FROM inserted AS i
    LEFT JOIN [Identity].Admin AS ad
        ON ad.AdminId = i.OverriddenBy;
END;
GO

