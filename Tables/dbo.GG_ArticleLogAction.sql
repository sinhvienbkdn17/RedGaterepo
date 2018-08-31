CREATE TABLE [dbo].[GG_ArticleLogAction]
(
[LogActionId] [int] NOT NULL,
[ArticleId] [int] NOT NULL,
[PortalId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleLogAction] ADD CONSTRAINT [PK_GG_LogAction_Article] PRIMARY KEY CLUSTERED  ([LogActionId], [ArticleId]) ON [PRIMARY]
GO
