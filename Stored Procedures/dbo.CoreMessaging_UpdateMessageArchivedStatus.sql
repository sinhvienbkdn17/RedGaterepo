SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_UpdateMessageArchivedStatus]
	@ConversationID int,
	@UserID int,
	@Archived bit
AS
BEGIN
	UPDATE dbo.[CoreMessaging_MessageRecipients]
	SET [Archived] = @Archived
	WHERE UserID = @UserID
	AND MessageID IN (SELECT MessageID FROM dbo.[CoreMessaging_Messages] WHERE ConversationID = @ConversationID)

	IF @Archived = 1 BEGIN
		-- If archiving, set also as read
		UPDATE dbo.[CoreMessaging_MessageRecipients]
		SET [Read] = 1
		WHERE [UserID] = @UserID
		AND MessageID IN (SELECT MessageID FROM dbo.[CoreMessaging_Messages] WHERE ConversationID = @ConversationID)
	END
END
GO
