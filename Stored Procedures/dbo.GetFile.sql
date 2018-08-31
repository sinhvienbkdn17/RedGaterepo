SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFile]
    @FileName nvarchar(246),
    @FolderID int,
    @RetrieveUnpublishedFiles bit = 0
AS
BEGIN
    IF @RetrieveUnpublishedFiles = 0 BEGIN
        SELECT FileId,
               PortalId,
               [FileName],
               Extension,
               Size,
               Width,
               Height,
               ContentType,
               FolderID,
               Folder,
               StorageLocation,
               IsCached,
               UniqueId,
               VersionGuid,       
               SHA1Hash,
               FolderMappingID,
               LastModificationTime,
               Title,
               Description,
               EnablePublishPeriod,
               StartDate,
               EndDate,
               CreatedByUserID,
               CreatedOnDate,
               LastModifiedByUserID,
               LastModifiedOnDate,
               ContentItemID,
               PublishedVersion,
               HasBeenPublished
        FROM dbo.[vw_PublishedFiles]             
        WHERE [FileName] = @FileName AND FolderID = @FolderID
    END
    ELSE BEGIN
        SELECT FileId,
               PortalId,
               [FileName],
               Extension,
               Size,
               Width,
               Height,
               ContentType,
               FolderID,
               Folder,
               StorageLocation,
               IsCached,
               UniqueId,
               VersionGuid,       
               SHA1Hash,
               FolderMappingID,
               LastModificationTime,
               Title,
               Description,
               EnablePublishPeriod,
               StartDate,
               EndDate,
               CreatedByUserID,
               CreatedOnDate,
               LastModifiedByUserID,
               LastModifiedOnDate,
               ContentItemID,
               PublishedVersion,
               HasBeenPublished
        FROM dbo.[vw_Files]
        WHERE [FileName] = @FileName AND FolderID = @FolderID
    END
END
GO
