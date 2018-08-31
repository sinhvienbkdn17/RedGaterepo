CREATE TABLE [dbo].[GG_ArticleLanguageTags]
(
[TagId] [int] NOT NULL,
[ArticleLanguageId] [int] NOT NULL,
[PortalId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleLanguageTags] ADD CONSTRAINT [PK_GG_Article_Tags] PRIMARY KEY CLUSTERED  ([TagId], [ArticleLanguageId]) ON [PRIMARY]
GO
