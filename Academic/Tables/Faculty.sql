CREATE TABLE [Academic].Faculty
(
    FacultyId INT IDENTITY(1, 1) NOT NULL,
    UniversityId INT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    Code VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Faculty PRIMARY KEY (FacultyId),
    CONSTRAINT FK_Faculty_University FOREIGN KEY (UniversityId) REFERENCES [Academic].University(UniversityId),
    CONSTRAINT UQ_Faculty_University_Code UNIQUE (UniversityId, Code)
);
GO