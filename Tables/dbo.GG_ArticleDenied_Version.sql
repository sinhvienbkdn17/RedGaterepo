CREATE TABLE [dbo].[GG_ArticleDenied_Version]
(
[ArticleDeniedVersionId] [int] NOT NULL IDENTITY(1, 1),
[ArticleDeniedId] [int] NOT NULL,
[ArticleVersionId] [int] NOT NULL,
[ArticleId] [int] NULL,
[PortalId] [int] NULL,
[Reason] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedByUserId] [int] NULL,
[CreatedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleDenied_Version] ADD CONSTRAINT [PK_GG_ArticleDenied_Version] PRIMARY KEY CLUSTERED  ([ArticleDeniedVersionId], [ArticleDeniedId], [ArticleVersionId]) ON [PRIMARY]
GO
