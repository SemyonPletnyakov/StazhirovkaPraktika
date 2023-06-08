﻿CREATE TABLE [dbo].[LoginsHistory]
(
	[Id] INT IDENTITY(1,1),
	[UserId] INT NOT NULL,
	[DateTime] DATETIMEOFFSET NOT NULL,
	[IP] VARCHAR(50),
	[DeviceSettings] VARCHAR(200), 
	CONSTRAINT [PK_LoginsHistory] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_LoginsHistory_ToUsers] FOREIGN KEY ([UserId]) REFERENCES [Users]([Id])
)
