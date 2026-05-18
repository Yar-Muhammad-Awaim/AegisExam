CREATE TABLE [QuestionBank].QuestionBank
(
    BankId INT IDENTITY(1, 1) NOT NULL,
    DeptId INT NOT NULL,
    CreatedBy INT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    CreatedAt DATETIME NOT NULL CONSTRAINT DF_QuestionBank_CreatedAt DEFAULT GETDATE(),
    CONSTRAINT PK_QuestionBank PRIMARY KEY (BankId),
    CONSTRAINT FK_QuestionBank_Department FOREIGN KEY (DeptId) REFERENCES [Academic].Department(DeptId),
    CONSTRAINT FK_QuestionBank_Instructor FOREIGN KEY (CreatedBy) REFERENCES [Identity].Instructor(InstructorId)
);
GO