CREATE TABLE [dbo].[GG_ArticleLanguage]
(
[ArticleLanguageId] [int] NOT NULL IDENTITY(1, 1),
[ArticleId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[Alias] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LimitTitle] [int] NULL,
[LimitSummary] [int] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubTitle] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Summary] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkVideo] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Content] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ArticleDetailOldId] [int] NULL,
[CateOldId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleLanguage] ADD CONSTRAINT [PK_GG_ArticleLanguage] PRIMARY KEY CLUSTERED  ([ArticleLanguageId]) ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [dbo].[GG_ArticleLanguage] KEY INDEX [PK_GG_ArticleLanguage] ON [fulltext_article] WITH CHANGE_TRACKING MANUAL
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_ArticleLanguage] ADD ([Alias] LANGUAGE 1033)
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_ArticleLanguage] ADD ([Title] LANGUAGE 1066)
GO
