CREATE TRIGGER [Disciplinary].[TR_AppealReview_AfterInsert_DecisionWorkflow]
ON [Disciplinary].AppealReview
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ap
    SET ap.Status =
        CASE
            WHEN i.Decision = 'OVERTURN' THEN 'APPROVED'
            WHEN i.Decision = 'UPHOLD' THEN 'REJECTED'
            WHEN i.Decision = 'PARTIAL' THEN 'PARTIALLY_APPROVED'
            ELSE 'UNDER_REVIEW'
        END
    FROM [Disciplinary].Appeal AS ap
    INNER JOIN inserted AS i
        ON i.AppealId = ap.AppealId;

    UPDATE s
    SET s.IsActive = 0
    FROM [Disciplinary].Sanction AS s
    INNER JOIN [Disciplinary].Appeal AS ap
        ON ap.SanctionId = s.SanctionId
    INNER JOIN inserted AS i
        ON i.AppealId = ap.AppealId
    WHERE i.Decision = 'OVERTURN'
      AND s.IsActive = 1;

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
        'APPEAL_REVIEWED',
        'IN_APP',
        'Appeal decision has been recorded',
        CONCAT('Decision: ', i.Decision, '. Please review the disciplinary portal for details.'),
        GETDATE(),
        0
    FROM inserted AS i
    INNER JOIN [Disciplinary].Appeal AS ap
        ON ap.AppealId = i.AppealId
    INNER JOIN [Identity].Student AS st
        ON st.StudentId = ap.StudentId
    INNER JOIN [Identity].Person AS p
        ON p.PersonId = st.PersonId;

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
        'Disciplinary.AppealReview',
        i.AppealReviewId,
        'INSERT',
        CONCAT('Decision=', i.Decision),
        reviewerPerson.PersonId,
        GETDATE()
    FROM inserted AS i
    INNER JOIN [Identity].Instructor AS ins
        ON ins.InstructorId = i.ReviewedBy
    INNER JOIN [Identity].Person AS reviewerPerson
        ON reviewerPerson.PersonId = ins.PersonId;
END;
GO

