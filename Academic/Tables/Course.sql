CREATE TABLE [Academic].Course
(
    CourseId INT IDENTITY(1, 1) NOT NULL,
    DeptId INT NOT NULL,
    Code VARCHAR(20) NOT NULL,
    Name VARCHAR(200) NOT NULL,
    CreditHours INT NOT NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_Course_IsActive DEFAULT 1,
    CONSTRAINT PK_Course PRIMARY KEY (CourseId),
    CONSTRAINT FK_Course_Department FOREIGN KEY (DeptId) REFERENCES [Academic].Department(DeptId),
    CONSTRAINT UQ_Course_Dept_Code UNIQUE (DeptId, Code)
);
GO