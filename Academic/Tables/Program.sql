CREATE TABLE [Academic].Program
(
    ProgramId INT IDENTITY(1, 1) NOT NULL,
    DeptId INT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    DegreeLevel VARCHAR(50) NOT NULL,
    TotalCreditHours INT NOT NULL,
    CONSTRAINT PK_Program PRIMARY KEY (ProgramId),
    CONSTRAINT FK_Program_Department FOREIGN KEY (DeptId) REFERENCES [Academic].Department(DeptId),
    CONSTRAINT CHK_Program_TotalCreditHours CHECK (TotalCreditHours > 0)
);
GO