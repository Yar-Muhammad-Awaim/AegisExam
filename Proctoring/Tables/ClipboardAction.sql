CREATE TABLE [Proctoring].ClipboardAction
(
    ActionId INT NOT NULL,
    EventType VARCHAR(50) NOT NULL,
    ContentHash VARCHAR(255),
    ContentLength INT,
    CONSTRAINT PK_ClipboardAction PRIMARY KEY (ActionId),
    CONSTRAINT FK_ClipboardAction_Action FOREIGN KEY (ActionId) REFERENCES [Proctoring].Action(ActionId)
);
GO