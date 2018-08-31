SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUnAuthorizedUsers]
	@PortalID       int,
	@IncludeDeleted bit,
	@SuperUsersOnly bit		
AS
	SELECT  *
	FROM	dbo.vw_Users
	WHERE  PortalId = @PortalID
		AND Authorised = 0
		AND IsDeleted <= CASE @IncludeDeleted WHEN 0 THEN 0 ELSE 1 END
		--less than equal done to cover IsDeleted in (1,0) for IncludeDeleted...else just IsDeleted = 0
		AND IsSuperUser >= CASE @SuperUsersOnly WHEN 1 THEN 1 ELSE 0 END
	ORDER BY UserName
GO
