CREATE TABLE [QuestionBank].Topic
(
    TopicId INT IDENTITY(1, 1) NOT NULL,
    BankId INT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    CONSTRAINT PK_Topic PRIMARY KEY (TopicId),
    CONSTRAINT FK_Topic_QuestionBank FOREIGN KEY (BankId) REFERENCES [QuestionBank].QuestionBank(BankId),
    CONSTRAINT UQ_Topic_Bank_Name UNIQUE (BankId, Name)
);
GO