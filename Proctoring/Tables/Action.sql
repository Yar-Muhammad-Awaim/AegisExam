CREATE TABLE [Proctoring].Action
(
    ActionId INT IDENTITY(1, 1) NOT NULL,
    AttemptId INT NOT NULL,
    ActionType VARCHAR(50) NOT NULL,
    ActionTimestamp DATETIME NOT NULL CONSTRAINT DF_ProctoringAction_Timestamp DEFAULT GETDATE(),
    SequenceNum INT NOT NULL,
    CONSTRAINT PK_ProctoringAction PRIMARY KEY (ActionId),
    CONSTRAINT FK_ProctoringAction_Attempt FOREIGN KEY (AttemptId) REFERENCES [Exam].Attempt(AttemptId),
    CONSTRAINT UQ_ProctoringAction_Attempt_Sequence UNIQUE (AttemptId, SequenceNum)
);
GO