SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUsersAdvancedSearch] 
(
    @PortalID int,                          -- portal                
    @UserId int,                            -- for determining correct visibility permissions
    @FilterUserId int,                      -- for filtering relationships on    
    @FilterRoleId int,                      -- for filtering by roles
    @RelationshipTypeId int,                -- for filtering by relationships
    @IsAdmin bit,                           -- determines visibility
    @PageSize int,                          -- page size
    @PageIndex int,                         -- 0 based page index
    @SortBy nvarchar(100),                  -- sort field
    @SortAscending bit,                     -- sort flag indicating whether sort is asc or desc
    @PropertyNames nvarchar(max),           -- list of property names to filter
    @PropertyValues nvarchar(max)           -- list of property values to filter
)
AS
BEGIN
    -- Setup Top XX
    DECLARE @topSql nvarchar(20) SET @topSql = ''
    IF @PageSize > -1 BEGIN SET @topSql = ' TOP ' + CONVERT(nvarchar(20), @PageSize) END
                
    -- Setup Specific Page
    DECLARE @minRowNumberSql nvarchar(20) SET @minRowNumberSql =  CONVERT(nvarchar(20), ((@PageIndex * @PageSize) + 1))
    -- Setup Pivot Field List
    DECLARE @pivotSql nvarchar(max) SELECT @pivotSql = dbo.GetProfileFieldSql(@PortalID, '')

    -- Get User specific columns
    DECLARE @UserColumns TABLE(ColumnName NVARCHAR(100))
    INSERT INTO @UserColumns SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'vw_Users' AND TABLE_SCHEMA = REPLACE('dbo.', '.', '')

    -- Lists Filters names and values into tables
    DECLARE @PropertyNamesTable TABLE (RowNumber INT, RowValue nvarchar(MAX))
    DECLARE @PropertyValuesTable TABLE (RowNumber INT, RowValue nvarchar(MAX))
    INSERT INTO @PropertyNamesTable SELECT * FROM dbo.ConvertListToTable(',', @PropertyNames)                      
    INSERT INTO @PropertyValuesTable SELECT * FROM dbo.ConvertListToTable(',', @PropertyValues)
                
    -- Gets filters that are on the User rather than Profile Properties
    DECLARE @UserFiltersTable TABLE (RowNumber Int, RowValue NVARCHAR(MAX))
    INSERT INTO @UserFiltersTable SELECT * FROM dbo.ConvertListToTable(',',@PropertyNames) WHERE RowValue IN (SELECT * FROM @UserColumns)


    DECLARE @sql nvarchar(max) SET @sql = ''
    DECLARE @filterSql nvarchar(max)SET @filterSql = ''

    -- ///////////////////////////////////////////////////
    -- FILTERING by PROFILE PROPERTY or USER PROPERTY
    -- ///////////////////////////////////////////////////
    --IF @PropertyNames IS NOT NULL AND @PropertyNames <> ''
    IF ((SELECT COUNT(*) FROM @PropertyNamesTable) > 0) AND ((SELECT COUNT(*) FROM @PropertyValuesTable)> 0) 
	    BEGIN
            DECLARE @propertyFilter nvarchar(max)
            DECLARE @userFilter nvarchar(max)
            DECLARE @userFilterJoin nvarchar(max) SET @userFilterJoin = ''
            DECLARE @profilePropertyCount INT
            DECLARE @userFilterCount INT
            DECLARE @propertyAndUserFilter nvarchar(10) SET @propertyAndUserFilter = ''
            DECLARE @groupBy NVARCHAR(300)

            -- Filters on Profile Properties    
            ;WITH CTE_PropertyNames(RowNumber, RowValue) AS
            (              SELECT * FROM @PropertyNamesTable
                            WHERE RowValue NOT IN (SELECT ColumnName FROM @UserColumns)),
            CTE_PropertyValues(RowNumber, RowValue) AS
            (              SELECT * FROM @PropertyValuesTable
                            WHERE RowValue NOT IN (SELECT ColumnName FROM @UserColumns))

            SELECT @propertyFilter = COALESCE(@propertyFilter + ' OR ' , ' ') 
                                        + ' (PropertyName=''' + N.RowValue 
                                        + ''' AND ((PropertyValue LIKE ''' + V.RowValue +'%'') OR (PropertyValue LIKE ''% ' + V.RowValue +'%'')))'
            FROM CTE_PropertyNames AS N INNER JOIN CTE_PropertyValues AS V ON N.RowNumber = V.RowNumber
                                
            -- Filters on User Property                           
            SELECT @userFilter = COALESCE(@userFilter + ' AND ', ' ')  
										+ ' ((u.' + N.RowValue + ' LIKE ''' + V.RowValue +'%'') OR (u.' + N.RowValue + ' LIKE ''% ' + V.RowValue +'%'')) '
            FROM @UserFiltersTable AS N  INNER JOIN @PropertyValuesTable AS V ON N.RowNumber = V.RowNumber
                                
            SELECT @userFilterCount = COUNT(*) FROM @UserFiltersTable
            IF @userFilterCount > 0 BEGIN SET @userFilterJoin = ' INNER JOIN vw_Users u ON u.UserId = p.UserId ' END

            -- Determining the Group By Clause -- dependant on types of filters used
            SELECT @profilePropertyCount = COUNT(*) FROM dbo.ConvertListToTable(',', @PropertyNames)
            WHERE RowValue IN (SELECT PropertyName FROM dbo.ProfilePropertyDefinition WHERE PortalID = @PortalId)
            AND RowValue NOT IN (SELECT ColumnName FROM @UserColumns)

            IF @profilePropertyCount > 0
                BEGIN SET @groupBy = ' GROUP BY p.UserId HAVING COUNT(*) = ' + CONVERT(nvarchar(20),@profilePropertyCount ) END
            ELSE
                BEGIN SET @groupBy = ' GROUP BY p.UserId HAVING COUNT(*) > 0 '     END

            IF ( @profilePropertyCount > 0 AND @userFilterCount > 0)
            BEGIN SET @propertyAndUserFilter = ' AND ' END

            -- CREATE FINAL FILTER
            SET @filterSql = ' CREATE TABLE #MatchingUsers (UserId int, occurances int) INSERT INTO #MatchingUsers SELECT p.UserID, COUNT(*) AS occurances' 
                                        + ' FROM dbo.vw_profile p ' + @userFilterJoin
                                        + ' WHERE ' + COALESCE(' ( ' + @propertyFilter + ') ', ' ') + @propertyAndUserFilter + COALESCE(@userFilter, ' ') 
										+ ' AND ((Visibility = 0) OR (Visibility = 1 AND ' + CONVERT(nvarchar(20), @UserId) + ' > 0) OR (Visibility = 2 AND ' + CONVERT(nvarchar(20), @IsAdmin) + ' = 1))' 
                                        + @groupBy
		END

        -- ///////////////////////////////////////////////////      
        -- SETUP ROLE AND RELATIONSHIP FILTERS
        -- ///////////////////////////////////////////////////
        DECLARE @roleAndRelationshipFilter nvarchar(1000)
        DECLARE @roleFilter nvarchar(500) SET @roleFilter = ''
        DECLARE @relationshipFilter nvarchar(1000) SET @relationshipFilter = ''
        DECLARE @roleAndRelationshipFlag bit SET @roleAndRelationshipFlag  = 0
        DECLARE @RoleAndRelationshipSelect nvarchar(100) SET @RoleAndRelationshipSelect = ''
                                
        -- Filter by Role
        IF @FilterRoleId <> -1 
            BEGIN
                SET @roleAndRelationshipFlag = 1
                SET @roleFilter = ' JOIN dbo.UserRoles UR ON U.UserID = UR.UserID AND UR.Status = 1 '
					+ ' AND (UR.EffectiveDate < GETDATE() OR UR.EffectiveDate IS NULL) '
                    + ' AND (UR.ExpiryDate > GETDATE() OR UR.ExpiryDate IS NULL) AND UR.RoleID = ' + CONVERT(nvarchar(20), @FilterRoleId)
            END

        -- Filter by Relationship
        IF @RelationshipTypeId <> -1  
            BEGIN
                SET @roleAndRelationshipFlag = 1
                SET @relationshipFilter = ' JOIN dbo.Relationships REL ON REL.PortalID = ' + CONVERT(nvarchar(20), @PortalID)
                                            + ' AND RelationshipTypeID = ' + CONVERT(nvarchar(20), @RelationshipTypeId) 
                                            + ' JOIN dbo.UserRelationships UREL ON REL.RelationshipID = UREL.RelationshipID AND
                                            ((UREL.UserID = ' + CONVERT(nvarchar(20), @FilterUserId) + ' AND UREL.RelatedUserID = U.UserID) OR
                                            (UREL.UserID = U.UserID AND UREL.RelatedUserID = ' + CONVERT(nvarchar(20), @FilterUserId) + '))'
                                            + ' WHERE UREL.Status = 2'
            END 

        IF @roleAndRelationshipFlag = 1 BEGIN SET @RoleAndRelationshipSelect = ' AND s.UserId IN (SELECT userID FROM  RoleAndRelationUsers) ' END

        SET @roleAndRelationshipFilter =  ', RoleAndRelationUsers AS ( SELECT U.userId FROM dbo.vw_Users U ' + @roleFilter + @relationshipFilter + ' )' 

        -- ///////////////////////////////////////////////////  
        -- SET UP SORT
        -- ///////////////////////////////////////////////////
        DECLARE @sortSql nvarchar(1000) SET @sortSql = ''
        DECLARE @propertySort nvarchar(1000) SET @propertySort = ''
        DECLARE @filterJoin nvarchar(100) SET @filterJoin = ''
        DECLARE @filterSortSql nvarchar(1000) SET @filterSortSql = ''
        DECLARE @sortByUserProperty BIT         
        SELECT @sortByUserProperty = COUNT(*) FROM @UserColumns WHERE ColumnName = @SortBy

        IF ( @profilePropertyCount > 0 OR @userFilterCount > 0)
	        BEGIN SET @filterJoin = ' INNER JOIN #MatchingUsers m ON m.UserID = s.UserID ' END

        -- Determine the Type of Sort
        IF (@SortBy IS NOT NULL AND @SortBy <> '') AND @sortByUserProperty <> 1
	        BEGIN -- Sort By Profile Property
                SET @sortSql = dbo.GetSortSql(@SortBy,@SortAscending,'UserID')
                SET @propertySort = dbo.GetSortSql('PropertyValue',@SortAscending,'UserID')
                SET @filterSortSql = ' ;WITH SortedUsers AS ( SELECT ROW_NUMBER() OVER( ' + @propertySort + ' ) AS RowNumber, *  ' 
                                                + ' FROM dbo.vw_Profile WHERE PortalId = ' + CONVERT(nvarchar(20), @PortalID) + ' AND PropertyName = ''' + @SortBy + ''' )'
                                                + ' , MatchingSorted AS ( SELECT ROW_NUMBER() OVER(ORDER BY [RowNumber]) AS RowNumber, s.UserId FROM SortedUsers s '
                                                + @filterJoin + ' ) '
	        END
        ELSE
		    BEGIN   
                -- Sort By User Property
                IF @sortByUserProperty = 1 BEGIN SET @sortSql = dbo.GetSortSql(@SortBy,@SortAscending,'UserID')END
                                
                -- Default: Sort By UserID
                ELSE BEGIN SET @sortSql = dbo.GetSortSql('UserID',@SortAscending,'UserID') END                        
                SET @filterSortSql = ' ;WITH SortedUsers AS ( SELECT ROW_NUMBER() OVER( ' + @sortSql + ' ) AS RowNumber, * '
                                                + ' FROM dbo.vw_Users WHERE (PortalID = ' + CONVERT(nvarchar(20), @PortalID) + ' OR PortalID Is NULL) AND IsDeleted = 0)'
                                                + ' , MatchingSorted AS ( SELECT ROW_NUMBER() OVER(ORDER BY [RowNumber]) AS RowNumber, s.UserId FROM SortedUsers s '
                                                + @filterJoin + ' ) '
	        END

		-- Check if any Profile Property Definitions exist for this portal
		IF @pivotSql is not null
			BEGIN
				-- SELECT with PIVOT
				SET @pivotSql = 'SELECT * FROM (SELECT * FROM PivotedUsers PIVOT (MAX(PropertyValue) for PropertyName in (' + @pivotSql + ') ) as pivotTable) T '
			END
		ELSE
			BEGIN
				-- SELECT with DISTINCT
				SET @pivotSql = 'SELECT distinct UserID, PortalID, Username, Email, DisplayName, IsSuperUser, IsDeleted, AffiliateID, UpdatePassword, Authorised FROM PivotedUsers '
			END

        -- ///////////////////////////////////////////////////
        -- CREATE FINAL QUERY
        -- ///////////////////////////////////////////////////
        SET @sql = @filterSql
                + ' DECLARE @TempUsers TABLE (SortOrder INT, UserID INT) '
                + @filterSortSql
                + @roleAndRelationshipFilter
                + ' INSERT INTO @TempUsers SELECT ' + @topSql + ' * FROM (SELECT '
                + ' ROW_NUMBER() OVER ( ORDER BY [RowNumber] ) AS RowNumber, s.UserId FROM MatchingSorted s ' 
                + ' WHERE 1=1 ' + @roleAndRelationshipSelect
				+ ') t WHERE RowNumber >= '+ @minRowNumberSql
                + ' ;WITH PivotedUsers AS ( SELECT U.UserID, U.PortalID, U.Username, U.Email, U.DisplayName, U.IsSuperUser, U.IsDeleted, U.CreatedOnDate,        
                                                U.AffiliateID, U.UpdatePassword, U.Authorised, Prop.PropertyName,
                                                CASE
                                                    WHEN (P.Visibility = 0) THEN P.PropertyValue
                                                    WHEN (P.Visibility = 1 AND ' + CONVERT(nvarchar(20), @IsAdmin) + ' = 1) THEN P.PropertyValue
                                                    WHEN (P.Visibility = 1 AND ' + CONVERT(nvarchar(20), @IsAdmin) + ' = 0 AND ' + CONVERT(nvarchar(20), @UserId) + ' > 0) THEN P.PropertyValue
                                                    WHEN U.UserID = ' + CONVERT(nvarchar(20), @UserId) + ' OR (P.Visibility = 2 AND ' + CONVERT(nvarchar(20), @IsAdmin) + ' = 1) THEN P.PropertyValue
                                                    ELSE NULL
                                                END AS PropertyValue
                                            FROM   dbo.vw_Users AS U
                                                INNER JOIN dbo.UserProfile AS P ON U.UserID = P.UserID
                                                LEFT OUTER JOIN dbo.ProfilePropertyDefinition AS Prop ON 
                                                (Prop.PropertyDefinitionID = P.PropertyDefinitionID and Prop.Deleted = 0 and Prop.PortalID = ' + CONVERT(nvarchar(20), @PortalID) + ')
                                            WHERE U.UserId IN (SELECT UserId FROM @TempUsers) AND (U.PortalId = ' + CONVERT(nvarchar(20), @PortalID) + ' OR U.PortalId IS NULL)
                                            )' +
                @pivotSql + @sortSql + ' DROP TABLE #MatchingUsers'           

        EXEC(@sql)
END
GO
