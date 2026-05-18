CREATE TABLE [Exam].GradeScale
(
    ScaleId INT IDENTITY(1, 1) NOT NULL,
    UniversityId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    CONSTRAINT PK_GradeScale PRIMARY KEY (ScaleId),
    CONSTRAINT FK_GradeScale_University FOREIGN KEY (UniversityId) REFERENCES [Academic].University(UniversityId)
);
GO