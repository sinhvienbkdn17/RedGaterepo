SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUserRolesByUsername]
	@PortalID int, 
	@Username nvarchar(100), 
	@Rolename nvarchar(50)
AS
	IF @UserName Is Null
		BEGIN
			SELECT	*
				FROM dbo.vw_UserRoles
				WHERE PortalId = @PortalID AND (Rolename = @Rolename or @RoleName is NULL)
		END
	ELSE
		BEGIN
			IF @RoleName Is NULL
				BEGIN
					SELECT	*
						FROM dbo.vw_UserRoles
						WHERE PortalId = @PortalID AND (Username = @Username or @Username is NULL)
				END
			ELSE
				BEGIN
					SELECT	*
						FROM dbo.vw_UserRoles
						WHERE PortalId = @PortalID
							AND (Rolename = @Rolename or @RoleName is NULL)
							AND (Username = @Username or @Username is NULL)
				END
		END
GO
