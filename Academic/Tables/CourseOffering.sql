CREATE TABLE [Academic].CourseOffering
(
    OfferingId INT IDENTITY(1, 1) NOT NULL,
    CourseId INT NOT NULL,
    SemesterId INT NOT NULL,
    InstructorId INT NOT NULL,
    Capacity INT,
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT PK_CourseOffering PRIMARY KEY (OfferingId),
    CONSTRAINT FK_CourseOffering_Course FOREIGN KEY (CourseId) REFERENCES [Academic].Course(CourseId),
    CONSTRAINT FK_CourseOffering_Semester FOREIGN KEY (SemesterId) REFERENCES [Academic].Semester(SemesterId),
    CONSTRAINT FK_CourseOffering_Instructor FOREIGN KEY (InstructorId) REFERENCES [Identity].Instructor(InstructorId)
);
GO