CREATE TABLE [dbo].[GG_Banner]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImageUrl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Size] [float] NULL,
[Type] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dimensions] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModuleId] [int] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NULL,
[TargetLink] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_GG_Banner_TargetLink] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Banner] ADD CONSTRAINT [PK_GG_Banner] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
