CREATE PROCEDURE [dbo].[LoginUser]
	@Login VARCHAR(50), 
	@Password VARCHAR(50),
	@IP VARCHAR(50)=NULL,
	@DeviceSettings VARCHAR(200)=NULL
AS
DECLARE @UserId INT = NULL

SELECT @UserId=[Id] FROM Users WHERE Login = @Login AND Password = @Password

IF @UserId IS NOT NULL
BEGIN
	INSERT LoginsHistory(UserId, DateTime, IP, DeviceSettings)
	VALUES (@UserId, SYSDATETIMEOFFSET(), @IP, @DeviceSettings)
	SELECT * FROM Users WHERE Login = @Login AND Password = @Password
END
GO

