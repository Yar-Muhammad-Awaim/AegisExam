CREATE TRIGGER [Proctoring].[TR_SuspiciousFlag_AfterInsert_Audit]
ON [Proctoring].SuspiciousFlag
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

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
        'PROCTORING_FLAG',
        'IN_APP',
        CONCAT('Suspicious activity detected: ', ex.Title),
        CONCAT('A proctoring flag was raised for your attempt. Reason: ', LEFT(i.Reason, 200)),
        GETDATE(),
        0
    FROM inserted AS i
    INNER JOIN [Exam].Attempt AS a
        ON a.AttemptId = i.AttemptId
    INNER JOIN [Exam].ExamRegistration AS er
        ON er.RegId = a.RegId
    INNER JOIN [Identity].Student AS st
        ON st.StudentId = er.StudentId
    INNER JOIN [Identity].Person AS p
        ON p.PersonId = st.PersonId
    INNER JOIN [Exam].Exam AS ex
        ON ex.ExamId = er.ExamId;

    INSERT INTO [Audit].AuditLog
    (
        TableName,
        RecordId,
        ActionType,
        NewValue,
        PerformedAt
    )
    SELECT
        'Proctoring.SuspiciousFlag',
        i.FlagId,
        'INSERT',
        CONCAT('Status=', i.Status, ';FlaggedBy=', i.FlaggedBy, ';Reason=', LEFT(i.Reason, 200)),
        GETDATE()
    FROM inserted AS i;
END;
GO
