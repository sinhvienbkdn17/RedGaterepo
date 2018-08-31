CREATE TABLE [dbo].[GG_ArticleImage_Article]
(
[ArticleId] [int] NOT NULL,
[ImageId] [int] NOT NULL,
[PortalId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleImage_Article] ADD CONSTRAINT [PK_GG_ArticleImage_Article] PRIMARY KEY CLUSTERED  ([ArticleId], [ImageId]) ON [PRIMARY]
GO
