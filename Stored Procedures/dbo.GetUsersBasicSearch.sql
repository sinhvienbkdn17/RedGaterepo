SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUsersBasicSearch]
(
	@PortalID int,					-- portal
	@PageSize int,					-- page size
	@PageIndex int,					-- 0 based page index
	@SortBy nvarchar(100),			-- sort field
	@SortAscending bit,				-- sort flag indicating whether sort is asc or desc
	@PropertyName nvarchar(256),    -- property to filter by (username, diaplayname, email)
	@PropertyValue nvarchar(256)	-- value of property
)
AS
	-- Set up Top XX
	DECLARE @topSql nvarchar(20)
	SET @topSql = CONVERT(nvarchar(20), @PageSize)

	--Set up Count
	DECLARE @minRowNumberSql nvarchar(20)
	SET @minRowNumberSql =  CONVERT(nvarchar(20), ((@PageIndex * @PageSize) + 1))

	-- Set up Sort
	DECLARE @sortSql nvarchar(1000)
	SET @sortSql = dbo.GetSortSql(@SortBy, @SortAscending, 'UserID')

	-- Setup Pivot Field List
	DECLARE @pivotSql nvarchar(max)
	SELECT @pivotSql = dbo.GetProfileFieldSql(@PortalID, '')

	-- Setup FieldName Field List for temporary table
	DECLARE @fieldNames nvarchar(max)
	SELECT @fieldNames = dbo.GetProfileFieldSql(@PortalID, ' nvarchar(max)')

	DECLARE @sql nvarchar(max)
	SELECT @sql=
				'
					DECLARE @pivotedUsers TABLE
					(
						RowNumber int,
						UserID int,
						PortalID int,
						Username nvarchar(100),
						Email nvarchar(256),
						DisplayName nvarchar(128),
						IsSuperUser bit,
						IsDeleted bit,
						AffiliateID int,
						UpdatePassword bit,
						Authorised bit,
						' + @fieldNames + '
					);

					WITH TempUsers
					AS
					(
						SELECT TOP ' + @topSql + ' * FROM (
							SELECT
								ROW_NUMBER() OVER(' + @sortSql + ') AS RowNumber,
								U.UserID,
								U.PortalID,
								U.Username,
								U.Email,
								U.DisplayName,
								U.IsSuperUser,
								U.IsDeleted,
								U.AffiliateID,
								U.UpdatePassword,
								U.Authorised
								FROM dbo.vw_Users AS U
							WHERE (U.PortalID = ' + CONVERT(nvarchar(20), @PortalID) + ' OR U.PortalID Is NULL )
								AND ((U.' + @PropertyName + ' LIKE N''' + @PropertyValue + '%'')
									OR (U.' + @PropertyName + ' LIKE N''% ' + @PropertyValue + '%''))
								AND U.IsDeleted = 0
						) AS U
						WHERE RowNumber >= ' + @minRowNumberSql + '
					),
					TempUsersWithProfile
					AS
					(
						SELECT
							U.UserID,
							U.PortalID,
							U.Username,
							U.Email,
							U.DisplayName,
							U.IsSuperUser,
							U.IsDeleted,
							U.AffiliateID,
							U.UpdatePassword,
							U.Authorised,
							P.PropertyName,
							P.PropertyValue
						FROM TempUsers U
							INNER JOIN dbo.vw_Profile P ON P.UserID = U.UserID
					)
				    SELECT  * FROM (
					    SELECT  * FROM TempUsersWithProfile
					    PIVOT
					    (
						    MAX(PropertyValue) for PropertyName in (' + @pivotSql + ')
					    ) as pivotTable
                    ) T
					' + @sortSql
	EXEC(@sql)
GO
