CREATE TABLE [dbo].[GG_Article]
(
[ArticleId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[CoverImageUrl] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PublishAt] [datetime] NULL,
[EventDay] [datetime] NULL,
[ExpireAt] [datetime] NULL,
[Status] [int] NOT NULL,
[ArticleTypeId] [int] NOT NULL,
[IsHotNew] [bit] NULL,
[IsAllowComment] [bit] NULL,
[IsDeleted] [bit] NULL,
[View] [int] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[ArticleOldId] [int] NULL,
[CateOldId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Article] ADD CONSTRAINT [PK_GG_Article] PRIMARY KEY CLUSTERED  ([ArticleId]) ON [PRIMARY]
GO
