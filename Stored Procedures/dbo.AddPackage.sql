SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPackage]
	@PortalID			int,
	@Name			    nvarchar(128),
	@FriendlyName	    nvarchar(250),
	@Description	    nvarchar(2000),
	@PackageType	    nvarchar(50),
	@Version		    nvarchar(50),
	@License		    ntext,
	@Manifest		    ntext,
	@Owner				nvarchar(100),
	@Organization		nvarchar(100),
	@Url				nvarchar(250),
	@Email				nvarchar(100),
	@ReleaseNotes	    ntext,
	@IsSystemPackage    bit,
	@CreatedByUserID	int,
	@FolderName			nvarchar(127),
	@IconFile			nvarchar(100)
AS
	INSERT INTO dbo.Packages
	(
		PortalID,
		[Name],
		FriendlyName,
		[Description],
		PackageType,
		Version,
		License,
		Manifest,
		ReleaseNotes,
		[Owner],
		Organization,
		Url,
		Email,
		IsSystemPackage,
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate],
		FolderName,
		IconFile
	)
	VALUES (
		@PortalID,
		@Name,
		@FriendlyName,
		@Description,
		@PackageType,
		@Version,
		@License,
		@Manifest,
		@ReleaseNotes,
		@Owner,
		@Organization,
		@Url,
		@Email,
		@IsSystemPackage,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate(),
		@FolderName,
		@IconFile
	)
	SELECT SCOPE_IDENTITY()
GO
