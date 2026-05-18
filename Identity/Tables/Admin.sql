CREATE TABLE [Identity].Admin
(
    AdminId INT IDENTITY(1, 1) NOT NULL,
    PersonId INT NOT NULL,
    RoleLevel VARCHAR(20) NOT NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_Admin_IsActive DEFAULT 1,
    CONSTRAINT PK_Admin PRIMARY KEY (AdminId),
    CONSTRAINT FK_Admin_Person FOREIGN KEY (PersonId) REFERENCES [Identity].Person(PersonId),
    CONSTRAINT CHK_Admin_RoleLevel CHECK (RoleLevel IN ('SUPER', 'DEPARTMENT', 'COURSE'))
);
GO