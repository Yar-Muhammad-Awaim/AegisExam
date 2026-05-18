CREATE TABLE [Audit].AuditLog
(
    LogId INT IDENTITY(1, 1) NOT NULL,
    TableName VARCHAR(100) NOT NULL,
    RecordId INT NOT NULL,
    ActionType VARCHAR(50) NOT NULL,
    OldValue NVARCHAR(MAX),
    NewValue NVARCHAR(MAX),
    PerformedBy INT,
    PerformedAt DATETIME NOT NULL CONSTRAINT DF_AuditLog_PerformedAt DEFAULT GETDATE(),
    IpAddress VARCHAR(50),
    CONSTRAINT PK_AuditLog PRIMARY KEY (LogId),
    CONSTRAINT FK_AuditLog_Person FOREIGN KEY (PerformedBy) REFERENCES [Identity].Person(PersonId)
);
GO