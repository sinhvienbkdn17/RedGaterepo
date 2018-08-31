CREATE TABLE [dbo].[GG_AlbumManager_Module]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ModuleId] [int] NOT NULL,
[AlbumManagerId] [int] NOT NULL,
[OrderBy] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_AlbumManager_Module] ADD CONSTRAINT [PK_GG_AlbumManager_Module] PRIMARY KEY CLUSTERED  ([Id] DESC) ON [PRIMARY]
GO
