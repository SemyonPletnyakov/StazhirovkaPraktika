CREATE TABLE [dbo].[Roles]
(
	[Id] INT IDENTITY(1,1), 
    [Name] VARCHAR(50) NOT NULL, 
    [ReadSportEvents] BIT NOT NULL,
	[ChangeSportEvents] BIT NOT NULL,
	[ChangeUsers] BIT NOT NULL, 
    CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
)
	
