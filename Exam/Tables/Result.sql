CREATE TABLE [Exam].Result
(
    ResultId INT IDENTITY(1, 1) NOT NULL,
    AttemptId INT NOT NULL,
    GradeBandId INT,
    FinalScore DECIMAL(5,2) NOT NULL,
    Percentage DECIMAL(5,2) NOT NULL,
    IsPublished BIT NOT NULL CONSTRAINT DF_Result_IsPublished DEFAULT 0,
    PublishedAt DATETIME,
    CONSTRAINT PK_Result PRIMARY KEY (ResultId),
    CONSTRAINT FK_Result_Attempt FOREIGN KEY (AttemptId) REFERENCES [Exam].Attempt(AttemptId),
    CONSTRAINT FK_Result_GradeBand FOREIGN KEY (GradeBandId) REFERENCES [Exam].GradeBand(BandId),
    CONSTRAINT UQ_Result_Attempt UNIQUE (AttemptId)
);
GO