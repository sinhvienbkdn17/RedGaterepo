CREATE TABLE [dbo].[GG_ArticleLogAction_Version]
(
[ArticleLogActionVersionId] [int] NOT NULL IDENTITY(1, 1),
[LogActionVersionId] [int] NOT NULL,
[ArticleVersionId] [int] NOT NULL,
[ArticleId] [int] NULL,
[PortalId] [int] NULL,
[Version] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleLogAction_Version] ADD CONSTRAINT [PK_GG_ArticleLogAction_Version] PRIMARY KEY CLUSTERED  ([ArticleLogActionVersionId], [LogActionVersionId], [ArticleVersionId]) ON [PRIMARY]
GO
