CREATE TABLE [Notification].Notification
(
    NotificationId INT IDENTITY(1, 1) NOT NULL,
    PersonId INT NOT NULL,
    NotificationType VARCHAR(50) NOT NULL,
    Channel VARCHAR(50) NOT NULL,
    Subject VARCHAR(255) NOT NULL,
    Body NVARCHAR(MAX) NOT NULL,
    SentAt DATETIME,
    IsRead BIT NOT NULL CONSTRAINT DF_Notification_IsRead DEFAULT 0,
    CONSTRAINT PK_Notification PRIMARY KEY (NotificationId),
    CONSTRAINT FK_Notification_Person FOREIGN KEY (PersonId) REFERENCES [Identity].Person(PersonId)
);
GO