SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Personabar_GetUsers] (
	@PortalId INT,
	@SortColumn NVARCHAR(32),
	@SortAscending BIT,
    @PageIndex int = 0,
    @PageSize int = 10
) AS
BEGIN
	SELECT COUNT(*) AS TotalRecords
	FROM dbo.UserPortals UP WITH (NOLOCK)
	INNER JOIN dbo.vw_Users U WITH (NOLOCK) ON UP.UserId = U.UserID AND U.PortalId = @PortalId
	WHERE UP.PortalId = @PortalId
	AND IsSuperUser = 0 AND U.Authorised=1 AND U.IsDeleted=0
		
	;WITH UsersCTE
	AS
	(	
		SELECT U.UserID, U.Username, U.DisplayName, U.Email, U.CreatedOnDate, U.IsDeleted, U.Authorised,
		ROW_NUMBER() OVER ( ORDER BY CASE WHEN @SortColumn = 'Joined' AND @SortAscending = 1 THEN U.UserID END ASC, 
									 CASE WHEN @SortColumn = 'Joined' AND @SortAscending = 0 THEN U.UserID END DESC,
									 CASE WHEN @SortColumn = 'Email' AND @SortAscending = 1 THEN U.Email END ASC, 
									 CASE WHEN @SortColumn = 'Email' AND @SortAscending = 0 THEN U.Email END DESC,
									 CASE WHEN @SortColumn = 'DisplayName' AND @SortAscending = 1 THEN U.DisplayName END ASC, 
									 CASE WHEN @SortColumn = 'DisplayName' AND @SortAscending = 0 THEN U.DisplayName END DESC) AS RowNumber 
		FROM dbo.vw_Users U WITH (NOLOCK)
		INNER JOIN dbo.UserPortals UP WITH (NOLOCK)
			ON U.UserID = UP.UserId
			AND U.PortalId = @PortalId
		WHERE UP.PortalId = @PortalId
		AND IsSuperUser = 0 AND U.Authorised=1 AND U.IsDeleted=0
	)
	SELECT * FROM UsersCTE
	WHERE	RowNumber BETWEEN (@PageIndex * @PageSize + 1) AND ((@PageIndex + 1) * @PageSize);
END
GO
