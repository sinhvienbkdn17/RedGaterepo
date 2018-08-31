CREATE TABLE [dbo].[GG_ArticleDenied]
(
[ArticleDeniedId] [int] NOT NULL IDENTITY(1, 1),
[ArticleId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[Reason] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleDenied] ADD CONSTRAINT [PK_GG_ArticleDenied] PRIMARY KEY CLUSTERED  ([ArticleDeniedId]) ON [PRIMARY]
GO
