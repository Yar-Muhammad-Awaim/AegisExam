CREATE TABLE [Proctoring].KeystrokeAction
(
    ActionId INT NOT NULL,
    KeyPressed VARCHAR(50) NOT NULL,
    ModifierKeys VARCHAR(50),
    CONSTRAINT PK_KeystrokeAction PRIMARY KEY (ActionId),
    CONSTRAINT FK_KeystrokeAction_Action FOREIGN KEY (ActionId) REFERENCES [Proctoring].Action(ActionId)
);
GO