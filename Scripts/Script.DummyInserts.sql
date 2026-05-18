-- Academic.University
SET IDENTITY_INSERT [Academic].University ON;
GO
INSERT INTO [Academic].University (UniversityId, Name, Country, Timezone, Website)
VALUES
    (1, 'Aegis University', 'USA', 'America/New_York', 'https://aegis.edu'),
    (2, 'Northwind Tech', 'Canada', 'America/Toronto', 'https://northwind.edu'),
    (3, 'Contoso Institute', 'UK', 'Europe/London', 'https://contoso.edu'),
    (4, 'Fabrikam College', 'Australia', 'Australia/Sydney', 'https://fabrikam.edu'),
    (5, 'Woodgrove University', 'India', 'Asia/Kolkata', 'https://woodgrove.edu');
GO
SET IDENTITY_INSERT [Academic].University OFF;
GO

-- Academic.Faculty
SET IDENTITY_INSERT [Academic].Faculty ON;
GO
INSERT INTO [Academic].Faculty (FacultyId, UniversityId, Name, Code)
VALUES
    (1, 1, 'Engineering', 'ENG'),
    (2, 2, 'Science', 'SCI'),
    (3, 3, 'Business', 'BUS'),
    (4, 4, 'Arts', 'ART'),
    (5, 5, 'Computing', 'COMP');
GO
SET IDENTITY_INSERT [Academic].Faculty OFF;
GO

-- Academic.Department
SET IDENTITY_INSERT [Academic].Department ON;
GO
INSERT INTO [Academic].Department (DeptId, FacultyId, Name, Code)
VALUES
    (1, 1, 'Computer Science', 'CS'),
    (2, 2, 'Mathematics', 'MATH'),
    (3, 3, 'Finance', 'FIN'),
    (4, 4, 'History', 'HIST'),
    (5, 5, 'Software Engineering', 'SE');
GO
SET IDENTITY_INSERT [Academic].Department OFF;
GO

-- Academic.Program
SET IDENTITY_INSERT [Academic].Program ON;
GO
INSERT INTO [Academic].Program (ProgramId, DeptId, Name, DegreeLevel, TotalCreditHours)
VALUES
    (1, 1, 'BSc Computer Science', 'BACHELOR', 120),
    (2, 2, 'BSc Mathematics', 'BACHELOR', 120),
    (3, 3, 'BBA Finance', 'BACHELOR', 120),
    (4, 4, 'BA History', 'BACHELOR', 120),
    (5, 5, 'MSc Software Engineering', 'MASTER', 36);
GO
SET IDENTITY_INSERT [Academic].Program OFF;
GO

-- Identity.Person
SET IDENTITY_INSERT [Identity].Person ON;
GO
INSERT INTO [Identity].Person (PersonId, FirstName, LastName, Email, PhoneNumber, DateOfBirth, NationalID, PasswordHash, CreatedAt)
VALUES
    (1, 'Alex', 'Rivera', 'alex.rivera@example.edu', '+1-555-0101', '1995-04-12', '1234567890123', 'hash1', '2026-01-05T09:00:00'),
    (2, 'Jordan', 'Lee', 'jordan.lee@example.edu', '+1-555-0102', '1994-09-30', '2234567890123', 'hash2', '2026-01-05T09:05:00'),
    (3, 'Casey', 'Patel', 'casey.patel@example.edu', '+1-555-0103', '1996-02-18', '3234567890123', 'hash3', '2026-01-05T09:10:00'),
    (4, 'Taylor', 'Morgan', 'taylor.morgan@example.edu', '+1-555-0104', '1993-11-07', '4234567890123', 'hash4', '2026-01-05T09:15:00'),
    (5, 'Riley', 'Chen', 'riley.chen@example.edu', '+1-555-0105', '1992-06-25', '5234567890123', 'hash5', '2026-01-05T09:20:00');
GO
SET IDENTITY_INSERT [Identity].Person OFF;
GO

-- Identity.PersonRole
INSERT INTO [Identity].PersonRole (PersonId, RoleType)
VALUES
    (1, 'STUDENT'),
    (2, 'INSTRUCTOR'),
    (2, 'ADMIN');
GO

-- Identity.Student
SET IDENTITY_INSERT [Identity].Student ON;
GO
INSERT INTO [Identity].Student (StudentId, PersonId, ProgramId, RollNumber, EnrollmentYear, Status)
VALUES
    (1, 1, 1, 'CS2026-001', 2026, 'ACTIVE'),
    (2, 2, 2, 'MATH2026-002', 2026, 'ACTIVE'),
    (3, 3, 3, 'FIN2026-003', 2026, 'ACTIVE'),
    (4, 4, 4, 'HIST2026-004', 2026, 'ACTIVE'),
    (5, 5, 5, 'SE2026-005', 2026, 'ACTIVE');
GO
SET IDENTITY_INSERT [Identity].Student OFF;
GO

-- Identity.Instructor
SET IDENTITY_INSERT [Identity].Instructor ON;
GO
INSERT INTO [Identity].Instructor (InstructorId, PersonId, DeptId, Title, IsActive)
VALUES
    (1, 1, 1, 'Lecturer', 1),
    (2, 2, 2, 'Professor', 1),
    (3, 3, 3, 'Assistant Professor', 1),
    (4, 4, 4, 'Senior Lecturer', 1),
    (5, 5, 5, 'Professor', 1);
GO
SET IDENTITY_INSERT [Identity].Instructor OFF;
GO

-- Identity.Admin
SET IDENTITY_INSERT [Identity].Admin ON;
GO
INSERT INTO [Identity].Admin (AdminId, PersonId, RoleLevel, IsActive)
VALUES
    (1, 1, 'SUPER', 1),
    (2, 2, 'DEPARTMENT', 1);
GO
SET IDENTITY_INSERT [Identity].Admin OFF;
GO

-- Academic.Course
SET IDENTITY_INSERT [Academic].Course ON;
GO
INSERT INTO [Academic].Course (CourseId, DeptId, Code, Name, CreditHours, IsActive)
VALUES
    (1, 1, 'CS101', 'Intro to Programming', 3, 1),
    (2, 2, 'MATH201', 'Linear Algebra', 4, 1),
    (3, 3, 'FIN210', 'Corporate Finance', 3, 1),
    (4, 4, 'HIST110', 'World History', 3, 1),
    (5, 5, 'SE501', 'Software Architecture', 3, 1);
GO
SET IDENTITY_INSERT [Academic].Course OFF;
GO

-- Academic.Semester
SET IDENTITY_INSERT [Academic].Semester ON;
GO
INSERT INTO [Academic].Semester (SemesterId, UniversityId, Name, StartDate, EndDate, IsActive)
VALUES
    (1, 1, 'Spring 2026', '2026-01-15', '2026-05-10', 1),
    (2, 2, 'Fall 2026', '2026-08-20', '2026-12-10', 1),
    (3, 3, 'Summer 2026', '2026-06-01', '2026-08-01', 1),
    (4, 4, 'Winter 2026', '2026-01-05', '2026-03-20', 1),
    (5, 5, 'Spring 2026', '2026-01-10', '2026-05-05', 1);
GO
SET IDENTITY_INSERT [Academic].Semester OFF;
GO

-- Academic.Room
SET IDENTITY_INSERT [Academic].Room ON;
GO
INSERT INTO [Academic].Room (RoomId, UniversityId, Name, Capacity, IsVirtual, Location)
VALUES
    (1, 1, 'Room A1', 40, 0, 'Building A'),
    (2, 2, 'Room B2', 30, 0, 'Building B'),
    (3, 3, 'Room C3', 25, 0, 'Building C'),
    (4, 4, 'Room D4', 20, 0, 'Building D'),
    (5, 5, 'Room E5', 50, 0, 'Building E');
GO
SET IDENTITY_INSERT [Academic].Room OFF;
GO

-- Academic.CourseOffering
SET IDENTITY_INSERT [Academic].CourseOffering ON;
GO
INSERT INTO [Academic].CourseOffering (OfferingId, CourseId, SemesterId, InstructorId, Capacity, Status)
VALUES
    (1, 1, 1, 1, 50, 'OPEN'),
    (2, 2, 2, 2, 40, 'OPEN'),
    (3, 3, 3, 3, 35, 'OPEN'),
    (4, 4, 4, 4, 25, 'OPEN'),
    (5, 5, 5, 5, 30, 'OPEN');
GO
SET IDENTITY_INSERT [Academic].CourseOffering OFF;
GO

-- Academic.Enrollment
SET IDENTITY_INSERT [Academic].Enrollment ON;
GO
INSERT INTO [Academic].Enrollment (EnrollmentId, StudentId, OfferingId, EnrolledAt, Status)
VALUES
    (1, 1, 1, '2026-01-20T10:00:00', 'ENROLLED'),
    (2, 2, 2, '2026-08-22T10:00:00', 'ENROLLED'),
    (3, 3, 3, '2026-06-05T10:00:00', 'ENROLLED'),
    (4, 4, 4, '2026-01-10T10:00:00', 'ENROLLED'),
    (5, 5, 5, '2026-01-12T10:00:00', 'ENROLLED');
GO
SET IDENTITY_INSERT [Academic].Enrollment OFF;
GO

-- Academic.CourseEnrollmentGrade
INSERT INTO [Academic].CourseEnrollmentGrade (EnrollmentId, LetterGrade, GradePoints, UpdatedAt)
VALUES
    (1, 'A', 4.00, '2026-05-01T12:00:00'),
    (2, 'B', 3.00, '2026-12-01T12:00:00');
GO

-- Academic.CoursePrerequisite
INSERT INTO [Academic].CoursePrerequisite (CourseId, PrereqCourseId, MinGrade)
VALUES
    (3, 1, 'C'),
    (5, 2, 'C');
GO

-- Academic.CourseWaitlist
SET IDENTITY_INSERT [Academic].CourseWaitlist ON;
GO
INSERT INTO [Academic].CourseWaitlist (WaitlistId, OfferingId, StudentId, Position, RequestedAt)
VALUES
    (1, 3, 2, 1, '2026-06-01T09:30:00'),
    (2, 4, 3, 1, '2026-01-08T09:30:00');
GO
SET IDENTITY_INSERT [Academic].CourseWaitlist OFF;
GO

-- Exam.GradeScale
SET IDENTITY_INSERT [Exam].GradeScale ON;
GO
INSERT INTO [Exam].GradeScale (ScaleId, UniversityId, Name)
VALUES
    (1, 1, 'Standard 4.0'),
    (2, 2, 'Standard 4.0'),
    (3, 3, 'Standard 4.0'),
    (4, 4, 'Standard 4.0'),
    (5, 5, 'Standard 4.0');
GO
SET IDENTITY_INSERT [Exam].GradeScale OFF;
GO

-- Exam.GradeBand
SET IDENTITY_INSERT [Exam].GradeBand ON;
GO
INSERT INTO [Exam].GradeBand (BandId, ScaleId, LetterGrade, MinPercentage, MaxPercentage, GpaPoints)
VALUES
    (1, 1, 'A', 90.00, 100.00, 4.00),
    (2, 2, 'B', 80.00, 89.99, 3.00),
    (3, 3, 'C', 70.00, 79.99, 2.00),
    (4, 4, 'D', 60.00, 69.99, 1.00),
    (5, 5, 'F', 0.00, 59.99, 0.00);
GO
SET IDENTITY_INSERT [Exam].GradeBand OFF;
GO

-- QuestionBank.QuestionBank
SET IDENTITY_INSERT [QuestionBank].QuestionBank ON;
GO
INSERT INTO [QuestionBank].QuestionBank (BankId, DeptId, CreatedBy, Name, CreatedAt)
VALUES
    (1, 1, 1, 'CS Basics', '2026-01-10T08:00:00'),
    (2, 2, 2, 'Math Core', '2026-01-11T08:00:00'),
    (3, 3, 3, 'Finance Fundamentals', '2026-01-12T08:00:00'),
    (4, 4, 4, 'History Essentials', '2026-01-13T08:00:00'),
    (5, 5, 5, 'Software Design', '2026-01-14T08:00:00');
GO
SET IDENTITY_INSERT [QuestionBank].QuestionBank OFF;
GO

-- QuestionBank.Topic
SET IDENTITY_INSERT [QuestionBank].Topic ON;
GO
INSERT INTO [QuestionBank].Topic (TopicId, BankId, Name)
VALUES
    (1, 1, 'Variables'),
    (2, 2, 'Matrices'),
    (3, 3, 'Investing'),
    (4, 4, 'Ancient Civilizations'),
    (5, 5, 'Architecture');
GO
SET IDENTITY_INSERT [QuestionBank].Topic OFF;
GO

-- QuestionBank.Question
SET IDENTITY_INSERT [QuestionBank].Question ON;
GO
INSERT INTO [QuestionBank].Question (QuestionId, TopicId, CreatedBy, Type, QuestionText, DefaultMarks, NegativeMarks, Difficulty, IsActive)
VALUES
    (1, 1, 1, 'MCQ', 'What is a variable?', 5.00, -1.00, 'EASY', 1),
    (2, 2, 2, 'MCQ', 'Matrix multiplication rule?', 5.00, -1.00, 'MEDIUM', 1),
    (3, 3, 3, 'MCQ', 'What is a bond?', 5.00, -1.00, 'EASY', 1),
    (4, 4, 4, 'MCQ', 'Capital of the Roman Empire?', 5.00, -1.00, 'MEDIUM', 1),
    (5, 5, 5, 'MCQ', 'What is a design pattern?', 5.00, -1.00, 'MEDIUM', 1);
GO
SET IDENTITY_INSERT [QuestionBank].Question OFF;
GO

-- QuestionBank.QuestionOption
SET IDENTITY_INSERT [QuestionBank].QuestionOption ON;
GO
INSERT INTO [QuestionBank].QuestionOption (OptionId, QuestionId, OptionText, IsCorrect, OrderNum)
VALUES
    (1, 1, 'A named storage location', 1, 1),
    (2, 2, 'Row by column', 1, 1),
    (3, 3, 'A fixed-income security', 1, 1),
    (4, 4, 'Rome', 1, 1),
    (5, 5, 'A reusable solution template', 1, 1);
GO
SET IDENTITY_INSERT [QuestionBank].QuestionOption OFF;
GO

-- QuestionBank.QuestionAttachment
SET IDENTITY_INSERT [QuestionBank].QuestionAttachment ON;
GO
INSERT INTO [QuestionBank].QuestionAttachment (AttachmentId, QuestionId, FilePath, FileType)
VALUES
    (1, 1, '/attachments/q1.png', 'image/png'),
    (2, 2, '/attachments/q2.png', 'image/png');
GO
SET IDENTITY_INSERT [QuestionBank].QuestionAttachment OFF;
GO

-- Exam.Exam
SET IDENTITY_INSERT [Exam].Exam ON;
GO
INSERT INTO [Exam].Exam (ExamId, OfferingId, CreatedBy, GradeScaleId, Title, ExamType, DurationMinutes, Instructions, IsRandomized, BrowserLockdown, OpenBook, NegativeMarking, Status)
VALUES
    (1, 1, 1, 1, 'Midterm 1', 'ONLINE', 90, 'Answer all questions', 0, 1, 0, 1, 'SCHEDULED'),
    (2, 2, 2, 2, 'Midterm 2', 'IN_PERSON', 60, 'No calculators', 0, 0, 0, 0, 'SCHEDULED'),
    (3, 3, 3, 3, 'Quiz 1', 'ONLINE', 30, 'Short quiz', 1, 0, 1, 0, 'SCHEDULED'),
    (4, 4, 4, 4, 'Final Exam', 'IN_PERSON', 120, 'Comprehensive', 0, 0, 0, 0, 'SCHEDULED'),
    (5, 5, 5, 5, 'Project Demo', 'ONLINE', 45, 'Present project', 0, 0, 1, 0, 'SCHEDULED');
GO
SET IDENTITY_INSERT [Exam].Exam OFF;
GO

-- Exam.ExamSection
SET IDENTITY_INSERT [Exam].ExamSection ON;
GO
INSERT INTO [Exam].ExamSection (SectionId, ExamId, Title, OrderNum, TimeLimitMinutes)
VALUES
    (1, 1, 'Section A', 1, 45),
    (2, 2, 'Section A', 1, 60),
    (3, 3, 'Section A', 1, 30),
    (4, 4, 'Section A', 1, 90),
    (5, 5, 'Section A', 1, 45);
GO
SET IDENTITY_INSERT [Exam].ExamSection OFF;
GO

-- Exam.ExamQuestion
SET IDENTITY_INSERT [Exam].ExamQuestion ON;
GO
INSERT INTO [Exam].ExamQuestion (EqId, SectionId, QuestionId, OrderNum, MarksOverride)
VALUES
    (1, 1, 1, 1, 5.00),
    (2, 2, 2, 1, 5.00),
    (3, 3, 3, 1, 5.00),
    (4, 4, 4, 1, 5.00),
    (5, 5, 5, 1, 5.00);
GO
SET IDENTITY_INSERT [Exam].ExamQuestion OFF;
GO

-- Exam.ExamSchedule
SET IDENTITY_INSERT [Exam].ExamSchedule ON;
GO
INSERT INTO [Exam].ExamSchedule (ScheduleId, ExamId, StartDatetime, EndDatetime, Timezone, IsActive)
VALUES
    (1, 1, '2026-03-01T09:00:00', '2026-03-01T10:30:00', 'America/New_York', 1),
    (2, 2, '2026-10-15T13:00:00', '2026-10-15T14:00:00', 'America/Toronto', 1),
    (3, 3, '2026-07-10T09:00:00', '2026-07-10T09:30:00', 'Europe/London', 1),
    (4, 4, '2026-03-15T10:00:00', '2026-03-15T12:00:00', 'Australia/Sydney', 1),
    (5, 5, '2026-04-20T11:00:00', '2026-04-20T11:45:00', 'Asia/Kolkata', 1);
GO
SET IDENTITY_INSERT [Exam].ExamSchedule OFF;
GO

-- Exam.ExamRoom
SET IDENTITY_INSERT [Exam].ExamRoom ON;
GO
INSERT INTO [Exam].ExamRoom (ExamRoomId, ScheduleId, RoomId, CapacityOverride)
VALUES
    (1, 1, 1, 35),
    (2, 2, 2, 25),
    (3, 3, 3, 20),
    (4, 4, 4, 15),
    (5, 5, 5, 45);
GO
SET IDENTITY_INSERT [Exam].ExamRoom OFF;
GO

-- Exam.ExamRegistration
SET IDENTITY_INSERT [Exam].ExamRegistration ON;
GO
INSERT INTO [Exam].ExamRegistration (RegId, StudentId, ExamId, RegisteredAt, Status, IsApproved)
VALUES
    (1, 1, 1, '2026-02-20T08:00:00', 'REGISTERED', 1),
    (2, 2, 2, '2026-09-20T08:05:00', 'REGISTERED', 1),
    (3, 3, 3, '2026-07-01T08:00:00', 'REGISTERED', 1),
    (4, 4, 4, '2026-03-01T08:00:00', 'REGISTERED', 1),
    (5, 5, 5, '2026-04-01T08:00:00', 'REGISTERED', 1);
GO
SET IDENTITY_INSERT [Exam].ExamRegistration OFF;
GO

-- Exam.Attempt
SET IDENTITY_INSERT [Exam].Attempt ON;
GO
INSERT INTO [Exam].Attempt (AttemptId, RegId, ExamRoomId, StartTime, EndTime, Status, IpAddress, BrowserInfo, OsInfo, IsSubmitted)
VALUES
    (1, 1, 1, '2026-03-01T09:00:00', '2026-03-01T10:10:00', 'COMPLETED', '10.0.0.1', 'Chrome', 'Windows', 1),
    (2, 2, 2, '2026-10-15T13:00:00', '2026-10-15T13:50:00', 'COMPLETED', '10.0.0.2', 'Edge', 'Windows', 1),
    (3, 3, 3, '2026-07-10T09:00:00', '2026-07-10T09:25:00', 'COMPLETED', '10.0.0.3', 'Chrome', 'Linux', 1),
    (4, 4, 4, '2026-03-15T10:00:00', '2026-03-15T11:40:00', 'COMPLETED', '10.0.0.4', 'Safari', 'macOS', 1),
    (5, 5, 5, '2026-04-20T11:00:00', '2026-04-20T11:40:00', 'COMPLETED', '10.0.0.5', 'Chrome', 'Windows', 1);
GO
SET IDENTITY_INSERT [Exam].Attempt OFF;
GO

-- Exam.AttemptAnswer
SET IDENTITY_INSERT [Exam].AttemptAnswer ON;
GO
INSERT INTO [Exam].AttemptAnswer (AnswerId, AttemptId, QuestionId, SelectedOptionId, TextAnswer, FilePath, MarksAwarded, IsCorrect, GradedBy, GradedAt)
VALUES
    (1, 1, 1, 1, NULL, NULL, 5.00, 1, 1, '2026-03-02T09:00:00'),
    (2, 2, 2, 2, NULL, NULL, 3.00, 0, 2, '2026-03-02T09:10:00');
GO
SET IDENTITY_INSERT [Exam].AttemptAnswer OFF;
GO

-- Exam.Result
SET IDENTITY_INSERT [Exam].Result ON;
GO
INSERT INTO [Exam].Result (ResultId, AttemptId, GradeBandId, FinalScore, Percentage, IsPublished, PublishedAt)
VALUES
    (1, 1, 1, 92.00, 92.00, 1, '2026-03-05T08:00:00'),
    (2, 2, 2, 85.00, 85.00, 1, '2026-10-20T08:00:00'),
    (3, 3, 3, 75.00, 75.00, 1, '2026-07-15T08:00:00'),
    (4, 4, 4, 65.00, 65.00, 1, '2026-03-20T08:00:00'),
    (5, 5, 5, 55.00, 55.00, 1, '2026-04-25T08:00:00');
GO
SET IDENTITY_INSERT [Exam].Result OFF;
GO

-- Exam.ScoreOverride
SET IDENTITY_INSERT [Exam].ScoreOverride ON;
GO
INSERT INTO [Exam].ScoreOverride (OverrideId, AttemptId, OverriddenBy, NewScore, Reason, OverriddenAt)
VALUES
    (1, 1, 1, 94.00, 'Regrade adjustment', '2026-03-06T10:00:00'),
    (2, 2, 2, 84.00, 'Manual review', '2026-10-21T10:05:00');
GO
SET IDENTITY_INSERT [Exam].ScoreOverride OFF;
GO

-- Exam.InvigilationAssignment
SET IDENTITY_INSERT [Exam].InvigilationAssignment ON;
GO
INSERT INTO [Exam].InvigilationAssignment (AssignmentId, ExamRoomId, InstructorId, AssignedAt)
VALUES
    (1, 1, 1, '2026-02-25T10:00:00'),
    (2, 2, 2, '2026-10-10T10:00:00');
GO
SET IDENTITY_INSERT [Exam].InvigilationAssignment OFF;
GO

-- Proctoring.Action
SET IDENTITY_INSERT [Proctoring].Action ON;
GO
INSERT INTO [Proctoring].Action (ActionId, AttemptId, ActionType, ActionTimestamp, SequenceNum)
VALUES
    (1, 1, 'TAB_SWITCH', '2026-03-01T09:15:00', 1),
    (2, 2, 'COPY', '2026-10-15T13:20:00', 1);
GO
SET IDENTITY_INSERT [Proctoring].Action OFF;
GO

-- Proctoring.ClipboardAction
INSERT INTO [Proctoring].ClipboardAction (ActionId, EventType, ContentHash, ContentLength)
VALUES
    (1, 'COPY', 'hash-copy-1', 12),
    (2, 'PASTE', 'hash-paste-1', 8);
GO

-- Proctoring.FocusChangeAction
INSERT INTO [Proctoring].FocusChangeAction (ActionId, FromWindow, ToWindow, ProcessName)
VALUES
    (1, 'Exam', 'Browser', 'chrome.exe'),
    (2, 'Exam', 'Notes', 'notepad.exe');
GO

-- Proctoring.KeystrokeAction
INSERT INTO [Proctoring].KeystrokeAction (ActionId, KeyPressed, ModifierKeys)
VALUES
    (1, 'C', 'CTRL'),
    (2, 'TAB', 'ALT');
GO

-- Proctoring.LocalActionQueue
SET IDENTITY_INSERT [Proctoring].LocalActionQueue ON;
GO
INSERT INTO [Proctoring].LocalActionQueue (QueueId, AttemptId, ActionDataJson, QueuedAt, SyncedAt, IsSynced, RetryCount)
VALUES
    (1, 1, '{"type":"focus"}', '2026-03-01T09:16:00', NULL, 0, 0),
    (2, 2, '{"type":"clipboard"}', '2026-10-15T13:21:00', NULL, 0, 0);
GO
SET IDENTITY_INSERT [Proctoring].LocalActionQueue OFF;
GO

-- Proctoring.SimilarityComparison
SET IDENTITY_INSERT [Proctoring].SimilarityComparison ON;
GO
INSERT INTO [Proctoring].SimilarityComparison (ComparisonId, Attempt1Id, Attempt2Id, SimilarityScore, Method, ComputedAt, IsFlagged)
VALUES
    (1, 1, 2, 72.50, 'TEXT', '2026-03-02T12:00:00', 0),
    (2, 1, 3, 85.00, 'CODE', '2026-07-11T12:00:00', 1);
GO
SET IDENTITY_INSERT [Proctoring].SimilarityComparison OFF;
GO

-- Proctoring.SuspiciousFlag
SET IDENTITY_INSERT [Proctoring].SuspiciousFlag ON;
GO
INSERT INTO [Proctoring].SuspiciousFlag (FlagId, AttemptId, Reason, FlaggedBy, FlaggedAt, Status)
VALUES
    (1, 1, 'Multiple tab switches', 'ProctoringService', '2026-03-01T10:30:00', 'OPEN'),
    (2, 2, 'Clipboard activity', 'ProctoringService', '2026-10-15T14:00:00', 'RESOLVED');
GO
SET IDENTITY_INSERT [Proctoring].SuspiciousFlag OFF;
GO

-- Disciplinary.Review
SET IDENTITY_INSERT [Disciplinary].Review ON;
GO
INSERT INTO [Disciplinary].Review (ReviewId, AttemptId, InstructorId, ReviewDate, Notes, Outcome)
VALUES
    (1, 1, 1, '2026-03-03T10:00:00', 'Reviewed attempt details', 'WARNING'),
    (2, 2, 2, '2026-10-16T10:15:00', 'No issues found', 'NO_ACTION');
GO
SET IDENTITY_INSERT [Disciplinary].Review OFF;
GO

-- Disciplinary.Sanction
SET IDENTITY_INSERT [Disciplinary].Sanction ON;
GO
INSERT INTO [Disciplinary].Sanction (SanctionId, ReviewId, IssuedBy, SanctionType, Notes, IssuedAt, IsActive)
VALUES
    (1, 1, 1, 'WARNING', 'First offense', '2026-03-04T09:00:00', 1),
    (2, 2, 2, 'NONE', 'No sanction', '2026-10-17T09:10:00', 0);
GO
SET IDENTITY_INSERT [Disciplinary].Sanction OFF;
GO

-- Disciplinary.Appeal
SET IDENTITY_INSERT [Disciplinary].Appeal ON;
GO
INSERT INTO [Disciplinary].Appeal (AppealId, SanctionId, StudentId, Reason, SubmittedAt, Status)
VALUES
    (1, 1, 1, 'Disagree with warning', '2026-03-05T09:00:00', 'PENDING'),
    (2, 2, 2, 'Request clarification', '2026-10-18T09:10:00', 'APPROVED');
GO
SET IDENTITY_INSERT [Disciplinary].Appeal OFF;
GO

-- Disciplinary.AppealReview
SET IDENTITY_INSERT [Disciplinary].AppealReview ON;
GO
INSERT INTO [Disciplinary].AppealReview (AppealReviewId, AppealId, ReviewedBy, ReviewDate, Decision, Notes)
VALUES
    (1, 1, 2, '2026-03-06T09:00:00', 'UPHOLD', 'Evidence supports decision'),
    (2, 2, 1, '2026-10-19T09:10:00', 'OVERTURN', 'Sanction removed');
GO
SET IDENTITY_INSERT [Disciplinary].AppealReview OFF;
GO

-- Notification.Notification
SET IDENTITY_INSERT [Notification].Notification ON;
GO
INSERT INTO [Notification].Notification (NotificationId, PersonId, NotificationType, Channel, Subject, Body, SentAt, IsRead)
VALUES
    (1, 1, 'EMAIL', 'EMAIL', 'Exam scheduled', 'Your exam is scheduled.', '2026-02-20T07:00:00', 0),
    (2, 2, 'SMS', 'SMS', 'Enrollment confirmed', 'You are enrolled.', '2026-02-01T07:00:00', 1);
GO
SET IDENTITY_INSERT [Notification].Notification OFF;
GO

-- Audit.AuditLog
SET IDENTITY_INSERT [Audit].AuditLog ON;
GO
INSERT INTO [Audit].AuditLog (LogId, TableName, RecordId, ActionType, OldValue, NewValue, PerformedBy, PerformedAt, IpAddress)
VALUES
    (1, 'Academic.Course', 1, 'INSERT', NULL, 'CS101', 1, '2026-01-10T10:00:00', '127.0.0.1'),
    (2, 'Exam.Exam', 2, 'UPDATE', 'DRAFT', 'SCHEDULED', 2, '2026-02-15T10:00:00', '127.0.0.1');
GO
SET IDENTITY_INSERT [Audit].AuditLog OFF;
GO