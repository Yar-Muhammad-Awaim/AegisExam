CREATE TABLE [Exam].AttemptAnswer
(
    AnswerId INT IDENTITY(1, 1) NOT NULL,
    AttemptId INT NOT NULL,
    QuestionId INT NOT NULL,
    SelectedOptionId INT,
    TextAnswer NVARCHAR(MAX),
    FilePath VARCHAR(500),
    MarksAwarded DECIMAL(5,2),
    IsCorrect BIT,
    GradedBy INT,
    GradedAt DATETIME,
    CONSTRAINT PK_AttemptAnswer PRIMARY KEY (AnswerId),
    CONSTRAINT FK_AttemptAnswer_Attempt FOREIGN KEY (AttemptId) REFERENCES [Exam].Attempt(AttemptId),
    CONSTRAINT FK_AttemptAnswer_Question FOREIGN KEY (QuestionId) REFERENCES [QuestionBank].Question(QuestionId),
    CONSTRAINT FK_AttemptAnswer_SelectedOption FOREIGN KEY (SelectedOptionId) REFERENCES [QuestionBank].QuestionOption(OptionId),
    CONSTRAINT FK_AttemptAnswer_Instructor FOREIGN KEY (GradedBy) REFERENCES [Identity].Instructor(InstructorId)
);
GO