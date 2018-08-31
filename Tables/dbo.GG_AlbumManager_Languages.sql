CREATE TABLE [dbo].[GG_AlbumManager_Languages]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[AlbumManagerId] [int] NOT NULL,
[CultureCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_AlbumManager_Languages] ADD CONSTRAINT [PK_GG_AlbumManager_Languages] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
