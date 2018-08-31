SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExportImport_AddUpdateUsersBulk]
	@DataTable dbo.[ExportImportUserType] READONLY,
	@Overwrite bit = 1
AS
BEGIN

	DECLARE @MinDate Datetime = cast('1753-1-1' as datetime);
	DECLARE @EmptyGuid UNIQUEIDENTIFIER = CAST(CAST(0 AS BINARY) AS UNIQUEIDENTIFIER);
	BEGIN TRANSACTION [UsersInsert]
		--Update/Insert Users
		IF @Overwrite = 1
		BEGIN
			--Update Users
			SELECT 
				    Users.UserID
				,dt.IsDeleted
				,dt.PortalId
				,dt.FirstName 				
				,dt.LastName 					
				,dt.IsSuperUser 				
				,dt.Email 					
				,dt.DisplayName 				
				,dt.UpdatePassword 			
				,dt.PasswordResetToken		
				,dt.PasswordResetExpiration	
				,dt.LastIPAddress 			
				,dt.LastModifiedByUserId 		
			INTO #UserUpdatesDataTable 
			FROM @DataTable dt 
			INNER JOIN dbo.Users Users 
			ON Users.Username= dt.Username
			WHERE Users.UserID IS NOT NULL AND dt.IsSuperUser=0 AND Users.IsSuperUser=0

			UPDATE Users
			SET
				Users.FirstName 				= dt.FirstName,
				Users.LastName 					= dt.LastName,
				Users.IsSuperUser 				= dt.IsSuperUser,
				Users.Email 					= dt.Email,
				Users.DisplayName 				= dt.DisplayName,
				Users.UpdatePassword 			= dt.UpdatePassword,
				Users.PasswordResetToken		= dt.PasswordResetToken,
				Users.PasswordResetExpiration	= dt.PasswordResetExpiration,
				Users.LastIPAddress 			= dt.LastIPAddress,
				Users.LastModifiedByUserID 		= dt.LastModifiedByUserId,
				Users.LastModifiedOnDate 		= getdate(),
				Users.IsDeleted = CASE WHEN dt.PortalId IS NULL THEN dt.IsDeleted ELSE Users.IsDeleted END
			FROM dbo.Users AS Users
			INNER JOIN #UserUpdatesDataTable AS dt ON Users.UserID=dt.UserID
		
			DROP TABLE #UserUpdatesDataTable;
		END
		--Insert new Users
		SELECT  Users.UserID,
				dt.Username,
				dt.FirstName, 	
				dt.LastName, 	
				dt.AffiliateId,
				dt.IsSuperUser,	
				dt.Email,
				dt.DisplayName,
				dt.UpdatePassword,
				dt.CreatedByUserId,
				dt.LastModifiedByUserId
		INTO #UserInsertsDataTable 
		FROM @DataTable dt 
		LEFT JOIN  dbo.Users Users ON Users.Username = dt.Username
		WHERE Users.UserID IS NULL AND dt.IsSuperUser=0  AND ISNULL(Users.IsSuperUser, 0)=0

		INSERT INTO dbo.Users (
			Username,
			FirstName, 
			LastName, 
			AffiliateId,
			IsSuperUser,
			Email,
			DisplayName,
			UpdatePassword,
			CreatedByUserID,
			CreatedOnDate,
			LastModifiedByUserID,
			LastModifiedOnDate
			)
		SELECT
			dt.Username,
			dt.FirstName, 
			dt.LastName, 
			dt.AffiliateId,
			dt.IsSuperUser,
			dt.Email,
			dt.DisplayName,
			dt.UpdatePassword,
			dt.CreatedByUserId,
			getdate(),
			dt.LastModifiedByUserId,
			getdate()
		FROM
			#UserInsertsDataTable dt

		DROP TABLE #UserInsertsDataTable;

		--Update/Insert User Portals
		IF @Overwrite = 1
		BEGIN
			--Update User Portals
			SELECT   
					UP.UserPortalId
				,dt.IsDeleted
				,dt.Authorised
				,dt.RefreshRoles
				,dt.VanityUrl
				,dt.PortalId
			INTO #UP_UpdatesDataTable 
			FROM @DataTable dt 
			INNER JOIN dbo.Users Users ON Users.Username= dt.Username
			INNER JOIN dbo.UserPortals UP ON UP.UserId= Users.UserID
			WHERE Users.UserID IS NOT NULL AND UP.UserPortalId IS NOT NULL AND UP.PortalId=dt.PortalId
			AND dt.IsDeleted IS NOT NULL AND dt.Authorised IS NOT NULL AND dt.RefreshRoles IS NOT NULL AND dt.IsSuperUser=0 AND Users.IsSuperUser=0

			UPDATE UserPortals
				SET
					Authorised =	dt.Authorised,
					RefreshRoles =  dt.RefreshRoles,
					VanityUrl =		dt.VanityUrl,
					IsDeleted =		dt.IsDeleted
			FROM dbo.UserPortals AS UserPortals
			INNER JOIN #UP_UpdatesDataTable AS dt ON UserPortals.UserPortalId=dt.UserPortalId

			DROP TABLE #UP_UpdatesDataTable;
		END
		--Inser User Portals
		SELECT   
			Users.UserId,
			UP.UserPortalId
			,dt.IsDeleted
			,dt.Authorised
			,dt.RefreshRoles
			,dt.VanityUrl
			,dt.PortalId
		INTO #UP_InsertsDataTable 
		FROM @DataTable dt 
		INNER JOIN dbo.Users Users ON Users.Username= dt.Username
		LEFT JOIN dbo.UserPortals UP ON UP.UserId= Users.UserID AND UP.PortalId=dt.PortalId
		WHERE Users.UserID IS NOT NULL AND UP.UserPortalId IS NULL 
		AND dt.IsDeleted IS NOT NULL AND dt.Authorised IS NOT NULL AND dt.RefreshRoles IS NOT NULL AND dt.IsSuperUser=0  AND ISNULL(Users.IsSuperUser, 0)=0
	
		INSERT INTO dbo.UserPortals (
				[UserId]
				,[PortalId]
				,[CreatedDate]
				,[Authorised]
				,[IsDeleted]
				,[RefreshRoles]
				,[VanityUrl])
				SELECT
				dt.[UserId]
				,dt.[PortalId]
				,getdate()
				,dt.[Authorised]
				,dt.[IsDeleted]
				,dt.[RefreshRoles]
				,dt.[VanityUrl]
		FROM #UP_InsertsDataTable dt
		DROP TABLE #UP_InsertsDataTable;

		----Update/Insert User Authentication
		IF @Overwrite = 1
		BEGIN
			SELECT   
					UserAuthentication.UserAuthenticationID
				,dt.AuthenticationType
				,dt.AuthenticationToken
				,dt.LastModifiedByUserId 				
			INTO #UserAuthenticationUpdatesDataTable 
			FROM @DataTable dt INNER JOIN dbo.Users Users ON Users.Username=dt.Username
			INNER JOIN dbo.UserPortals UP ON UP.UserId=Users.UserID AND UP.PortalId=dt.PortalId 
			INNER JOIN dbo.UserAuthentication UserAuthentication ON UserAuthentication.UserID=Users.UserID AND LTRIM(RTRIM(UserAuthentication.AuthenticationType)) = LTRIM(RTRIM(dt.AuthenticationType))
			WHERE Users.UserID IS NOT NULL AND UP.UserPortalId IS NOT NULL AND UP.PortalId=dt.PortalId AND UserAuthentication.UserAuthenticationID IS NOT NULL AND dt.AuthenticationToken IS NOT NULL AND dt.AuthenticationType IS NOT NULL AND dt.IsSuperUser=0 AND Users.IsSuperUser=0

			UPDATE UserAuthentication
			SET
				UserAuthentication.AuthenticationToken 	= dt.AuthenticationToken,
				UserAuthentication.LastModifiedByUserID = dt.LastModifiedByUserId,
				UserAuthentication.LastModifiedOnDate	= GETDATE()
			FROM dbo.UserAuthentication AS UserAuthentication
			INNER JOIN #UserAuthenticationUpdatesDataTable AS dt ON UserAuthentication.UserAuthenticationID=dt.UserAuthenticationID
		
			DROP TABLE #UserAuthenticationUpdatesDataTable;
		END

		--Insert new UserAuthentication
		SELECT
				Users.UserID   
			,dt.AuthenticationType
			,dt.AuthenticationToken
			,dt.CreatedByUserId
			,dt.LastModifiedByUserId 				
		INTO #UserAuthenticationInsertsDataTable 
		FROM @DataTable dt INNER JOIN dbo.Users Users ON Users.Username=dt.Username
		INNER JOIN dbo.UserPortals UP ON UP.UserId=Users.UserID AND UP.PortalId=dt.PortalId 
		LEFT JOIN dbo.UserAuthentication UserAuthentication ON UserAuthentication.UserID=Users.UserID AND LTRIM(RTRIM(UserAuthentication.AuthenticationType)) = LTRIM(RTRIM(dt.AuthenticationType))
		WHERE Users.UserID IS NOT NULL AND UP.UserPortalId IS NOT NULL AND UP.PortalId=dt.PortalId AND UserAuthentication.UserAuthenticationID IS NULL AND dt.IsSuperUser=0  AND ISNULL(Users.IsSuperUser, 0)=0
		AND dt.AuthenticationToken IS NOT NULL AND dt.AuthenticationType IS NOT NULL

		INSERT INTO dbo.[UserAuthentication](
			UserID
			,AuthenticationType
			,AuthenticationToken
			,CreatedByUserID
			,CreatedOnDate
			,LastModifiedByUserID
			,LastModifiedOnDate
			)
		SELECT
			dt.UserID,
			dt.AuthenticationType,
			dt.AuthenticationToken,
			dt.CreatedByUserId,
			GETDATE(),
			dt.LastModifiedByUserId,
			GETDATE()
		FROM
			#UserAuthenticationInsertsDataTable dt

		DROP TABLE #UserAuthenticationInsertsDataTable;

		--Update/Insert aspnet_Users 
		IF @Overwrite = 1
		BEGIN
			--Update aspnet_Users
			SELECT   
					AspUsers.UserId
				,dt.Username
				,dt.[ApplicationId]
				,dt.[MobileAlias]
				,dt.[IsAnonymous] 				
			INTO #AspNetUserUpdatesDataTable 
			FROM @DataTable dt INNER JOIN dbo.aspnet_Users AspUsers ON AspUsers.Username= dt.Username
			INNER JOIN dbo.Users Users ON Users.Username=dt.Username
			WHERE AspUsers.UserId IS NOT NULL AND dt.AspUserId <> @EmptyGuid AND dt.[IsAnonymous] IS NOT NULL AND dt.[ApplicationId] IS NOT NULL AND dt.IsSuperUser=0 AND Users.IsSuperUser=0

			UPDATE Users
			SET
				Users.UserName 					= dt.Username,
				Users.[LoweredUserName]			= LOWER(dt.Username),
				Users.[MobileAlias] 			= dt.[MobileAlias],
				Users.[IsAnonymous] 			= dt.[IsAnonymous],
				Users.[LastActivityDate] 		= GETUTCDATE()
			FROM dbo.aspnet_Users AS Users
			INNER JOIN #AspNetUserUpdatesDataTable AS dt
			ON Users.UserID=dt.UserID AND Users.ApplicationId=dt.[ApplicationId]

			DROP TABLE #AspNetUserUpdatesDataTable
		END
		--Insert aspnet_Users
		SELECT   	
				dt.Username
			,dt.[ApplicationId]
			,dt.[MobileAlias]
			,dt.[IsAnonymous] 				
				
		INTO #AspNetUserInsertsDataTable 
		FROM @DataTable dt 
		LEFT JOIN dbo.aspnet_Users AspUsers ON AspUsers.Username= dt.Username
		INNER JOIN dbo.Users Users ON Users.Username=dt.Username
		WHERE AspUsers.UserId IS NULL AND dt.AspUserId <> @EmptyGuid AND dt.[IsAnonymous] IS NOT NULL AND dt.[ApplicationId] IS NOT NULL AND dt.IsSuperUser=0  AND ISNULL(Users.IsSuperUser, 0)=0

		INSERT INTO dbo.[aspnet_Users]
				([ApplicationId]
				,[UserName]
				,[LoweredUserName]
				,[MobileAlias]
				,[IsAnonymous]
				,[LastActivityDate])
		SELECT
				dt.[ApplicationId]
				,dt.[Username]
				,LOWER(dt.[Username])
				,dt.[MobileAlias]
				,dt.[IsAnonymous]
				,GETUTCDATE()
		FROM #AspNetUserInsertsDataTable dt

		DROP TABLE #AspNetUserInsertsDataTable

		--Update/Insert aspnet_Membership
		IF @Overwrite = 1
		BEGIN
			--Update aspnet_Membership
			SELECT   
					dt.[ApplicationId]
				,AspUsers.UserId
				,dt.[Password]										
				,dt.[PasswordFormat]								
				,dt.[PasswordSalt]								
				,dt.[MobilePIN]										
				,dt.[Email]
				,dt.[PasswordQuestion]							
				,dt.[PasswordAnswer]							
				,dt.[IsApproved]							
				,dt.[IsLockedOut]								
				,dt.[FailedPasswordAttemptCount]			
				,dt.[FailedPasswordAnswerAttemptCount]		
				,dt.[Comment]								
			INTO #AspNetMembershipUpdatesDataTable 
			FROM @DataTable dt INNER JOIN dbo.aspnet_Users AspUsers ON AspUsers.Username= dt.Username
			INNER JOIN dbo.Users Users ON Users.Username=dt.Username
			INNER JOIN dbo.aspnet_Membership Membership ON Membership.UserId= AspUsers.UserID AND Membership.ApplicationId=AspUsers.ApplicationId
			WHERE AspUsers.UserId IS NOT NULL AND Membership.UserId IS NOT NULL AND dt.AspUserId <> @EmptyGuid AND dt.Password IS NOT NULL
			AND dt.[PasswordFormat] IS NOT NULL AND dt.[PasswordSalt] IS NOT NULL AND dt.[IsApproved] IS NOT NULL AND dt.[IsLockedOut] IS NOT NULL
			AND dt.[FailedPasswordAttemptCount] IS NOT NULL AND dt.[FailedPasswordAnswerAttemptCount] IS NOT NULL AND dt.IsSuperUser=0 AND Users.IsSuperUser=0

			UPDATE Membership
				SET
						[Password]							=dt.[Password]							
					,[PasswordFormat]					=dt.[PasswordFormat]					
					,[PasswordSalt] 					=dt.[PasswordSalt]						
					,[MobilePIN]						=dt.[MobilePIN]							
					,[Email]							=dt.[Email]
					,[PasswordQuestion]					=dt.[PasswordQuestion]					
					,[PasswordAnswer]					=dt.[PasswordAnswer]					
					,[IsApproved]						=dt.[IsApproved]						
					,[IsLockedOut]						=dt.[IsLockedOut]						
					,[FailedPasswordAttemptCount]		=dt.[FailedPasswordAttemptCount]		
					,[FailedPasswordAnswerAttemptCount]	=dt.[FailedPasswordAnswerAttemptCount]	
					,[Comment]							=dt.[Comment]							
			FROM dbo.aspnet_Membership AS Membership
			INNER JOIN #AspNetMembershipUpdatesDataTable AS dt ON Membership.UserId=dt.UserId AND Membership.[ApplicationId]=dt.[ApplicationId]

			DROP TABLE #AspNetMembershipUpdatesDataTable
		END
		--Insert aspnet_Membership
		SELECT   
				dt.[ApplicationId]
			,AspUsers.UserId
			,dt.[Password]										
			,dt.[PasswordFormat]								
			,dt.[PasswordSalt]								
			,dt.[MobilePIN]										
			,dt.[Email]
			,dt.[PasswordQuestion]							
			,dt.[PasswordAnswer]							
			,dt.[IsApproved]							
			,dt.[IsLockedOut]								
			,dt.[FailedPasswordAttemptCount]			
			,dt.[FailedPasswordAnswerAttemptCount]		
			,dt.[Comment]								
		INTO #AspNetMembershipInsertsDataTable 
		FROM @DataTable dt INNER JOIN dbo.aspnet_Users AspUsers ON AspUsers.Username= dt.Username
		INNER JOIN dbo.Users Users ON Users.Username=dt.Username
		LEFT JOIN dbo.aspnet_Membership Membership ON Membership.UserId= AspUsers.UserID AND Membership.ApplicationId=AspUsers.ApplicationId
		WHERE AspUsers.UserId IS NOT NULL AND Membership.UserId IS NULL AND dt.AspUserId <> @EmptyGuid AND dt.Password IS NOT NULL
		AND dt.[PasswordFormat] IS NOT NULL AND dt.[PasswordSalt] IS NOT NULL AND dt.[IsApproved] IS NOT NULL AND dt.[IsLockedOut] IS NOT NULL
		AND dt.[FailedPasswordAttemptCount] IS NOT NULL AND dt.[FailedPasswordAnswerAttemptCount] IS NOT NULL AND dt.IsSuperUser=0  AND ISNULL(Users.IsSuperUser, 0)=0

		INSERT INTO dbo.[aspnet_Membership]
				([ApplicationId]
				,[UserId]
				,[Password]
				,[PasswordFormat]
				,[PasswordSalt]
				,[MobilePIN]
				,[Email]
				,[LoweredEmail]
				,[PasswordQuestion]
				,[PasswordAnswer]
				,[IsApproved]
				,[IsLockedOut]
				,[CreateDate]
				,[LastLoginDate]
				,[LastPasswordChangedDate]
				,[LastLockoutDate]
				,[FailedPasswordAttemptCount]
				,[FailedPasswordAttemptWindowStart]
				,[FailedPasswordAnswerAttemptCount]
				,[FailedPasswordAnswerAttemptWindowStart]
				,[Comment])
		SELECT 
				dt.[ApplicationId]
				,dt.[UserId]
				,dt.[Password]
				,dt.[PasswordFormat]
				,dt.[PasswordSalt]
				,dt.[MobilePIN]
				,dt.[Email]
				,LOWER(dt.[Email])
				,dt.[PasswordQuestion]
				,dt.[PasswordAnswer]
				,dt.[IsApproved]
				,dt.[IsLockedOut]
				,GETUTCDATE()
				,@MinDate
				,@MinDate
				,@MinDate
				,dt.[FailedPasswordAttemptCount]
				,@MinDate
				,dt.[FailedPasswordAnswerAttemptCount]
				,@MinDate
				,dt.[Comment]
		FROM #AspNetMembershipInsertsDataTable dt
		DROP TABLE #AspNetMembershipInsertsDataTable

	COMMIT TRANSACTION [UsersInsert]

END
GO
