SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteMenuItem]
	@id Integer,
	@userId Integer,
	@time Datetime
AS
BEGIN
	UPDATE GG_MenuItems SET IsDeleted = 1, LastModifiedByUserId = @userId, LastModifiedOnDate = @time WHERE Id = @id
	IF EXISTS (SELECT * FROM GG_MenuItems WHERE ParentId = @id AND IsDeleted = 0)
	BEGIN
		DECLARE cursor_menuItem CURSOR LOCAL FOR 
		SELECT Id FROM GG_MenuItems WHERE ParentId = @id AND IsDeleted = 0

		OPEN cursor_menuItem

		FETCH NEXT FROM cursor_menuItem INTO @id

		WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC DeleteMenuItem @id, @userId, @time
			FETCH NEXT FROM cursor_menuItem INTO @id
		END

		CLOSE cursor_menuItem
	END
END
GO
