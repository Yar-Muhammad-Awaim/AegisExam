CREATE TABLE [Academic].Room
(
    RoomId INT IDENTITY(1, 1) NOT NULL,
    UniversityId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Capacity INT,
    IsVirtual BIT NOT NULL CONSTRAINT DF_Room_IsVirtual DEFAULT 0,
    Location VARCHAR(200),
    CONSTRAINT PK_Room PRIMARY KEY (RoomId),
    CONSTRAINT FK_Room_University FOREIGN KEY (UniversityId) REFERENCES [Academic].University(UniversityId)
);
GO