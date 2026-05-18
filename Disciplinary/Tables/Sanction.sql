CREATE TABLE [Disciplinary].Sanction
(
    SanctionId INT IDENTITY(1, 1) NOT NULL,
    ReviewId INT NOT NULL,
    IssuedBy INT NOT NULL,
    SanctionType VARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX),
    IssuedAt DATETIME NOT NULL CONSTRAINT DF_Sanction_IssuedAt DEFAULT GETDATE(),
    IsActive BIT NOT NULL CONSTRAINT DF_Sanction_IsActive DEFAULT 1,
    CONSTRAINT PK_Sanction PRIMARY KEY (SanctionId),
    CONSTRAINT FK_Sanction_Review FOREIGN KEY (ReviewId) REFERENCES [Disciplinary].Review(ReviewId),
    CONSTRAINT FK_Sanction_Instructor FOREIGN KEY (IssuedBy) REFERENCES [Identity].Instructor(InstructorId)
);
GO