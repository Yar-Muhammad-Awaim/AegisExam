CREATE TABLE [Proctoring].SimilarityComparison
(
    ComparisonId INT IDENTITY(1, 1) NOT NULL,
    Attempt1Id INT NOT NULL,
    Attempt2Id INT NOT NULL,
    SimilarityScore DECIMAL(5,2) NOT NULL,
    Method VARCHAR(50) NOT NULL,
    ComputedAt DATETIME NOT NULL CONSTRAINT DF_SimilarityComparison_ComputedAt DEFAULT GETDATE(),
    IsFlagged BIT NOT NULL CONSTRAINT DF_SimilarityComparison_IsFlagged DEFAULT 0,
    CONSTRAINT PK_SimilarityComparison PRIMARY KEY (ComparisonId),
    CONSTRAINT FK_SimilarityComparison_Attempt1 FOREIGN KEY (Attempt1Id) REFERENCES [Exam].Attempt(AttemptId),
    CONSTRAINT FK_SimilarityComparison_Attempt2 FOREIGN KEY (Attempt2Id) REFERENCES [Exam].Attempt(AttemptId),
    CONSTRAINT UQ_SimilarityComparison_Attempts UNIQUE (Attempt1Id, Attempt2Id),
    CONSTRAINT CHK_SimilarityComparison_Order CHECK (Attempt1Id < Attempt2Id)
);
GO