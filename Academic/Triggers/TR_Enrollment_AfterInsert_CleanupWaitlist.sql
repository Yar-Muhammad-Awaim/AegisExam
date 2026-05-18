CREATE TRIGGER [Academic].[TR_Enrollment_AfterInsert_CleanupWaitlist]
ON [Academic].Enrollment
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE cw
    FROM [Academic].CourseWaitlist AS cw
    INNER JOIN inserted AS i
        ON i.OfferingId = cw.OfferingId
       AND i.StudentId = cw.StudentId;

    ;WITH AffectedOfferings AS
    (
        SELECT DISTINCT
            i.OfferingId
        FROM inserted AS i
    ),
    Reordered AS
    (
        SELECT
            cw.WaitlistId,
            ROW_NUMBER() OVER
            (
                PARTITION BY cw.OfferingId
                ORDER BY cw.Position ASC, cw.RequestedAt ASC, cw.WaitlistId ASC
            ) AS NewPosition
        FROM [Academic].CourseWaitlist AS cw
        INNER JOIN AffectedOfferings AS ao
            ON ao.OfferingId = cw.OfferingId
    )
    UPDATE cw
    SET cw.Position = r.NewPosition
    FROM [Academic].CourseWaitlist AS cw
    INNER JOIN Reordered AS r
        ON r.WaitlistId = cw.WaitlistId;
END;
GO

