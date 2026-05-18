CREATE TABLE [Exam].ExamQuestion
(
    EqId INT IDENTITY(1, 1) NOT NULL,
    SectionId INT NOT NULL,
    QuestionId INT NOT NULL,
    OrderNum INT NOT NULL,
    MarksOverride DECIMAL(5,2),
    CONSTRAINT PK_ExamQuestion PRIMARY KEY (EqId),
    CONSTRAINT FK_ExamQuestion_ExamSection FOREIGN KEY (SectionId) REFERENCES [Exam].ExamSection(SectionId),
    CONSTRAINT FK_ExamQuestion_Question FOREIGN KEY (QuestionId) REFERENCES [QuestionBank].Question(QuestionId),
    CONSTRAINT UQ_ExamQuestion_Section_Order UNIQUE (SectionId, OrderNum),
    CONSTRAINT UQ_ExamQuestion_Section_Question UNIQUE (SectionId, QuestionId)
);
GO