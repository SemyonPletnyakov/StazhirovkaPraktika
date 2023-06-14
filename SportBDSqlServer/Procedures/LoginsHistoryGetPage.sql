CREATE PROCEDURE [dbo].[LoginsHistoryGetPage]
	@Size INT, 
	@Count INT

AS
BEGIN
	SELECT *
	FROM LoginsHistory 
	ORDER BY Id
		OFFSET @Count*@Size ROWS
		FETCH NEXT @Size ROWS ONLY;
END
GO