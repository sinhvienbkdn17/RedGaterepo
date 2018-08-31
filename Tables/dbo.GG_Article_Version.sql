CREATE TABLE [dbo].[GG_Article_Version]
(
[ArticleVersionId] [int] NOT NULL IDENTITY(1, 1),
[ArticleId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[CoverImageUrl] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PublishAt] [datetime] NULL,
[EventDay] [datetime] NULL,
[ExpireAt] [datetime] NULL,
[Status] [int] NOT NULL,
[ArticleTypeId] [int] NOT NULL,
[IsEvent] [bit] NULL,
[IsHotNew] [bit] NULL,
[IsAllowComment] [bit] NULL,
[IsDeleted] [bit] NULL,
[View] [int] NULL,
[Version] [int] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Article_Version] ADD CONSTRAINT [PK_GG_ArticleVersion] PRIMARY KEY CLUSTERED  ([ArticleVersionId]) ON [PRIMARY]
GO
