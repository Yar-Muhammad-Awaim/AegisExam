CREATE TABLE [QuestionBank].Question
(
    QuestionId INT IDENTITY(1, 1) NOT NULL,
    TopicId INT NOT NULL,
    CreatedBy INT NOT NULL,
    Type VARCHAR(50) NOT NULL,
    QuestionText NVARCHAR(MAX) NOT NULL,
    DefaultMarks DECIMAL(5,2) NOT NULL,
    NegativeMarks DECIMAL(5,2) NOT NULL CONSTRAINT DF_Question_NegativeMarks DEFAULT 0,
    Difficulty VARCHAR(20),
    IsActive BIT NOT NULL CONSTRAINT DF_Question_IsActive DEFAULT 1,
    CONSTRAINT PK_Question PRIMARY KEY (QuestionId),
    CONSTRAINT FK_Question_Topic FOREIGN KEY (TopicId) REFERENCES [QuestionBank].Topic(TopicId),
    CONSTRAINT FK_Question_Instructor FOREIGN KEY (CreatedBy) REFERENCES [Identity].Instructor(InstructorId),
    CONSTRAINT CHK_Question_DefaultMarks CHECK (DefaultMarks >= 0),
    CONSTRAINT CHK_Question_NegativeMarks CHECK (NegativeMarks <= 0)
);
GO