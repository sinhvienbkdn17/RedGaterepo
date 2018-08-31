CREATE TABLE [dbo].[GG_FilterQuestionLanguage]
(
[FilterQuestionLanguageId] [int] NOT NULL IDENTITY(1, 1),
[FilterQuestionId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[Alias] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Language] [nchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_FilterQuestionLanguage] ADD CONSTRAINT [PK_GG_FilterQuestionLanguage] PRIMARY KEY CLUSTERED  ([FilterQuestionLanguageId]) ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [dbo].[GG_FilterQuestionLanguage] KEY INDEX [PK_GG_FilterQuestionLanguage] ON [fulltext_question] WITH CHANGE_TRACKING MANUAL
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_FilterQuestionLanguage] ADD ([Alias] LANGUAGE 1033)
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_FilterQuestionLanguage] ADD ([Name] LANGUAGE 1066)
GO
