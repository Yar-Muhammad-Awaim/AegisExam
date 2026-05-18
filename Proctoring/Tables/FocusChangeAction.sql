CREATE TABLE [Proctoring].FocusChangeAction
(
    ActionId INT NOT NULL,
    FromWindow VARCHAR(255),
    ToWindow VARCHAR(255),
    ProcessName VARCHAR(255),
    CONSTRAINT PK_FocusChangeAction PRIMARY KEY (ActionId),
    CONSTRAINT FK_FocusChangeAction_Action FOREIGN KEY (ActionId) REFERENCES [Proctoring].Action(ActionId)
);
GO