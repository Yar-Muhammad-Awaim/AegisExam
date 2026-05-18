CREATE TRIGGER [Exam].[TR_Result_AfterInsertUpdate_PublishWorkflow]
ON [Exam].Result
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE r
    SET r.PublishedAt = GETDATE()
    FROM [Exam].Result AS r
    INNER JOIN inserted AS i
        ON i.ResultId = r.ResultId
    WHERE i.IsPublished = 1
      AND i.PublishedAt IS NULL;

    ;WITH NewlyPublished AS
    (
        SELECT
            i.ResultId,
            i.AttemptId,
            i.Percentage,
            d.IsPublished AS OldIsPublished
        FROM inserted AS i
        LEFT JOIN deleted AS d
            ON d.ResultId = i.ResultId
        WHERE i.IsPublished = 1
          AND (d.ResultId IS NULL OR d.IsPublished = 0)
    )
    INSERT INTO [Notification].Notification
    (
        PersonId,
        NotificationType,
        Channel,
        Subject,
        Body,
        SentAt,
        IsRead
    )
    SELECT
        p.PersonId,
        'RESULT_PUBLISHED',
        'IN_APP',
        CONCAT('Result published: ', ex.Title),
        CONCAT('Your result is now available. Score: ', CONVERT(VARCHAR(10), np.Percentage), '%.'),
        GETDATE(),
        0
    FROM NewlyPublished AS np
    INNER JOIN [Exam].Attempt AS a
        ON a.AttemptId = np.AttemptId
    INNER JOIN [Exam].ExamRegistration AS er
        ON er.RegId = a.RegId
    INNER JOIN [Identity].Student AS st
        ON st.StudentId = er.StudentId
    INNER JOIN [Identity].Person AS p
        ON p.PersonId = st.PersonId
    INNER JOIN [Exam].Exam AS ex
        ON ex.ExamId = er.ExamId;

    ;WITH NewlyPublished AS
    (
        SELECT
            i.ResultId,
            i.Percentage,
            d.IsPublished AS OldIsPublished
        FROM inserted AS i
        LEFT JOIN deleted AS d
            ON d.ResultId = i.ResultId
        WHERE i.IsPublished = 1
          AND (d.ResultId IS NULL OR d.IsPublished = 0)
    )
    INSERT INTO [Audit].AuditLog
    (
        TableName,
        RecordId,
        ActionType,
        OldValue,
        NewValue,
        PerformedAt
    )
    SELECT
        'Exam.Result',
        np.ResultId,
        'PUBLISH',
        CASE
            WHEN np.OldIsPublished IS NULL THEN 'Inserted as published'
            ELSE CONCAT('IsPublished=', CONVERT(VARCHAR(5), np.OldIsPublished))
        END,
        CONCAT('IsPublished=1;Percentage=', CONVERT(VARCHAR(10), np.Percentage)),
        GETDATE()
    FROM NewlyPublished AS np;
END;
GO

