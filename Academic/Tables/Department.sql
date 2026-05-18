CREATE TABLE [Academic].Department
(
    DeptId INT IDENTITY(1, 1) NOT NULL,
    FacultyId INT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    Code VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Department PRIMARY KEY (DeptId),
    CONSTRAINT FK_Department_Faculty FOREIGN KEY (FacultyId) REFERENCES [Academic].Faculty(FacultyId),
    CONSTRAINT UQ_Department_Faculty_Code UNIQUE (FacultyId, Code)
);
GO