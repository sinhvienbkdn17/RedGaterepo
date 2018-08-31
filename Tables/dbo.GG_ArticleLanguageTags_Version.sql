CREATE TABLE [dbo].[GG_ArticleLanguageTags_Version]
(
[TagVersionId] [int] NOT NULL IDENTITY(1, 1),
[TagId] [int] NOT NULL,
[ArticleLanguageVersionId] [int] NOT NULL,
[ArticleLanguageId] [int] NULL,
[PortalId] [int] NOT NULL,
[Version] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleLanguageTags_Version] ADD CONSTRAINT [PK_GG_Article_Tags_Version] PRIMARY KEY CLUSTERED  ([TagVersionId], [TagId], [ArticleLanguageVersionId]) ON [PRIMARY]
GO
