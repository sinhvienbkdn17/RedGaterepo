SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteUserPortal]
	@UserID		int,
	@PortalID   int
AS
	IF @PortalID IS NULL
		BEGIN
			UPDATE dbo.Users
				SET
					IsDeleted = 1
				WHERE  UserId = @UserID
		END
	ELSE
		BEGIN
			UPDATE dbo.UserPortals
				SET
					IsDeleted = 1
				WHERE  UserId = @UserID
					AND PortalId = @PortalID
		END
GO
