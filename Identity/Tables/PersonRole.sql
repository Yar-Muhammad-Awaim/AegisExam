CREATE TABLE [Identity].PersonRole
(
    PersonId INT NOT NULL,
    RoleType VARCHAR(20) NOT NULL,
    CONSTRAINT PK_PersonRole PRIMARY KEY (PersonId, RoleType),
    CONSTRAINT FK_PersonRole_Person FOREIGN KEY (PersonId) REFERENCES [Identity].Person(PersonId),
    CONSTRAINT CHK_PersonRole_RoleType CHECK (RoleType IN ('STUDENT', 'INSTRUCTOR', 'ADMIN'))
);
GO