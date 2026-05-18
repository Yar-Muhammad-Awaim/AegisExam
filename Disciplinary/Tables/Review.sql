CREATE TABLE [Disciplinary].Review
(
    ReviewId INT IDENTITY(1, 1) NOT NULL,
    AttemptId INT NOT NULL,
    InstructorId INT NOT NULL,
    ReviewDate DATETIME NOT NULL CONSTRAINT DF_DisciplinaryReview_ReviewDate DEFAULT GETDATE(),
    Notes NVARCHAR(MAX),
    Outcome VARCHAR(50) NOT NULL,
    CONSTRAINT PK_DisciplinaryReview PRIMARY KEY (ReviewId),
    CONSTRAINT FK_DisciplinaryReview_Attempt FOREIGN KEY (AttemptId) REFERENCES [Exam].Attempt(AttemptId),
    CONSTRAINT FK_DisciplinaryReview_Instructor FOREIGN KEY (InstructorId) REFERENCES [Identity].Instructor(InstructorId)
);
GO