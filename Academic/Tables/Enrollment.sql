CREATE TABLE [Academic].Enrollment
(
    EnrollmentId INT IDENTITY(1, 1) NOT NULL,
    StudentId INT NOT NULL,
    OfferingId INT NOT NULL,
    EnrolledAt DATETIME NOT NULL CONSTRAINT DF_Enrollment_EnrolledAt DEFAULT GETDATE(),
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Enrollment PRIMARY KEY (EnrollmentId),
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (StudentId) REFERENCES [Identity].Student(StudentId),
    CONSTRAINT FK_Enrollment_CourseOffering FOREIGN KEY (OfferingId) REFERENCES [Academic].CourseOffering(OfferingId),
    CONSTRAINT UQ_Enrollment_Offering_Student UNIQUE (OfferingId, StudentId)
);
GO