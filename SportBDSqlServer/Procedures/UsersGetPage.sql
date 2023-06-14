﻿CREATE PROCEDURE [dbo].[UsersGetPage]
	@Size INT, 
	@Count INT

AS
BEGIN
	SELECT *
	FROM Users 
	ORDER BY Id
		OFFSET @Count*@Size ROWS
		FETCH NEXT @Size ROWS ONLY;
END
GO