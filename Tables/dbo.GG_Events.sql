CREATE TABLE [dbo].[GG_Events]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Link] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PublishDate] [datetime] NOT NULL,
[ModuleId] [int] NOT NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_GG_Events_IsDeleted] DEFAULT ((0)),
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Events] ADD CONSTRAINT [PK_GG_Events] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
