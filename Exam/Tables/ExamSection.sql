CREATE TABLE [Exam].ExamSection
(
    SectionId INT IDENTITY(1, 1) NOT NULL,
    ExamId INT NOT NULL,
    Title VARCHAR(200) NOT NULL,
    OrderNum INT NOT NULL,
    TimeLimitMinutes INT,
    CONSTRAINT PK_ExamSection PRIMARY KEY (SectionId),
    CONSTRAINT FK_ExamSection_Exam FOREIGN KEY (ExamId) REFERENCES [Exam].Exam(ExamId),
    CONSTRAINT UQ_ExamSection_Exam_Order UNIQUE (ExamId, OrderNum)
);
GO