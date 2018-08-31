CREATE TABLE [dbo].[GG_ArticleLanguage_Version]
(
[ArticleLanguageVersionId] [int] NOT NULL IDENTITY(1, 1),
[ArticleLanguageId] [int] NOT NULL,
[ArticleVersionId] [int] NOT NULL,
[ArticleId] [int] NULL,
[PortalId] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Language] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Content] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LinkVideo] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Summary] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubTitle] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LimitTitle] [int] NULL,
[LimitSummary] [int] NULL,
[Title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Alias] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Version] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleLanguage_Version] ADD CONSTRAINT [PK_GG_ArticleLanguage_Version] PRIMARY KEY CLUSTERED  ([ArticleLanguageVersionId]) ON [PRIMARY]
GO
