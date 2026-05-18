CREATE TABLE [Exam].InvigilationAssignment
(
    AssignmentId INT IDENTITY(1, 1) NOT NULL,
    ExamRoomId INT NOT NULL,
    InstructorId INT NOT NULL,
    AssignedAt DATETIME NOT NULL CONSTRAINT DF_InvigilationAssignment_AssignedAt DEFAULT GETDATE(),
    CONSTRAINT PK_InvigilationAssignment PRIMARY KEY (AssignmentId),
    CONSTRAINT FK_InvigilationAssignment_ExamRoom FOREIGN KEY (ExamRoomId) REFERENCES [Exam].ExamRoom(ExamRoomId),
    CONSTRAINT FK_InvigilationAssignment_Instructor FOREIGN KEY (InstructorId) REFERENCES [Identity].Instructor(InstructorId)
);
GO