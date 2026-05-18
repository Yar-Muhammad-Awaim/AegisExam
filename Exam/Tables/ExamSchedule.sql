CREATE TABLE [Exam].ExamSchedule
(
    ScheduleId INT IDENTITY(1, 1) NOT NULL,
    ExamId INT NOT NULL,
    StartDatetime DATETIME NOT NULL,
    EndDatetime DATETIME NOT NULL,
    Timezone VARCHAR(50) NOT NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_ExamSchedule_IsActive DEFAULT 1,
    CONSTRAINT PK_ExamSchedule PRIMARY KEY (ScheduleId),
    CONSTRAINT FK_ExamSchedule_Exam FOREIGN KEY (ExamId) REFERENCES [Exam].Exam(ExamId)
);
GO