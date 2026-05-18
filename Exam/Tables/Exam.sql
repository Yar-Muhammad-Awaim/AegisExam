CREATE TABLE [Exam].Exam
(
    ExamId INT IDENTITY(1, 1) NOT NULL,
    OfferingId INT NOT NULL,
    CreatedBy INT NOT NULL,
    GradeScaleId INT NOT NULL,
    Title VARCHAR(200) NOT NULL,
    ExamType VARCHAR(50) NOT NULL,
    DurationMinutes INT NOT NULL,
    Instructions NVARCHAR(MAX),
    IsRandomized BIT NOT NULL CONSTRAINT DF_Exam_IsRandomized DEFAULT 0,
    BrowserLockdown BIT NOT NULL CONSTRAINT DF_Exam_BrowserLockdown DEFAULT 0,
    OpenBook BIT NOT NULL CONSTRAINT DF_Exam_OpenBook DEFAULT 0,
    NegativeMarking BIT NOT NULL CONSTRAINT DF_Exam_NegativeMarking DEFAULT 0,
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Exam PRIMARY KEY (ExamId),
    CONSTRAINT FK_Exam_CourseOffering FOREIGN KEY (OfferingId) REFERENCES [Academic].CourseOffering(OfferingId),
    CONSTRAINT FK_Exam_Instructor FOREIGN KEY (CreatedBy) REFERENCES [Identity].Instructor(InstructorId),
    CONSTRAINT FK_Exam_GradeScale FOREIGN KEY (GradeScaleId) REFERENCES [Exam].GradeScale(ScaleId),
    CONSTRAINT CHK_Exam_DurationMinutes CHECK (DurationMinutes > 0)
);
GO