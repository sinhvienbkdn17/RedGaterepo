SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUsersByProfileProperty]
    @PortalID		int,
    @PropertyName   nvarchar(256),
    @PropertyValue  nvarchar(256),
    @PageIndex      int,
    @PageSize       INT,
    @IncludeDeleted bit,
    @SuperUsersOnly bit	
AS
BEGIN
	-- Set the page bounds
	DECLARE @PageLowerBound INT
	DECLARE @PageUpperBound INT
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

	-- Create a temp table TO store the select results
	CREATE TABLE #PageIndexForUsers
	(
		IndexId int IDENTITY (0, 1) NOT NULL,
		UserId int,
		DisplayName varchar(512)
	)

	-- Insert into our temp table
	INSERT INTO #PageIndexForUsers (UserId,DisplayName)
		SELECT DISTINCT U.UserId, U.DisplayName 
		FROM dbo.ProfilePropertyDefinition P
			INNER JOIN dbo.UserProfile     UP ON P.PropertyDefinitionID = UP.PropertyDefinitionID 
			INNER JOIN dbo.Users           U  ON UP.UserID = U.UserID
			INNER JOIN dbo.Lists           DT ON DT.EntryID = P.DataType
			LEFT  JOIN dbo.Lists           L  ON L.ListName = @PropertyName AND L.Value = UP.PropertyValue AND L.Text LIKE @PropertyValue
		WHERE (PropertyName = @PropertyName)
		  AND (PropertyValue LIKE @PropertyValue OR PropertyText LIKE @PropertyValue OR (DT.Value = 'List' AND L.EntryID IS NOT NULL ))
		  AND (IsDeleted <= CASE @IncludeDeleted WHEN 0 THEN 0 ELSE 1 END
						--less than equal done to cover IsDeleted in (1,0) for IncludeDeleted...else just IsDeleted = 0
				    OR IsDeleted Is NULL)
			AND IsSuperUser >= CASE @SuperUsersOnly WHEN 1 THEN 1 ELSE 0 END
			AND (P.Portalid = @PortalID OR (@PortalID is null ))
		ORDER BY U.DisplayName

	SELECT  *
	FROM	dbo.vw_Users u, 
			#PageIndexForUsers p
	WHERE  u.UserId = p.UserId
			AND (IsDeleted <= CASE @IncludeDeleted WHEN 0 THEN 0 ELSE 1 END
						--less than equal done to cover IsDeleted in (1,0) for IncludeDeleted...else just IsDeleted = 0
				    OR IsDeleted Is NULL)
			AND IsSuperUser >= CASE @SuperUsersOnly WHEN 1 THEN 1 ELSE 0 END
			AND ( PortalId = @PortalID OR (@PortalID is null ))
			AND p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
		ORDER BY U.DisplayName

	SELECT  TotalRecords = COUNT(*)
	FROM    #PageIndexForUsers
END
GO
