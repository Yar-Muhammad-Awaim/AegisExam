CREATE TABLE [Identity].Person
(
  PersonId INT IDENTITY(1, 1),
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50),
  Email NVARCHAR(254) NOT NULL,
  PhoneNumber VARCHAR(15) NOT NULL,
  DateOfBirth DATE NOT NULL,
  NationalID VARCHAR(13) NOT NULL,
  PasswordHash VARCHAR(255) NOT NULL,
  CreatedAt DATETIME NOT NULL 
    CONSTRAINT DF_CreatedAt_Person DEFAULT GETDATE(),
  CONSTRAINT PK_Person PRIMARY KEY(PersonId),
  CONSTRAINT UQ_Email_Person UNIQUE(Email) ,
  CONSTRAINT CHK_Email_Person CHECK (Email  LIKE '%_@_%_.__%' AND LEN(Email) <= 254),
  CONSTRAINT UQ_PhoneNumber_Person UNIQUE(PhoneNumber) ,
  CONSTRAINT CHK_PhoneNumber_Person CHECK (LEN(PhoneNumber) <= 15 AND PhoneNumber NOT LIKE '%[^0-9+() .-]%'),
  CONSTRAINT CHK_DateOfBirth_Person CHECK (DateOfBirth <= GETDATE() AND DateOfBirth > '1920-01-01'),
  CONSTRAINT UQ_NationalID_Person UNIQUE(NationalID),
);

