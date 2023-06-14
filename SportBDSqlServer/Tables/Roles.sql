CREATE TABLE [dbo].[Roles]
(
	[Id] INT, 
    [Name] NVARCHAR(50) NOT NULL, 
    [ReadSportEvents] BIT NOT NULL,
	[ChangeSportEvents] BIT NOT NULL,
	[ChangeUsers] BIT NOT NULL, 
    CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
)
	

GO

CREATE INDEX [IX_Roles_Name] ON [dbo].[Roles] ([Name])
