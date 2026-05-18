CREATE TABLE [Identity].Instructor
(
    InstructorId INT IDENTITY(1, 1) NOT NULL,
    PersonId INT NOT NULL,
    DeptId INT NOT NULL,
    Title VARCHAR(100),
    IsActive BIT NOT NULL CONSTRAINT DF_Instructor_IsActive DEFAULT 1,
    CONSTRAINT PK_Instructor PRIMARY KEY (InstructorId),
    CONSTRAINT FK_Instructor_Person FOREIGN KEY (PersonId) REFERENCES [Identity].Person(PersonId),
    CONSTRAINT FK_Instructor_Department FOREIGN KEY (DeptId) REFERENCES [Academic].Department(DeptId)
);
GO