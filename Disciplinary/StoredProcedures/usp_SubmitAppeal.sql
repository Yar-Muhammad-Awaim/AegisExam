CREATE PROCEDURE [Disciplinary].[usp_SubmitAppeal]
    @SanctionId INT,
    @StudentId INT,
    @Reason NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    IF NULLIF(LTRIM(RTRIM(@Reason)), '') IS NULL
    BEGIN
        THROW 50041, 'Appeal reason is required.', 1;
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Disciplinary].Sanction AS s
        WHERE s.SanctionId = @SanctionId
          AND s.IsActive = 1
    )
    BEGIN
        THROW 50042, 'Sanction does not exist or is not active.', 1;
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Disciplinary].Sanction AS s
        INNER JOIN [Disciplinary].Review AS rv
            ON rv.ReviewId = s.ReviewId
        INNER JOIN [Exam].Attempt AS a
            ON a.AttemptId = rv.AttemptId
        INNER JOIN [Exam].ExamRegistration AS er
            ON er.RegId = a.RegId
        WHERE s.SanctionId = @SanctionId
          AND er.StudentId = @StudentId
    )
    BEGIN
        THROW 50043, 'Student is not linked to the provided sanction.', 1;
    END;

    IF EXISTS
    (
        SELECT 1
        FROM [Disciplinary].Appeal AS ap
        WHERE ap.SanctionId = @SanctionId
          AND ap.StudentId = @StudentId
          AND ap.Status IN ('PENDING', 'UNDER_REVIEW')
    )
    BEGIN
        THROW 50044, 'An active appeal already exists for this sanction.', 1;
    END;

    INSERT INTO [Disciplinary].Appeal
    (
        SanctionId,
        StudentId,
        Reason,
        Status
    )
    VALUES
    (
        @SanctionId,
        @StudentId,
        @Reason,
        'PENDING'
    );

    SELECT
        CONVERT(INT, SCOPE_IDENTITY()) AS AppealId,
        @SanctionId AS SanctionId,
        @StudentId AS StudentId,
        'PENDING' AS AppealStatus;
END;
GO

