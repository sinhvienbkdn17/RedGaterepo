CREATE TABLE [dbo].[GG_CategoriesLanguage]
(
[CategoryLanguageId] [int] NOT NULL IDENTITY(1, 1),
[CategoryId] [int] NOT NULL,
[PortalId] [int] NULL,
[Alias] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LimitName] [int] NULL,
[Name] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Summary] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_CategoriesLanguage] ADD CONSTRAINT [PK_GG_CategoriesLanguage] PRIMARY KEY CLUSTERED  ([CategoryLanguageId]) ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [dbo].[GG_CategoriesLanguage] KEY INDEX [PK_GG_CategoriesLanguage] ON [fulltext_category] WITH CHANGE_TRACKING MANUAL
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_CategoriesLanguage] ADD ([Alias] LANGUAGE 1033)
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_CategoriesLanguage] ADD ([Name] LANGUAGE 1066)
GO
