-- ==========================================================
-- IDENTITY SCHEMA
-- ==========================================================
SET IDENTITY_INSERT [Identity].Person ON;
MERGE INTO [Identity].Person AS Target
USING (VALUES
    (1, 'Alice', 'Smith', 'alice@test.ac.edu', '123-456-7890', '1995-05-15', 'NID001', 'hash1', GETDATE()),
    (2, 'Bob', 'Jones', 'bob@test.ac.edu', '123-456-7891', '1998-02-20', 'NID002', 'hash2', GETDATE()),
    (3, 'Charlie', 'Brown', 'charlie@test.ac.edu', '123-456-7892', '1980-11-10', 'NID003', 'hash3', GETDATE()),
    (4, 'Diana', 'Prince', 'diana@test.ac.edu', '123-456-7893', '1990-07-25', 'NID004', 'hash4', GETDATE()),
    (5, 'Eve', 'Adams', 'eve@test.ac.edu', '123-456-7894', '1975-12-05', 'NID005', 'hash5', GETDATE())
) AS Source (PersonId, FirstName, LastName, Email, PhoneNumber, DateOfBirth, NationalID, PasswordHash, CreatedAt)
ON Target.PersonId = Source.PersonId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (PersonId, FirstName, LastName, Email, PhoneNumber, DateOfBirth, NationalID, PasswordHash, CreatedAt)
    VALUES (PersonId, FirstName, LastName, Email, PhoneNumber, DateOfBirth, NationalID, PasswordHash, CreatedAt);
SET IDENTITY_INSERT [Identity].Person OFF;

MERGE INTO [Identity].PersonRole AS Target
USING (VALUES
    (1, 'STUDENT'),
    (2, 'STUDENT'),
    (3, 'INSTRUCTOR'),
    (4, 'INSTRUCTOR'),
    (5, 'ADMIN')
) AS Source (PersonId, RoleType)
ON Target.PersonId = Source.PersonId AND Target.RoleType = Source.RoleType
WHEN NOT MATCHED BY TARGET THEN
    INSERT (PersonId, RoleType)
    VALUES (PersonId, RoleType);

-- ==========================================================
-- ACADEMIC SCHEMA
-- ==========================================================
SET IDENTITY_INSERT [Academic].University ON;
MERGE INTO [Academic].University AS Target
USING (VALUES
    (1, 'Aegis Tech University', 'USA', 'UTC-5', 'https://aegis.edu'),
    (2, 'Global Science Institute', 'UK', 'UTC', 'https://gsi.ac.uk'),
    (3, 'National Arts College', 'Canada', 'UTC', 'https://nac.ca'),
    (4, 'Eastern Medical School', 'Australia', 'UTC-4', 'https://ems.edu.au'),
    (5, 'Western Business Hub', 'Germany', 'UTC+10', 'https://wbh.de')
) AS Source (UniversityId, Name, Country, Timezone, Website)
ON Target.UniversityId = Source.UniversityId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (UniversityId, Name, Country, Timezone, Website)
    VALUES (UniversityId, Name, Country, Timezone, Website);
SET IDENTITY_INSERT [Academic].University OFF;

-- Continue extending this pattern for Faculty, Department, Course, etc.SET IDENTITY_INSERT [Identity.Student] ON;
MERGE INTO [Identity.Student] AS Target
USING (VALUES
    (1, 1, 1, 'R001', 2024, 'ACTIVE'), (2, 2, 1, 'R002', 2024, 'ACTIVE'), (3, 3, 1, 'R003', 2024, 'ACTIVE'), (4, 4, 1, 'R004', 2024, 'ACTIVE'), (5, 5, 1, 'R005', 2024, 'ACTIVE')
) AS Source (StudentId, PersonId, ProgramId, RollNumber, EnrollmentYear, Status)
ON Target.StudentId = Source.StudentId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentId, PersonId, ProgramId, RollNumber, EnrollmentYear, Status)
    VALUES (StudentId, PersonId, ProgramId, RollNumber, EnrollmentYear, Status);
SET IDENTITY_INSERT [Identity.Student] OFF;

SET IDENTITY_INSERT [Identity.Instructor] ON;
MERGE INTO [Identity.Instructor] AS Target
USING (VALUES
    (1, 3, 1, 'Prof', 1), (2, 4, 1, 'Dr', 1), (3, 1, 1, 'Mr', 1), (4, 2, 1, 'Ms', 1), (5, 5, 1, 'Doc', 1)
) AS Source (InstructorId, PersonId, DeptId, Title, IsActive)
ON Target.InstructorId = Source.InstructorId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (InstructorId, PersonId, DeptId, Title, IsActive)
    VALUES (InstructorId, PersonId, DeptId, Title, IsActive);
SET IDENTITY_INSERT [Identity.Instructor] OFF;

SET IDENTITY_INSERT [Identity.Admin] ON;
MERGE INTO [Identity.Admin] AS Target
USING (VALUES
    (1, 5, 'SUPER', 1), (2, 4, 'DEPARTMENT', 1), (3, 3, 'COURSE', 1), (4, 2, 'SUPER', 1), (5, 1, 'SUPER', 1)
) AS Source (AdminId, PersonId, RoleLevel, IsActive)
ON Target.AdminId = Source.AdminId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (AdminId, PersonId, RoleLevel, IsActive)
    VALUES (AdminId, PersonId, RoleLevel, IsActive);
SET IDENTITY_INSERT [Identity.Admin] OFF;

SET IDENTITY_INSERT [Academic.Faculty] ON;
MERGE INTO [Academic.Faculty] AS Target
USING (VALUES
    (1, 1, 'Engineering', 'ENG'), (2, 1, 'Science', 'SCI'), (3, 1, 'Arts', 'ART'), (4, 1, 'Business', 'BUS'), (5, 1, 'Medicine', 'MED')
) AS Source (FacultyId, UniversityId, Name, Code)
ON Target.FacultyId = Source.FacultyId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (FacultyId, UniversityId, Name, Code)
    VALUES (FacultyId, UniversityId, Name, Code);
SET IDENTITY_INSERT [Academic.Faculty] OFF;

SET IDENTITY_INSERT [Academic.Department] ON;
MERGE INTO [Academic.Department] AS Target
USING (VALUES
    (1, 1, 'Computer Science', 'CS'), (2, 1, 'Software Eng', 'SE'), (3, 2, 'Physics', 'PHY'), (4, 4, 'Math', 'MTH'), (5, 5, 'Bio', 'BIO')
) AS Source (DeptId, FacultyId, Name, Code)
ON Target.DeptId = Source.DeptId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (DeptId, FacultyId, Name, Code)
    VALUES (DeptId, FacultyId, Name, Code);
SET IDENTITY_INSERT [Academic.Department] OFF;

SET IDENTITY_INSERT [Academic.Program] ON;
MERGE INTO [Academic.Program] AS Target
USING (VALUES
    (1, 1, 'BSc CS', 'Bachelor', 120), (2, 1, 'MSc CS', 'Master', 30), (3, 3, 'BSc PHY', 'Bachelor', 120), (4, 4, 'BSc Math', 'Bachelor', 120), (5, 5, 'BSc Bio', 'Bachelor', 120)
) AS Source (ProgramId, DeptId, Name, DegreeLevel, TotalCreditHours)
ON Target.ProgramId = Source.ProgramId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProgramId, DeptId, Name, DegreeLevel, TotalCreditHours)
    VALUES (ProgramId, DeptId, Name, DegreeLevel, TotalCreditHours);
SET IDENTITY_INSERT [Academic.Program] OFF;

SET IDENTITY_INSERT [Academic.Semester] ON;
MERGE INTO [Academic.Semester] AS Target
USING (VALUES
    (1, 1, 'Fall 2024', '2024-09-01', '2024-12-15', 1), (2, 1, 'Spring 2025', '2025-01-10', '2025-05-20', 1), (3, 1, 'Summer 2025', '2025-06-01', '2025-08-15', 1), (4, 1, 'Fall 2025', '2025-09-01', '2025-12-15', 1), (5, 1, 'Spring 2026', '2026-01-10', '2026-05-20', 1)
) AS Source (SemesterId, UniversityId, Name, StartDate, EndDate, IsActive)
ON Target.SemesterId = Source.SemesterId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (SemesterId, UniversityId, Name, StartDate, EndDate, IsActive)
    VALUES (SemesterId, UniversityId, Name, StartDate, EndDate, IsActive);
SET IDENTITY_INSERT [Academic.Semester] OFF;

SET IDENTITY_INSERT [Academic.Course] ON;
MERGE INTO [Academic.Course] AS Target
USING (VALUES
    (1, 1, 'CS101', 'Intro to CS', 3, 1), (2, 1, 'CS102', 'Data Structures', 3, 1), (3, 1, 'CS201', 'Algorithms', 4, 1), (4, 2, 'SE101', 'Software Design', 3, 1), (5, 3, 'PHY101', 'Physics I', 4, 1)
) AS Source (CourseId, DeptId, Code, Name, CreditHours, IsActive)
ON Target.CourseId = Source.CourseId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (CourseId, DeptId, Code, Name, CreditHours, IsActive)
    VALUES (CourseId, DeptId, Code, Name, CreditHours, IsActive);
SET IDENTITY_INSERT [Academic.Course] OFF;

MERGE INTO [Academic.CoursePrerequisite] AS Target
USING (VALUES
    (2, 1, 'C'), (3, 2, 'C'), (4, 1, 'C'), (5, 1, 'C'), (1, 2, 'C')
) AS Source (CourseId, PrereqCourseId, MinGrade)
ON Target.CourseId = Source.CourseId AND Target.PrereqCourseId = Source.PrereqCourseId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (CourseId, PrereqCourseId, MinGrade)
    VALUES (CourseId, PrereqCourseId, MinGrade);

SET IDENTITY_INSERT [Academic.CourseOffering] ON;
MERGE INTO [Academic.CourseOffering] AS Target
USING (VALUES
    (1, 1, 1, 1, 50, 'OPEN'), (2, 2, 1, 1, 40, 'OPEN'), (3, 3, 1, 2, 30, 'OPEN'), (4, 4, 1, 2, 60, 'OPEN'), (5, 5, 1, 1, 45, 'OPEN')
) AS Source (OfferingId, CourseId, SemesterId, InstructorId, Capacity, Status)
ON Target.OfferingId = Source.OfferingId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (OfferingId, CourseId, SemesterId, InstructorId, Capacity, Status)
    VALUES (OfferingId, CourseId, SemesterId, InstructorId, Capacity, Status);
SET IDENTITY_INSERT [Academic.CourseOffering] OFF;

SET IDENTITY_INSERT [Academic.Enrollment] ON;
MERGE INTO [Academic.Enrollment] AS Target
USING (VALUES
    (1, 1, 1, GETDATE(), 'ACTIVE'), (2, 2, 1, GETDATE(), 'ACTIVE'), (3, 3, 2, GETDATE(), 'ACTIVE'), (4, 4, 2, GETDATE(), 'ACTIVE'), (5, 5, 3, GETDATE(), 'ACTIVE')
) AS Source (EnrollmentId, StudentId, OfferingId, EnrolledAt, Status)
ON Target.EnrollmentId = Source.EnrollmentId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (EnrollmentId, StudentId, OfferingId, EnrolledAt, Status)
    VALUES (EnrollmentId, StudentId, OfferingId, EnrolledAt, Status);
SET IDENTITY_INSERT [Academic.Enrollment] OFF;

SET IDENTITY_INSERT [Academic.CourseWaitlist] ON;
MERGE INTO [Academic.CourseWaitlist] AS Target
USING (VALUES
    (1, 1, 1, 1, GETDATE()), (2, 2, 2, 1, GETDATE()), (3, 3, 3, 1, GETDATE()), (4, 4, 4, 1, GETDATE()), (5, 5, 5, 1, GETDATE())
) AS Source (WaitlistId, OfferingId, StudentId, Position, RequestedAt)
ON Target.WaitlistId = Source.WaitlistId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (WaitlistId, OfferingId, StudentId, Position, RequestedAt)
    VALUES (WaitlistId, OfferingId, StudentId, Position, RequestedAt);
SET IDENTITY_INSERT [Academic.CourseWaitlist] OFF;

MERGE INTO [Academic.CourseEnrollmentGrade] AS Target
USING (VALUES
    (1, 'A', 4.0, GETDATE()), (2, 'B', 3.0, GETDATE()), (3, 'C', 2.0, GETDATE()), (4, 'A', 4.0, GETDATE()), (5, 'B', 3.0, GETDATE())
) AS Source (EnrollmentId, LetterGrade, GradePoints, UpdatedAt)
ON Target.EnrollmentId = Source.EnrollmentId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (EnrollmentId, LetterGrade, GradePoints, UpdatedAt)
    VALUES (EnrollmentId, LetterGrade, GradePoints, UpdatedAt);

SET IDENTITY_INSERT [QuestionBank.QuestionBank] ON;
MERGE INTO [QuestionBank.QuestionBank] AS Target
USING (VALUES
    (1, 1, 1, 'CS101 Fall Bank', GETDATE()), (2, 1, 1, 'CS102 Exams', GETDATE()), (3, 2, 2, 'SE Patterns', GETDATE()), (4, 3, 3, 'Physics Mechanics', GETDATE()), (5, 4, 4, 'Calculus Tests', GETDATE())
) AS Source (BankId, DeptId, CreatedBy, Name, CreatedAt)
ON Target.BankId = Source.BankId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (BankId, DeptId, CreatedBy, Name, CreatedAt)
    VALUES (BankId, DeptId, CreatedBy, Name, CreatedAt);
SET IDENTITY_INSERT [QuestionBank.QuestionBank] OFF;

SET IDENTITY_INSERT [QuestionBank.Topic] ON;
MERGE INTO [QuestionBank.Topic] AS Target
USING (VALUES
    (1, 1, 'Variables'), (2, 1, 'Loops'), (3, 2, 'Arrays'), (4, 2, 'Trees'), (5, 3, 'Singleton')
) AS Source (TopicId, BankId, Name)
ON Target.TopicId = Source.TopicId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (TopicId, BankId, Name)
    VALUES (TopicId, BankId, Name);
SET IDENTITY_INSERT [QuestionBank.Topic] OFF;

SET IDENTITY_INSERT [QuestionBank.Question] ON;
MERGE INTO [QuestionBank.Question] AS Target
USING (VALUES
    (1, 1, 1, 'MCQ', 'What is an int?', 5.0, 0, 'EASY', 1), (2, 2, 1, 'MCQ', 'How many loops?', 5.0, 0, 'EASY', 1), (3, 3, 1, 'MCQ', 'Array vs List?', 10.0, -1.0, 'HARD', 1), (4, 4, 1, 'MCQ', 'BST height?', 5.0, 0, 'MEDIUM', 1), (5, 5, 2, 'MCQ', 'Singleton definition?', 5.0, 0, 'MEDIUM', 1)
) AS Source (QuestionId, TopicId, CreatedBy, Type, QuestionText, DefaultMarks, NegativeMarks, Difficulty, IsActive)
ON Target.QuestionId = Source.QuestionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (QuestionId, TopicId, CreatedBy, Type, QuestionText, DefaultMarks, NegativeMarks, Difficulty, IsActive)
    VALUES (QuestionId, TopicId, CreatedBy, Type, QuestionText, DefaultMarks, NegativeMarks, Difficulty, IsActive);
SET IDENTITY_INSERT [QuestionBank.Question] OFF;

SET IDENTITY_INSERT [QuestionBank.QuestionOption] ON;
MERGE INTO [QuestionBank.QuestionOption] AS Target
USING (VALUES
    (1, 1, 'Integer', 1, 1), (2, 1, 'String', 0, 2), (3, 2, 'For', 1, 1), (4, 2, 'If', 0, 2), (5, 3, 'Both', 1, 1)
) AS Source (OptionId, QuestionId, OptionText, IsCorrect, OrderNum)
ON Target.OptionId = Source.OptionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (OptionId, QuestionId, OptionText, IsCorrect, OrderNum)
    VALUES (OptionId, QuestionId, OptionText, IsCorrect, OrderNum);
SET IDENTITY_INSERT [QuestionBank.QuestionOption] OFF;

SET IDENTITY_INSERT [QuestionBank.QuestionAttachment] ON;
MERGE INTO [QuestionBank.QuestionAttachment] AS Target
USING (VALUES
    (1, 1, '/files/q1.png', 'image/png'), (2, 2, '/files/q2.png', 'image/png'), (3, 3, '/files/q3.png', 'image/png'), (4, 4, '/files/q4.png', 'image/png'), (5, 5, '/files/q5.png', 'image/png')
) AS Source (AttachmentId, QuestionId, FilePath, FileType)
ON Target.AttachmentId = Source.AttachmentId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (AttachmentId, QuestionId, FilePath, FileType)
    VALUES (AttachmentId, QuestionId, FilePath, FileType);
SET IDENTITY_INSERT [QuestionBank.QuestionAttachment] OFF;

SET IDENTITY_INSERT [Exam.GradeScale] ON;
MERGE INTO [Exam.GradeScale] AS Target
USING (VALUES
    (1, 1, 'Standard 4.0'), (2, 1, 'Pass/Fail'), (3, 1, 'European System'), (4, 1, '100 Point'), (5, 1, 'Custom Curving')
) AS Source (ScaleId, UniversityId, Name)
ON Target.ScaleId = Source.ScaleId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ScaleId, UniversityId, Name)
    VALUES (ScaleId, UniversityId, Name);
SET IDENTITY_INSERT [Exam.GradeScale] OFF;

SET IDENTITY_INSERT [Exam.GradeBand] ON;
MERGE INTO [Exam.GradeBand] AS Target
USING (VALUES
    (1, 1, 'A', 90, 100, 4.0), (2, 1, 'B', 80, 89.9, 3.0), (3, 1, 'C', 70, 79.9, 2.0), (4, 1, 'D', 60, 69.9, 1.0), (5, 1, 'F', 0, 59.9, 0.0)
) AS Source (BandId, ScaleId, LetterGrade, MinPercentage, MaxPercentage, GpaPoints)
ON Target.BandId = Source.BandId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (BandId, ScaleId, LetterGrade, MinPercentage, MaxPercentage, GpaPoints)
    VALUES (BandId, ScaleId, LetterGrade, MinPercentage, MaxPercentage, GpaPoints);
SET IDENTITY_INSERT [Exam.GradeBand] OFF;

SET IDENTITY_INSERT [Exam.Exam] ON;
MERGE INTO [Exam.Exam] AS Target
USING (VALUES
    (1, 1, 1, 1, 'Midterm 1', 'QUIZ', 60, 'Attempt all', 1, 1, 0, 0, 'PUBLISHED'), (2, 2, 1, 1, 'Midterm 2', 'EXAM', 120, 'Attempt all', 1, 1, 0, 0, 'PUBLISHED'), (3, 3, 2, 1, 'Final', 'EXAM', 180, 'Attempt all', 1, 1, 0, 0, 'PUBLISHED'), (4, 4, 2, 1, 'Pop Quiz', 'QUIZ', 30, 'No notes', 1, 1, 0, 0, 'PUBLISHED'), (5, 5, 3, 1, 'Lab Exam', 'LAB', 120, 'Use ide', 1, 0, 1, 0, 'PUBLISHED')
) AS Source (ExamId, OfferingId, CreatedBy, GradeScaleId, Title, ExamType, DurationMinutes, Instructions, IsRandomized, BrowserLockdown, OpenBook, NegativeMarking, Status)
ON Target.ExamId = Source.ExamId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ExamId, OfferingId, CreatedBy, GradeScaleId, Title, ExamType, DurationMinutes, Instructions, IsRandomized, BrowserLockdown, OpenBook, NegativeMarking, Status)
    VALUES (ExamId, OfferingId, CreatedBy, GradeScaleId, Title, ExamType, DurationMinutes, Instructions, IsRandomized, BrowserLockdown, OpenBook, NegativeMarking, Status);
SET IDENTITY_INSERT [Exam.Exam] OFF;

SET IDENTITY_INSERT [Exam.ExamSection] ON;
MERGE INTO [Exam.ExamSection] AS Target
USING (VALUES
    (1, 1, 'Multiple Choice', 1, 30), (2, 1, 'Short Answer', 2, 30), (3, 2, 'Theory', 1, 60), (4, 2, 'Practical', 2, 60), (5, 3, 'Comprehensive', 1, 180)
) AS Source (SectionId, ExamId, Title, OrderNum, TimeLimitMinutes)
ON Target.SectionId = Source.SectionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (SectionId, ExamId, Title, OrderNum, TimeLimitMinutes)
    VALUES (SectionId, ExamId, Title, OrderNum, TimeLimitMinutes);
SET IDENTITY_INSERT [Exam.ExamSection] OFF;

SET IDENTITY_INSERT [Exam.ExamQuestion] ON;
MERGE INTO [Exam.ExamQuestion] AS Target
USING (VALUES
    (1, 1, 1, 1, 5.0), (2, 1, 2, 2, 5.0), (3, 2, 3, 1, 10.0), (4, 3, 4, 1, 5.0), (5, 4, 5, 1, 5.0)
) AS Source (EqId, SectionId, QuestionId, OrderNum, MarksOverride)
ON Target.EqId = Source.EqId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (EqId, SectionId, QuestionId, OrderNum, MarksOverride)
    VALUES (EqId, SectionId, QuestionId, OrderNum, MarksOverride);
SET IDENTITY_INSERT [Exam.ExamQuestion] OFF;

SET IDENTITY_INSERT [Exam.ExamSchedule] ON;
MERGE INTO [Exam.ExamSchedule] AS Target
USING (VALUES
    (1, 1, GETDATE(), GETDATE()+1, 'UTC', 1), (2, 2, GETDATE(), GETDATE()+1, 'UTC', 1), (3, 3, GETDATE(), GETDATE()+1, 'UTC', 1), (4, 4, GETDATE(), GETDATE()+1, 'UTC', 1), (5, 5, GETDATE(), GETDATE()+1, 'UTC', 1)
) AS Source (ScheduleId, ExamId, StartDatetime, EndDatetime, Timezone, IsActive)
ON Target.ScheduleId = Source.ScheduleId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ScheduleId, ExamId, StartDatetime, EndDatetime, Timezone, IsActive)
    VALUES (ScheduleId, ExamId, StartDatetime, EndDatetime, Timezone, IsActive);
SET IDENTITY_INSERT [Exam.ExamSchedule] OFF;

SET IDENTITY_INSERT [Academic.Room] ON;
MERGE INTO [Academic.Room] AS Target
USING (VALUES
    (1, 1, 'Hall A', 100, 0, 'Building 1'), (2, 1, 'Hall B', 100, 0, 'Building 1'), (3, 1, 'Lab 1', 50, 0, 'Building 2'), (4, 1, 'Online 1', 500, 1, 'Zoom'), (5, 1, 'Online 2', 500, 1, 'Teams')
) AS Source (RoomId, UniversityId, Name, Capacity, IsVirtual, Location)
ON Target.RoomId = Source.RoomId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (RoomId, UniversityId, Name, Capacity, IsVirtual, Location)
    VALUES (RoomId, UniversityId, Name, Capacity, IsVirtual, Location);
SET IDENTITY_INSERT [Academic.Room] OFF;

SET IDENTITY_INSERT [Exam.ExamRoom] ON;
MERGE INTO [Exam.ExamRoom] AS Target
USING (VALUES
    (1, 1, 1, 80), (2, 2, 2, 80), (3, 3, 3, 40), (4, 4, 4, 500), (5, 5, 5, 500)
) AS Source (ExamRoomId, ScheduleId, RoomId, CapacityOverride)
ON Target.ExamRoomId = Source.ExamRoomId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ExamRoomId, ScheduleId, RoomId, CapacityOverride)
    VALUES (ExamRoomId, ScheduleId, RoomId, CapacityOverride);
SET IDENTITY_INSERT [Exam.ExamRoom] OFF;

SET IDENTITY_INSERT [Exam.InvigilationAssignment] ON;
MERGE INTO [Exam.InvigilationAssignment] AS Target
USING (VALUES
    (1, 1, 1, GETDATE()), (2, 2, 2, GETDATE()), (3, 3, 3, GETDATE()), (4, 4, 4, GETDATE()), (5, 5, 5, GETDATE())
) AS Source (AssignmentId, ExamRoomId, InstructorId, AssignedAt)
ON Target.AssignmentId = Source.AssignmentId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (AssignmentId, ExamRoomId, InstructorId, AssignedAt)
    VALUES (AssignmentId, ExamRoomId, InstructorId, AssignedAt);
SET IDENTITY_INSERT [Exam.InvigilationAssignment] OFF;

SET IDENTITY_INSERT [Exam.ExamRegistration] ON;
MERGE INTO [Exam.ExamRegistration] AS Target
USING (VALUES
    (1, 1, 1, GETDATE(), 'CONFIRMED', 1), (2, 2, 2, GETDATE(), 'CONFIRMED', 1), (3, 3, 3, GETDATE(), 'CONFIRMED', 1), (4, 4, 4, GETDATE(), 'CONFIRMED', 1), (5, 5, 5, GETDATE(), 'CONFIRMED', 1)
) AS Source (RegId, StudentId, ExamId, RegisteredAt, Status, IsApproved)
ON Target.RegId = Source.RegId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (RegId, StudentId, ExamId, RegisteredAt, Status, IsApproved)
    VALUES (RegId, StudentId, ExamId, RegisteredAt, Status, IsApproved);
SET IDENTITY_INSERT [Exam.ExamRegistration] OFF;

SET IDENTITY_INSERT [Exam.Attempt] ON;
MERGE INTO [Exam.Attempt] AS Target
USING (VALUES
    (1, 1, 1, GETDATE(), GETDATE(), 'COMPLETED', '127.0', 'Chrome', 'Win11', 1), (2, 2, 2, GETDATE(), GETDATE(), 'COMPLETED', '127.0', 'Firefox', 'Win11', 1), (3, 3, 3, GETDATE(), GETDATE(), 'COMPLETED', '127.0', 'Edge', 'Mac', 1), (4, 4, 4, GETDATE(), GETDATE(), 'COMPLETED', '127.0', 'Chrome', 'Linux', 1), (5, 5, 5, GETDATE(), GETDATE(), 'COMPLETED', '127.0', 'Chrome', 'Win10', 1)
) AS Source (AttemptId, RegId, ExamRoomId, StartTime, EndTime, Status, IpAddress, BrowserInfo, OsInfo, IsSubmitted)
ON Target.AttemptId = Source.AttemptId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (AttemptId, RegId, ExamRoomId, StartTime, EndTime, Status, IpAddress, BrowserInfo, OsInfo, IsSubmitted)
    VALUES (AttemptId, RegId, ExamRoomId, StartTime, EndTime, Status, IpAddress, BrowserInfo, OsInfo, IsSubmitted);
SET IDENTITY_INSERT [Exam.Attempt] OFF;

SET IDENTITY_INSERT [Exam.AttemptAnswer] ON;
MERGE INTO [Exam.AttemptAnswer] AS Target
USING (VALUES
    (1, 1, 1, 1, 'Ans', '/p', 5.0, 1, 1, GETDATE()), (2, 2, 2, 3, 'Ans', '/p', 5.0, 1, 2, GETDATE()), (3, 3, 3, 4, 'Ans', '/p', 10.0, 1, 3, GETDATE()), (4, 4, 4, 5, 'Ans', '/p', 5.0, 1, 4, GETDATE()), (5, 5, 5, 5, 'Ans', '/p', 0.0, 0, 5, GETDATE())
) AS Source (AnswerId, AttemptId, QuestionId, SelectedOptionId, TextAnswer, FilePath, MarksAwarded, IsCorrect, GradedBy, GradedAt)
ON Target.AnswerId = Source.AnswerId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (AnswerId, AttemptId, QuestionId, SelectedOptionId, TextAnswer, FilePath, MarksAwarded, IsCorrect, GradedBy, GradedAt)
    VALUES (AnswerId, AttemptId, QuestionId, SelectedOptionId, TextAnswer, FilePath, MarksAwarded, IsCorrect, GradedBy, GradedAt);
SET IDENTITY_INSERT [Exam.AttemptAnswer] OFF;

SET IDENTITY_INSERT [Exam.ScoreOverride] ON;
MERGE INTO [Exam.ScoreOverride] AS Target
USING (VALUES
    (1, 1, 1, 10.0, 'Curve', GETDATE()), (2, 2, 2, 12.0, 'Curve', GETDATE()), (3, 3, 3, 14.0, 'Error in grading', GETDATE()), (4, 4, 4, 15.0, 'Excuse', GETDATE()), (5, 5, 5, 20.0, 'Bonus', GETDATE())
) AS Source (OverrideId, AttemptId, OverriddenBy, NewScore, Reason, OverriddenAt)
ON Target.OverrideId = Source.OverrideId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (OverrideId, AttemptId, OverriddenBy, NewScore, Reason, OverriddenAt)
    VALUES (OverrideId, AttemptId, OverriddenBy, NewScore, Reason, OverriddenAt);
SET IDENTITY_INSERT [Exam.ScoreOverride] OFF;

SET IDENTITY_INSERT [Exam.Result] ON;
MERGE INTO [Exam.Result] AS Target
USING (VALUES
    (1, 1, 1, 95.0, 95.0, 1, GETDATE()), (2, 2, 2, 85.0, 85.0, 1, GETDATE()), (3, 3, 3, 75.0, 75.0, 1, GETDATE()), (4, 4, 4, 65.0, 65.0, 1, GETDATE()), (5, 5, 5, 55.0, 55.0, 1, GETDATE())
) AS Source (ResultId, AttemptId, GradeBandId, FinalScore, Percentage, IsPublished, PublishedAt)
ON Target.ResultId = Source.ResultId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ResultId, AttemptId, GradeBandId, FinalScore, Percentage, IsPublished, PublishedAt)
    VALUES (ResultId, AttemptId, GradeBandId, FinalScore, Percentage, IsPublished, PublishedAt);
SET IDENTITY_INSERT [Exam.Result] OFF;

SET IDENTITY_INSERT [Proctoring.Action] ON;
MERGE INTO [Proctoring.Action] AS Target
USING (VALUES
    (1, 1, 'KEY', GETDATE(), 1), (2, 2, 'KEY', GETDATE(), 1), (3, 3, 'FOCUS', GETDATE(), 1), (4, 4, 'CLIPBOARD', GETDATE(), 1), (5, 5, 'KEY', GETDATE(), 1)
) AS Source (ActionId, AttemptId, ActionType, ActionTimestamp, SequenceNum)
ON Target.ActionId = Source.ActionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ActionId, AttemptId, ActionType, ActionTimestamp, SequenceNum)
    VALUES (ActionId, AttemptId, ActionType, ActionTimestamp, SequenceNum);
SET IDENTITY_INSERT [Proctoring.Action] OFF;

MERGE INTO [Proctoring.KeystrokeAction] AS Target
USING (VALUES
    (1, 'A', 'CTRL'), (2, 'C', 'CTRL'), (3, 'V', 'CTRL'), (4, 'ESC', 'NONE'), (5, 'ENTER', 'NONE')
) AS Source (ActionId, KeyPressed, ModifierKeys)
ON Target.ActionId = Source.ActionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ActionId, KeyPressed, ModifierKeys)
    VALUES (ActionId, KeyPressed, ModifierKeys);

MERGE INTO [Proctoring.FocusChangeAction] AS Target
USING (VALUES
    (1, 'Browser', 'Word', 'word.exe'), (2, 'Browser', 'Note', 'note.exe'), (3, 'Browser', 'Excel', 'excel.exe'), (4, 'Browser', 'Calc', 'calc.exe'), (5, 'Browser', 'Snipping', 'snip.exe')
) AS Source (ActionId, FromWindow, ToWindow, ProcessName)
ON Target.ActionId = Source.ActionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ActionId, FromWindow, ToWindow, ProcessName)
    VALUES (ActionId, FromWindow, ToWindow, ProcessName);

MERGE INTO [Proctoring.ClipboardAction] AS Target
USING (VALUES
    (1, 'COPY', 'HASH', 10), (2, 'PASTE', 'HASH', 10), (3, 'COPY', 'HASH', 20), (4, 'PASTE', 'HASH', 20), (5, 'COPY', 'HASH', 30)
) AS Source (ActionId, EventType, ContentHash, ContentLength)
ON Target.ActionId = Source.ActionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ActionId, EventType, ContentHash, ContentLength)
    VALUES (ActionId, EventType, ContentHash, ContentLength);

SET IDENTITY_INSERT [Proctoring.LocalActionQueue] ON;
MERGE INTO [Proctoring.LocalActionQueue] AS Target
USING (VALUES
    (1, 1, '{}', GETDATE(), GETDATE(), 1, 0), (2, 2, '{}', GETDATE(), GETDATE(), 1, 0), (3, 3, '{}', GETDATE(), GETDATE(), 1, 0), (4, 4, '{}', GETDATE(), GETDATE(), 1, 0), (5, 5, '{}', GETDATE(), GETDATE(), 1, 0)
) AS Source (QueueId, AttemptId, ActionDataJson, QueuedAt, SyncedAt, IsSynced, RetryCount)
ON Target.QueueId = Source.QueueId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (QueueId, AttemptId, ActionDataJson, QueuedAt, SyncedAt, IsSynced, RetryCount)
    VALUES (QueueId, AttemptId, ActionDataJson, QueuedAt, SyncedAt, IsSynced, RetryCount);
SET IDENTITY_INSERT [Proctoring.LocalActionQueue] OFF;

SET IDENTITY_INSERT [Proctoring.SimilarityComparison] ON;
MERGE INTO [Proctoring.SimilarityComparison] AS Target
USING (VALUES
    (1, 1, 2, 0.9, 'COSINE', GETDATE(), 1), (2, 1, 3, 0.1, 'COSINE', GETDATE(), 0), (3, 2, 4, 0.9, 'COSINE', GETDATE(), 1), (4, 3, 5, 0.8, 'COSINE', GETDATE(), 1), (5, 4, 5, 0.2, 'COSINE', GETDATE(), 0)
) AS Source (ComparisonId, Attempt1Id, Attempt2Id, SimilarityScore, Method, ComputedAt, IsFlagged)
ON Target.ComparisonId = Source.ComparisonId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ComparisonId, Attempt1Id, Attempt2Id, SimilarityScore, Method, ComputedAt, IsFlagged)
    VALUES (ComparisonId, Attempt1Id, Attempt2Id, SimilarityScore, Method, ComputedAt, IsFlagged);
SET IDENTITY_INSERT [Proctoring.SimilarityComparison] OFF;

SET IDENTITY_INSERT [Proctoring.SuspiciousFlag] ON;
MERGE INTO [Proctoring.SuspiciousFlag] AS Target
USING (VALUES
    (1, 1, 'High Similarity', 'SYSTEM', GETDATE(), 'OPEN'), (2, 2, 'Copy Paste', 'SYSTEM', GETDATE(), 'OPEN'), (3, 3, 'Lost Focus', 'SYSTEM', GETDATE(), 'RESOLVED'), (4, 4, 'Lost Focus', 'SYSTEM', GETDATE(), 'OPEN'), (5, 5, 'Secondary Screen', 'SYSTEM', GETDATE(), 'OPEN')
) AS Source (FlagId, AttemptId, Reason, FlaggedBy, FlaggedAt, Status)
ON Target.FlagId = Source.FlagId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (FlagId, AttemptId, Reason, FlaggedBy, FlaggedAt, Status)
    VALUES (FlagId, AttemptId, Reason, FlaggedBy, FlaggedAt, Status);
SET IDENTITY_INSERT [Proctoring.SuspiciousFlag] OFF;

SET IDENTITY_INSERT [Disciplinary.Review] ON;
MERGE INTO [Disciplinary.Review] AS Target
USING (VALUES
    (1, 1, 1, GETDATE(), 'Notes', 'GUILTY'), (2, 2, 2, GETDATE(), 'Notes', 'GUILTY'), (3, 3, 3, GETDATE(), 'Notes', 'WARNING'), (4, 4, 4, GETDATE(), 'Notes', 'CLEARED'), (5, 5, 5, GETDATE(), 'Notes', 'GUILTY')
) AS Source (ReviewId, AttemptId, InstructorId, ReviewDate, Notes, Outcome)
ON Target.ReviewId = Source.ReviewId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ReviewId, AttemptId, InstructorId, ReviewDate, Notes, Outcome)
    VALUES (ReviewId, AttemptId, InstructorId, ReviewDate, Notes, Outcome);
SET IDENTITY_INSERT [Disciplinary.Review] OFF;

SET IDENTITY_INSERT [Disciplinary.Sanction] ON;
MERGE INTO [Disciplinary.Sanction] AS Target
USING (VALUES
    (1, 1, 1, 'ZERO_SCORE', 'Notes', GETDATE(), 1), (2, 2, 2, 'WARNING', 'Notes', GETDATE(), 1), (3, 3, 3, 'ZERO_SCORE', 'Notes', GETDATE(), 1), (4, 4, 4, 'EXPULSION', 'Notes', GETDATE(), 1), (5, 5, 5, 'ZERO_SCORE', 'Notes', GETDATE(), 1)
) AS Source (SanctionId, ReviewId, IssuedBy, SanctionType, Notes, IssuedAt, IsActive)
ON Target.SanctionId = Source.SanctionId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (SanctionId, ReviewId, IssuedBy, SanctionType, Notes, IssuedAt, IsActive)
    VALUES (SanctionId, ReviewId, IssuedBy, SanctionType, Notes, IssuedAt, IsActive);
SET IDENTITY_INSERT [Disciplinary.Sanction] OFF;

SET IDENTITY_INSERT [Disciplinary.Appeal] ON;
MERGE INTO [Disciplinary.Appeal] AS Target
USING (VALUES
    (1, 1, 1, 'I didnt do it', GETDATE(), 'PENDING'), (2, 2, 2, 'Excuse', GETDATE(), 'PENDING'), (3, 3, 3, 'Mistake', GETDATE(), 'REJECTED'), (4, 4, 4, 'Tech issue', GETDATE(), 'ACCEPTED'), (5, 5, 5, 'Glitch', GETDATE(), 'PENDING')
) AS Source (AppealId, SanctionId, StudentId, Reason, SubmittedAt, Status)
ON Target.AppealId = Source.AppealId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (AppealId, SanctionId, StudentId, Reason, SubmittedAt, Status)
    VALUES (AppealId, SanctionId, StudentId, Reason, SubmittedAt, Status);
SET IDENTITY_INSERT [Disciplinary.Appeal] OFF;

SET IDENTITY_INSERT [Disciplinary.AppealReview] ON;
MERGE INTO [Disciplinary.AppealReview] AS Target
USING (VALUES
    (1, 1, 1, GETDATE(), 'REJECTED', 'Notes'), (2, 2, 2, GETDATE(), 'ACCEPTED', 'Notes'), (3, 3, 3, GETDATE(), 'REJECTED', 'Notes'), (4, 4, 4, GETDATE(), 'ACCEPTED', 'Notes'), (5, 5, 5, GETDATE(), 'REJECTED', 'Notes')
) AS Source (AppealReviewId, AppealId, ReviewedBy, ReviewDate, Decision, Notes)
ON Target.AppealReviewId = Source.AppealReviewId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (AppealReviewId, AppealId, ReviewedBy, ReviewDate, Decision, Notes)
    VALUES (AppealReviewId, AppealId, ReviewedBy, ReviewDate, Decision, Notes);
SET IDENTITY_INSERT [Disciplinary.AppealReview] OFF;

SET IDENTITY_INSERT [Notification.Notification] ON;
MERGE INTO [Notification.Notification] AS Target
USING (VALUES
    (1, 1, 'ALERT', 'EMAIL', 'Subj', 'Body', GETDATE(), 0), (2, 2, 'ALERT', 'EMAIL', 'Subj', 'Body', GETDATE(), 0), (3, 3, 'INFO', 'SMS', 'Subj', 'Body', GETDATE(), 0), (4, 4, 'ALERT', 'EMAIL', 'Subj', 'Body', GETDATE(), 1), (5, 5, 'INFO', 'EMAIL', 'Subj', 'Body', GETDATE(), 1)
) AS Source (NotificationId, PersonId, NotificationType, Channel, Subject, Body, SentAt, IsRead)
ON Target.NotificationId = Source.NotificationId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (NotificationId, PersonId, NotificationType, Channel, Subject, Body, SentAt, IsRead)
    VALUES (NotificationId, PersonId, NotificationType, Channel, Subject, Body, SentAt, IsRead);
SET IDENTITY_INSERT [Notification.Notification] OFF;

SET IDENTITY_INSERT [Audit.AuditLog] ON;
MERGE INTO [Audit.AuditLog] AS Target
USING (VALUES
    (1, 'Person', 1, 'CREATE', 'NULL', 'JSON', 1, GETDATE(), '127.0'), (2, 'Exam', 1, 'CREATE', 'NULL', 'JSON', 1, GETDATE(), '127.0'), (3, 'Result', 1, 'UPDATE', 'JSON', 'JSON', 1, GETDATE(), '127.0'), (4, 'Student', 1, 'DELETE', 'JSON', 'NULL', 1, GETDATE(), '127.0'), (5, 'Action', 1, 'CREATE', 'NULL', 'JSON', 1, GETDATE(), '127.0')
) AS Source (LogId, TableName, RecordId, ActionType, OldValue, NewValue, PerformedBy, PerformedAt, IpAddress)
ON Target.LogId = Source.LogId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (LogId, TableName, RecordId, ActionType, OldValue, NewValue, PerformedBy, PerformedAt, IpAddress)
    VALUES (LogId, TableName, RecordId, ActionType, OldValue, NewValue, PerformedBy, PerformedAt, IpAddress);
SET IDENTITY_INSERT [Audit.AuditLog] OFF;

