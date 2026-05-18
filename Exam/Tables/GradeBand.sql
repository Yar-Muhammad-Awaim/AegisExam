CREATE TABLE [Exam].GradeBand
(
    BandId INT IDENTITY(1, 1) NOT NULL,
    ScaleId INT NOT NULL,
    LetterGrade VARCHAR(5) NOT NULL,
    MinPercentage DECIMAL(5,2) NOT NULL,
    MaxPercentage DECIMAL(5,2) NOT NULL,
    GpaPoints DECIMAL(3,2) NOT NULL,
    CONSTRAINT PK_GradeBand PRIMARY KEY (BandId),
    CONSTRAINT FK_GradeBand_GradeScale FOREIGN KEY (ScaleId) REFERENCES [Exam].GradeScale(ScaleId),
    CONSTRAINT CHK_GradeBand_MinPercentage CHECK (MinPercentage BETWEEN 0 AND 100),
    CONSTRAINT CHK_GradeBand_MaxPercentage CHECK (MaxPercentage BETWEEN 0 AND 100 AND MaxPercentage >= MinPercentage)
);
GO