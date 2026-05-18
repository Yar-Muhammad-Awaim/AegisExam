CREATE TABLE [Academic].CourseWaitlist
(
    WaitlistId INT IDENTITY(1, 1) NOT NULL,
    OfferingId INT NOT NULL,
    StudentId INT NOT NULL,
    Position INT NOT NULL,
    RequestedAt DATETIME NOT NULL CONSTRAINT DF_CourseWaitlist_RequestedAt DEFAULT GETDATE(),
    CONSTRAINT PK_CourseWaitlist PRIMARY KEY (WaitlistId),
    CONSTRAINT FK_CourseWaitlist_CourseOffering FOREIGN KEY (OfferingId) REFERENCES [Academic].CourseOffering(OfferingId),
    CONSTRAINT FK_CourseWaitlist_Student FOREIGN KEY (StudentId) REFERENCES [Identity].Student(StudentId),
    CONSTRAINT UQ_CourseWaitlist_Offering_Student UNIQUE (OfferingId, StudentId)
);
GO