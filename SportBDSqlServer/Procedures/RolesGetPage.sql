CREATE PROCEDURE [dbo].[RolesGetPage]
	@Size INT, 
	@Count INT

AS
BEGIN
	SELECT *
	FROM Roles 
	ORDER BY Id
		OFFSET @Count*@Size ROWS
		FETCH NEXT @Size ROWS ONLY;
END
GO


