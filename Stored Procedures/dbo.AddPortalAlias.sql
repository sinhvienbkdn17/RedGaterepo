SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddPortalAlias]
	@PortalID 			int,
	@HTTPAlias 			nvarchar(200),
	@CultureCode		nvarchar(10),
	@Skin				nvarchar(100),
	@BrowserType		nvarchar(10),
	@IsPrimary			bit,
	@CreatedByUserID	int

AS

	IF @IsPrimary = 1
		BEGIN
			UPDATE dbo.PortalAlias
				SET IsPrimary = 0
				WHERE (CultureCode = @CultureCode OR (CultureCode IS NULL AND @CultureCode IS NULL))
					AND (BrowserType = @BrowserType OR (BrowserType IS NULL AND @BrowserType IS NULL))
					AND (PortalID = @PortalID)
		END

	INSERT INTO dbo.PortalAlias (
		PortalID, 
		HTTPAlias,
		CultureCode,
		BrowserTYpe,
		Skin,
		IsPrimary,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	)
	VALUES (
		@PortalID, 
		@HTTPAlias,
		@CultureCode,
		@BrowserTYpe,
		@Skin,
		@IsPrimary,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()
	 )

	SELECT SCOPE_IDENTITY()
GO
