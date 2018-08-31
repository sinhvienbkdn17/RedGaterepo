CREATE TABLE [dbo].[GG_VideoNews]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[CategoryId] [int] NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LimitVideo] [int] NULL,
[ModuleId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[Style] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_VideoNews] ADD CONSTRAINT [PK_GG_VideoNews] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
