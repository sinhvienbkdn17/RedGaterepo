SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Like]
@JournalId int,
@UserId int,
@UserName nvarchar(50)
AS 
IF NOT EXISTS (SELECT JournalId from dbo.[Journal_Data] WHERE JournalId = @JournalId)
	BEGIN
		DECLARE @x xml
		SET @x = '<items><item /></items>';
		INSERT INTO dbo.[Journal_Data] 
			(JournalId, JournalXML)
			VALUES
			(@JournalId, @x)
	END
IF EXISTS(SELECT j.JournalId 
			FROM dbo.Journal as j INNER JOIN
				dbo.Journal_Data as jx ON j.JournalId = jx.JournalId 
			WHERE j.JournalId = @JournalId 
				AND 
				jx.journalxml.exist('/items/likes/u[@uid=sql:variable("@userid")]') = 1)
BEGIN
UPDATE dbo.Journal_Data
SET JournalXML.modify('delete (/items/likes/u[@uid=sql:variable("@UserId")])')
WHERE JournalId = @JournalId 
	AND journalxml.exist('/items/likes/u[@uid=sql:variable("@UserId")]') = 1
END
ELSE
	BEGIN
		BEGIN
			IF NOT EXISTS(SELECT JournalId FROM dbo.Journal_Data
							WHERE JournalId = @JournalId 
									AND
								journalxml.exist('/items/likes') = 1)
				BEGIN
					UPDATE dbo.Journal_Data
					SET JournalXML.modify('insert <likes /> as last into (/items)[1]') 
					WHERE JournalId = @JournalId AND journalxml.exist('/items') = 1
				END
		END
		BEGIN
			UPDATE dbo.Journal_Data
			SET JournalXML.modify('insert <u uid="{xs:string(sql:variable("@UserId"))}" un="{xs:string(sql:variable("@UserName"))}" /> as last into (/items/likes)[1]')
			Where JournalId = @JournalId AND journalxml.exist('/items/likes') = 1
		END
	END
GO
