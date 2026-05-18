CREATE TABLE [Exam].ScoreOverride
(
    OverrideId INT IDENTITY(1, 1) NOT NULL,
    AttemptId INT NOT NULL,
    OverriddenBy INT NOT NULL,
    NewScore DECIMAL(5,2) NOT NULL,
    Reason NVARCHAR(MAX) NOT NULL,
    OverriddenAt DATETIME NOT NULL CONSTRAINT DF_ScoreOverride_OverriddenAt DEFAULT GETDATE(),
    CONSTRAINT PK_ScoreOverride PRIMARY KEY (OverrideId),
    CONSTRAINT FK_ScoreOverride_Attempt FOREIGN KEY (AttemptId) REFERENCES [Exam].Attempt(AttemptId),
    CONSTRAINT FK_ScoreOverride_Admin FOREIGN KEY (OverriddenBy) REFERENCES [Identity].Admin(AdminId)
);
GO