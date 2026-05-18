CREATE TABLE [Academic].CourseEnrollmentGrade
(
    EnrollmentId INT NOT NULL,
    LetterGrade VARCHAR(5),
    GradePoints DECIMAL(5,2),
    UpdatedAt DATETIME NOT NULL CONSTRAINT DF_CourseEnrollmentGrade_UpdatedAt DEFAULT GETDATE(),
    CONSTRAINT PK_CourseEnrollmentGrade PRIMARY KEY (EnrollmentId),
    CONSTRAINT FK_CourseEnrollmentGrade_Enrollment FOREIGN KEY (EnrollmentId) REFERENCES [Academic].Enrollment(EnrollmentId)
);
GO