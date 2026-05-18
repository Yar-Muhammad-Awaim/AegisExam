CREATE TABLE [Academic].University
(
    UniversityId INT IDENTITY(1, 1) NOT NULL,
    Name VARCHAR(200) NOT NULL,
    Country VARCHAR(100),
    Timezone VARCHAR(50),
    Website VARCHAR(255),
    CONSTRAINT PK_University PRIMARY KEY (UniversityId)
);
GO