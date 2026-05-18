CREATE TABLE [QuestionBank].QuestionOption
(
    OptionId INT IDENTITY(1, 1) NOT NULL,
    QuestionId INT NOT NULL,
    OptionText NVARCHAR(MAX) NOT NULL,
    IsCorrect BIT NOT NULL CONSTRAINT DF_QuestionOption_IsCorrect DEFAULT 0,
    OrderNum INT NOT NULL,
    CONSTRAINT PK_QuestionOption PRIMARY KEY (OptionId),
    CONSTRAINT FK_QuestionOption_Question FOREIGN KEY (QuestionId) REFERENCES [QuestionBank].Question(QuestionId),
    CONSTRAINT UQ_QuestionOption_Question_Order UNIQUE (QuestionId, OrderNum)
);
GO