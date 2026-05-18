CREATE TABLE [Identity].Student
(
    StudentId INT IDENTITY(1, 1) NOT NULL,
    PersonId INT NOT NULL,
    ProgramId INT NOT NULL,
    RollNumber VARCHAR(50) NOT NULL,
    EnrollmentYear INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Student PRIMARY KEY (StudentId),
    CONSTRAINT FK_Student_Person FOREIGN KEY (PersonId) REFERENCES [Identity].Person(PersonId),
    CONSTRAINT FK_Student_Program FOREIGN KEY (ProgramId) REFERENCES [Academic].Program(ProgramId),
    CONSTRAINT UQ_Student_RollNumber UNIQUE (RollNumber),
    CONSTRAINT CHK_Student_EnrollmentYear CHECK (EnrollmentYear > 1900),
    CONSTRAINT CHK_Student_Status CHECK (Status IN ('ACTIVE', 'GRADUATED', 'SUSPENDED', 'DROPPED'))
);
GO