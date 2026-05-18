CREATE TABLE [Academic].Semester
(
    SemesterId INT IDENTITY(1, 1) NOT NULL,
    UniversityId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_Semester_IsActive DEFAULT 1,
    CONSTRAINT PK_Semester PRIMARY KEY (SemesterId),
    CONSTRAINT FK_Semester_University FOREIGN KEY (UniversityId) REFERENCES [Academic].University(UniversityId),
    CONSTRAINT UQ_Semester_University_Name UNIQUE (UniversityId, Name),
    CONSTRAINT CHK_Semester_Dates CHECK (EndDate > StartDate)
);
GO