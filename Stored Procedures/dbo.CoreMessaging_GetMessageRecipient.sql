SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetMessageRecipient]
    @RecipientID INT
AS
	SELECT [RecipientID], [MessageID], [UserID], [Read], [Archived], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]
	FROM   dbo.CoreMessaging_MessageRecipients
	WHERE  [RecipientID] = @RecipientID
GO
