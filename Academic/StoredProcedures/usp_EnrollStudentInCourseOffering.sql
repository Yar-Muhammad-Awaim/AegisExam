CREATE PROCEDURE [Academic].[usp_EnrollStudentInCourseOffering]
    @StudentId INT,
    @OfferingId INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF NOT EXISTS
    (
        SELECT 1
        FROM [Identity].Student AS s
        WHERE s.StudentId = @StudentId
          AND s.Status = 'ACTIVE'
    )
    BEGIN
        THROW 50001, 'Student does not exist or is not active.', 1;
    END;

    DECLARE @Capacity INT;
    DECLARE @OfferingStatus VARCHAR(20);
    DECLARE @CurrentEnrollment INT;
    DECLARE @WaitlistPosition INT;
    DECLARE @EnrollmentId INT;

    BEGIN TRANSACTION;

    SELECT
        @Capacity = co.Capacity,
        @OfferingStatus = co.Status
    FROM [Academic].CourseOffering AS co WITH (UPDLOCK, HOLDLOCK)
    WHERE co.OfferingId = @OfferingId;

    IF @OfferingStatus IS NULL
    BEGIN
        THROW 50002, 'Course offering not found.', 1;
    END;

    IF @OfferingStatus <> 'OPEN'
    BEGIN
        THROW 50003, 'Course offering is not open for enrollment.', 1;
    END;

    IF EXISTS
    (
        SELECT 1
        FROM [Academic].Enrollment AS e
        WHERE e.StudentId = @StudentId
          AND e.OfferingId = @OfferingId
    )
    BEGIN
        THROW 50004, 'Student is already enrolled in this course offering.', 1;
    END;

    SELECT
        @CurrentEnrollment = COUNT(*)
    FROM [Academic].Enrollment AS e WITH (UPDLOCK, HOLDLOCK)
    WHERE e.OfferingId = @OfferingId
      AND e.Status <> 'DROPPED';

    IF @Capacity IS NOT NULL AND @CurrentEnrollment >= @Capacity
    BEGIN
        IF EXISTS
        (
            SELECT 1
            FROM [Academic].CourseWaitlist AS cw
            WHERE cw.StudentId = @StudentId
              AND cw.OfferingId = @OfferingId
        )
        BEGIN
            THROW 50005, 'Student is already in the waitlist for this course offering.', 1;
        END;

        SELECT
            @WaitlistPosition = ISNULL(MAX(cw.Position), 0) + 1
        FROM [Academic].CourseWaitlist AS cw WITH (UPDLOCK, HOLDLOCK)
        WHERE cw.OfferingId = @OfferingId;

        INSERT INTO [Academic].CourseWaitlist
        (
            OfferingId,
            StudentId,
            Position
        )
        VALUES
        (
            @OfferingId,
            @StudentId,
            @WaitlistPosition
        );

        COMMIT TRANSACTION;

        SELECT
            CAST('WAITLISTED' AS VARCHAR(20)) AS ActionTaken,
            @OfferingId AS OfferingId,
            @StudentId AS StudentId,
            @WaitlistPosition AS WaitlistPosition;

        RETURN;
    END;

    INSERT INTO [Academic].Enrollment
    (
        StudentId,
        OfferingId,
        Status
    )
    VALUES
    (
        @StudentId,
        @OfferingId,
        'ENROLLED'
    );

    SET @EnrollmentId = CONVERT(INT, SCOPE_IDENTITY());

    COMMIT TRANSACTION;

    SELECT
        CAST('ENROLLED' AS VARCHAR(20)) AS ActionTaken,
        @EnrollmentId AS EnrollmentId,
        @OfferingId AS OfferingId,
        @StudentId AS StudentId;
END;
GO

