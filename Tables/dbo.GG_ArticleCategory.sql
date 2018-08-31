CREATE TABLE [dbo].[GG_ArticleCategory]
(
[ArticleId] [int] NOT NULL,
[CategoryId] [int] NOT NULL,
[PortalId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleCategory] ADD CONSTRAINT [PK_GG_ArticleCategory] PRIMARY KEY CLUSTERED  ([ArticleId], [CategoryId]) ON [PRIMARY]
GO
