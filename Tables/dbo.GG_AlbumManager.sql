CREATE TABLE [dbo].[GG_AlbumManager]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_GG_AlbumManager_IsDeleted] DEFAULT ((0)),
[IsDisplay] [bit] NOT NULL CONSTRAINT [DF_GG_AlbumManager_IsDisplay] DEFAULT ((1)),
[PortalId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_AlbumManager] ADD CONSTRAINT [PK_GG_AlbumManager] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
