CREATE TABLE [dbo].[Users]
(
	[Id] INT,
	[RoleId] INT,
	[Login] VARCHAR(50)  NOT NULL,
	[Password] VARCHAR(50),
	[FIO] VARCHAR(50), 
	CONSTRAINT [PK_Users] PRIMARY KEY ([Id]), 
	CONSTRAINT [AK_Users_Login] UNIQUE ([Login]),
    CONSTRAINT [FK_Users_ToRoles] FOREIGN KEY ([RoleId]) REFERENCES [Roles]([Id]) ON DELETE SET NULL
)
