CREATE TABLE [dbo].[GG_ArticleImage_Article_Version]
(
[ArticleImageArticeVersionId] [int] NOT NULL IDENTITY(1, 1),
[ArticleVersionId] [int] NOT NULL,
[ImageVersionId] [int] NULL,
[ImageId] [int] NOT NULL,
[ArticleId] [int] NULL,
[PortalId] [int] NOT NULL,
[Version] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleImage_Article_Version] ADD CONSTRAINT [PK_GG_ArticleImage_Article_Version_1] PRIMARY KEY CLUSTERED  ([ArticleImageArticeVersionId], [ArticleVersionId]) ON [PRIMARY]
GO
