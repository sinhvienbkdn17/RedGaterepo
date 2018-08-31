SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabModule]
    @TabModuleId            int,
    @TabId					int,
    @ModuleId				int,
	@ModuleTitle			nvarchar(256),
	@Header					ntext,
	@Footer					ntext,
    @ModuleOrder			int,
    @PaneName				nvarchar(50),
    @CacheTime				int,
    @CacheMethod			varchar(50),
    @Alignment				nvarchar(10),
    @Color					nvarchar(20),
    @Border					nvarchar(1),
    @IconFile				nvarchar(100),
    @Visibility				int,
    @ContainerSrc			nvarchar(200),
    @DisplayTitle			bit,
    @DisplayPrint			bit,
    @DisplaySyndicate		bit,
    @IsWebSlice				bit,
    @WebSliceTitle			nvarchar(256),
    @WebSliceExpiryDate		datetime,
    @WebSliceTTL			int,
    @VersionGuid			uniqueidentifier,
    @DefaultLanguageGuid	uniqueidentifier,
    @LocalizedVersionGuid	uniqueidentifier,
    @CultureCode			nvarchar(10),
    @LastModifiedByUserID	int

AS
    UPDATE dbo.TabModules
        SET    
            TabId = @TabId,
            ModuleId = @ModuleId,
			ModuleTitle = @ModuleTitle,
			Header = @Header,
			Footer = @Footer, 
            ModuleOrder = @ModuleOrder,
            PaneName = @PaneName,
            CacheTime = @CacheTime,
            CacheMethod = @CacheMethod,
            Alignment = @Alignment,
            Color = @Color,
            Border = @Border,
            IconFile = @IconFile,
            Visibility = @Visibility,
            ContainerSrc = @ContainerSrc,
            DisplayTitle = @DisplayTitle,
            DisplayPrint = @DisplayPrint,
            DisplaySyndicate = @DisplaySyndicate,
            IsWebSlice = @IsWebSlice,
            WebSliceTitle = @WebSliceTitle,
            WebSliceExpiryDate = @WebSliceExpiryDate,
            WebSliceTTL = @WebSliceTTL,
            VersionGuid = @VersionGuid,
            DefaultLanguageGuid = @DefaultLanguageGuid,
            LocalizedVersionGuid = @LocalizedVersionGuid,
            CultureCode= @CultureCode,
            LastModifiedByUserID = @LastModifiedByUserID,
            LastModifiedOnDate = getdate()
        WHERE  TabModuleId = @TabModuleId
GO
