CREATE PROCEDURE [Proctoring].[usp_RecordSuspiciousFlag]
    @AttemptId INT,
    @Reason NVARCHAR(MAX),
    @FlaggedBy VARCHAR(100) = 'ProctoringService'
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Exam].Attempt AS a
        WHERE a.AttemptId = @AttemptId
    )
    BEGIN
        THROW 50031, 'Attempt does not exist.', 1;
    END;

    IF NULLIF(LTRIM(RTRIM(@Reason)), '') IS NULL
    BEGIN
        THROW 50032, 'Reason is required for suspicious flag creation.', 1;
    END;

    INSERT INTO [Proctoring].SuspiciousFlag
    (
        AttemptId,
        Reason,
        FlaggedBy,
        Status
    )
    VALUES
    (
        @AttemptId,
        @Reason,
        @FlaggedBy,
        'OPEN'
    );

    SELECT
        CONVERT(INT, SCOPE_IDENTITY()) AS FlagId,
        @AttemptId AS AttemptId,
        'OPEN' AS Status;
END;
GO

