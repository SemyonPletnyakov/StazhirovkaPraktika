CREATE PROCEDURE [dbo].[LoginUser]
	@Login VARCHAR(50), 
	@Password VARCHAR(50),
	@IP VARCHAR(50)=NULL,
	@DeviceSettings VARCHAR(200)=NULL

AS
BEGIN
	INSERT LoginsHistory(UserId, DateTime, IP, DeviceSettings)
	SELECT [Id], SYSUTCDATETIME(), @IP, @DeviceSettings 
	FROM Users 
	WHERE Login = @Login AND Password = @Password
END
GO


