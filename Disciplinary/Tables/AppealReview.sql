CREATE TABLE [Disciplinary].AppealReview
(
    AppealReviewId INT IDENTITY(1, 1) NOT NULL,
    AppealId INT NOT NULL,
    ReviewedBy INT NOT NULL,
    ReviewDate DATETIME NOT NULL CONSTRAINT DF_AppealReview_ReviewDate DEFAULT GETDATE(),
    Decision VARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX),
    CONSTRAINT PK_AppealReview PRIMARY KEY (AppealReviewId),
    CONSTRAINT FK_AppealReview_Appeal FOREIGN KEY (AppealId) REFERENCES [Disciplinary].Appeal(AppealId),
    CONSTRAINT FK_AppealReview_Instructor FOREIGN KEY (ReviewedBy) REFERENCES [Identity].Instructor(InstructorId)
);
GO