CREATE TABLE [QuestionBank].QuestionAttachment
(
    AttachmentId INT IDENTITY(1, 1) NOT NULL,
    QuestionId INT NOT NULL,
    FilePath VARCHAR(500) NOT NULL,
    FileType VARCHAR(50) NOT NULL,
    CONSTRAINT PK_QuestionAttachment PRIMARY KEY (AttachmentId),
    CONSTRAINT FK_QuestionAttachment_Question FOREIGN KEY (QuestionId) REFERENCES [QuestionBank].Question(QuestionId)
);
GO