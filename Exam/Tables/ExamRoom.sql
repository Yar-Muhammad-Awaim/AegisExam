CREATE TABLE [Exam].ExamRoom
(
    ExamRoomId INT IDENTITY(1, 1) NOT NULL,
    ScheduleId INT NOT NULL,
    RoomId INT NOT NULL,
    CapacityOverride INT,
    CONSTRAINT PK_ExamRoom PRIMARY KEY (ExamRoomId),
    CONSTRAINT FK_ExamRoom_ExamSchedule FOREIGN KEY (ScheduleId) REFERENCES [Exam].ExamSchedule(ScheduleId),
    CONSTRAINT FK_ExamRoom_Room FOREIGN KEY (RoomId) REFERENCES [Academic].Room(RoomId)
);
GO