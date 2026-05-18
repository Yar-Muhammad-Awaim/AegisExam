CREATE TABLE [Disciplinary].Appeal
(
    AppealId INT IDENTITY(1, 1) NOT NULL,
    SanctionId INT NOT NULL,
    StudentId INT NOT NULL,
    Reason NVARCHAR(MAX) NOT NULL,
    SubmittedAt DATETIME NOT NULL CONSTRAINT DF_Appeal_SubmittedAt DEFAULT GETDATE(),
    Status VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Appeal PRIMARY KEY (AppealId),
    CONSTRAINT FK_Appeal_Sanction FOREIGN KEY (SanctionId) REFERENCES [Disciplinary].Sanction(SanctionId),
    CONSTRAINT FK_Appeal_Student FOREIGN KEY (StudentId) REFERENCES [Identity].Student(StudentId)
);
GO