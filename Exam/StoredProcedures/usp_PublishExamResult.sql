CREATE PROCEDURE [Exam].[usp_PublishExamResult]
    @AttemptId INT,
    @PublishedByPersonId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @PublishedByPersonId IS NOT NULL
       AND NOT EXISTS
       (
           SELECT 1
           FROM [Identity].Person AS p
           WHERE p.PersonId = @PublishedByPersonId
       )
    BEGIN
        THROW 50021, 'PublishedByPersonId does not exist in Identity.Person.', 1;
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Exam].Result AS r
        WHERE r.AttemptId = @AttemptId
    )
    BEGIN
        THROW 50022, 'Result does not exist for the provided attempt.', 1;
    END;

    UPDATE r
    SET
        r.IsPublished = 1,
        r.PublishedAt = ISNULL(r.PublishedAt, GETDATE())
    FROM [Exam].Result AS r
    WHERE r.AttemptId = @AttemptId
      AND r.IsPublished = 0;

    INSERT INTO [Audit].AuditLog
    (
        TableName,
        RecordId,
        ActionType,
        OldValue,
        NewValue,
        PerformedBy,
        PerformedAt
    )
    SELECT
        'Exam.Result',
        r.ResultId,
        'PUBLISH_REQUEST',
        NULL,
        'Publish requested via procedure',
        @PublishedByPersonId,
        GETDATE()
    FROM [Exam].Result AS r
    WHERE r.AttemptId = @AttemptId;

    SELECT
        r.ResultId,
        r.AttemptId,
        r.FinalScore,
        r.Percentage,
        r.IsPublished,
        r.PublishedAt
    FROM [Exam].Result AS r
    WHERE r.AttemptId = @AttemptId;
END;
GO

