CREATE TABLE [dbo].[Users]
(
	[Id] INT,
	[RoleId] INT,
	[Login] NVARCHAR(50)  NOT NULL,
	[Password] NVARCHAR(50),
	[FIO] NVARCHAR(50), 
	CONSTRAINT [PK_Users] PRIMARY KEY ([Id]), 
	CONSTRAINT [AK_Users_Login] UNIQUE ([Login]),
    CONSTRAINT [FK_Users_ToRoles] FOREIGN KEY ([RoleId]) REFERENCES [Roles]([Id]) ON DELETE SET NULL
)

GO

CREATE INDEX [IX_Users_RoleId] ON [dbo].[Users] ([RoleId])
