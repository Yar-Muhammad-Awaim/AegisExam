CREATE TABLE [Exam].Attempt
(
    AttemptId INT IDENTITY(1, 1) NOT NULL,
    RegId INT NOT NULL,
    ExamRoomId INT,
    StartTime DATETIME,
    EndTime DATETIME,
    Status VARCHAR(20) NOT NULL,
    IpAddress VARCHAR(50),
    BrowserInfo VARCHAR(255),
    OsInfo VARCHAR(255),
    IsSubmitted BIT NOT NULL CONSTRAINT DF_Attempt_IsSubmitted DEFAULT 0,
    CONSTRAINT PK_Attempt PRIMARY KEY (AttemptId),
    CONSTRAINT FK_Attempt_ExamRegistration FOREIGN KEY (RegId) REFERENCES [Exam].ExamRegistration(RegId),
    CONSTRAINT FK_Attempt_ExamRoom FOREIGN KEY (ExamRoomId) REFERENCES [Exam].ExamRoom(ExamRoomId)
);
GO