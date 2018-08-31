CREATE TABLE [dbo].[GG_ArticleCategory_Version]
(
[ArticleCateVersionId] [int] NOT NULL IDENTITY(1, 1),
[ArticleVersionId] [int] NOT NULL,
[CategoryId] [int] NOT NULL,
[ArticleId] [int] NULL,
[PortalId] [int] NOT NULL,
[Version] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleCategory_Version] ADD CONSTRAINT [PK_GG_ArticleCategory_Version] PRIMARY KEY CLUSTERED  ([ArticleCateVersionId], [ArticleVersionId], [CategoryId]) ON [PRIMARY]
GO
