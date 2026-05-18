CREATE TABLE [Exam].ExamRegistration
(
    RegId INT IDENTITY(1, 1) NOT NULL,
    StudentId INT NOT NULL,
    ExamId INT NOT NULL,
    RegisteredAt DATETIME NOT NULL CONSTRAINT DF_ExamRegistration_RegisteredAt DEFAULT GETDATE(),
    Status VARCHAR(20) NOT NULL,
    IsApproved BIT NOT NULL CONSTRAINT DF_ExamRegistration_IsApproved DEFAULT 0,
    CONSTRAINT PK_ExamRegistration PRIMARY KEY (RegId),
    CONSTRAINT FK_ExamRegistration_Student FOREIGN KEY (StudentId) REFERENCES [Identity].Student(StudentId),
    CONSTRAINT FK_ExamRegistration_Exam FOREIGN KEY (ExamId) REFERENCES [Exam].Exam(ExamId),
    CONSTRAINT UQ_ExamRegistration_Student_Exam UNIQUE (StudentId, ExamId)
);
GO