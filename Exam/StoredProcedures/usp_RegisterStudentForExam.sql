CREATE PROCEDURE [Exam].[usp_RegisterStudentForExam]
    @StudentId INT,
    @ExamId INT,
    @AutoApprove BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Identity].Student AS s
        WHERE s.StudentId = @StudentId
          AND s.Status = 'ACTIVE'
    )
    BEGIN
        THROW 50011, 'Student does not exist or is not active.', 1;
    END;

    DECLARE @OfferingId INT;
    DECLARE @ExamStatus VARCHAR(20);

    SELECT
        @OfferingId = e.OfferingId,
        @ExamStatus = e.Status
    FROM [Exam].Exam AS e
    WHERE e.ExamId = @ExamId;

    IF @OfferingId IS NULL
    BEGIN
        THROW 50012, 'Exam not found.', 1;
    END;

    IF @ExamStatus NOT IN ('SCHEDULED', 'OPEN')
    BEGIN
        THROW 50013, 'Exam is not open for registration.', 1;
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Academic].Enrollment AS en
        WHERE en.StudentId = @StudentId
          AND en.OfferingId = @OfferingId
          AND en.Status = 'ENROLLED'
    )
    BEGIN
        THROW 50014, 'Student is not enrolled in the course offering for this exam.', 1;
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Exam].ExamSchedule AS es
        WHERE es.ExamId = @ExamId
          AND es.IsActive = 1
    )
    BEGIN
        THROW 50015, 'Exam has no active schedule.', 1;
    END;

    IF EXISTS
    (
        SELECT 1
        FROM [Exam].ExamRegistration AS er
        WHERE er.StudentId = @StudentId
          AND er.ExamId = @ExamId
    )
    BEGIN
        THROW 50016, 'Student is already registered for this exam.', 1;
    END;

    INSERT INTO [Exam].ExamRegistration
    (
        StudentId,
        ExamId,
        Status,
        IsApproved
    )
    VALUES
    (
        @StudentId,
        @ExamId,
        'REGISTERED',
        @AutoApprove
    );

    SELECT
        CONVERT(INT, SCOPE_IDENTITY()) AS RegId,
        @StudentId AS StudentId,
        @ExamId AS ExamId,
        'REGISTERED' AS RegistrationStatus,
        @AutoApprove AS IsApproved;
END;
GO

