CREATE TABLE [Proctoring].SuspiciousFlag
(
    FlagId INT IDENTITY(1, 1) NOT NULL,
    AttemptId INT NOT NULL,
    Reason NVARCHAR(MAX) NOT NULL,
    FlaggedBy VARCHAR(100) NOT NULL,
    FlaggedAt DATETIME NOT NULL CONSTRAINT DF_SuspiciousFlag_FlaggedAt DEFAULT GETDATE(),
    Status VARCHAR(50) NOT NULL,
    CONSTRAINT PK_SuspiciousFlag PRIMARY KEY (FlagId),
    CONSTRAINT FK_SuspiciousFlag_Attempt FOREIGN KEY (AttemptId) REFERENCES [Exam].Attempt(AttemptId)
);
GO