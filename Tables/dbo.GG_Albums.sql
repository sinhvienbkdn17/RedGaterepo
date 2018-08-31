CREATE TABLE [dbo].[GG_Albums]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[AlbumManagerId] [int] NOT NULL,
[ImagesUrl] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Size] [float] NULL,
[Type] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dimensions] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NULL CONSTRAINT [DF_GG_Albums_IsActive] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Albums] ADD CONSTRAINT [PK_GG_Albums] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
