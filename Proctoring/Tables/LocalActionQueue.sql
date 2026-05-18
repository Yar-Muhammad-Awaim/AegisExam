CREATE TABLE [Proctoring].LocalActionQueue
(
    QueueId INT IDENTITY(1, 1) NOT NULL,
    AttemptId INT NOT NULL,
    ActionDataJson NVARCHAR(MAX) NOT NULL,
    QueuedAt DATETIME NOT NULL CONSTRAINT DF_LocalActionQueue_QueuedAt DEFAULT GETDATE(),
    SyncedAt DATETIME,
    IsSynced BIT NOT NULL CONSTRAINT DF_LocalActionQueue_IsSynced DEFAULT 0,
    RetryCount INT NOT NULL CONSTRAINT DF_LocalActionQueue_RetryCount DEFAULT 0,
    CONSTRAINT PK_LocalActionQueue PRIMARY KEY (QueueId),
    CONSTRAINT FK_LocalActionQueue_Attempt FOREIGN KEY (AttemptId) REFERENCES [Exam].Attempt(AttemptId)
);
GO