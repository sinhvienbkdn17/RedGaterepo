CREATE TABLE [dbo].[GG_QuestionLanguage]
(
[QuestionLanguageId] [int] NOT NULL IDENTITY(1, 1),
[QuestionId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[Alias] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LimitTitle] [int] NULL,
[Content] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Language] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_QuestionLanguage] ADD CONSTRAINT [PK_GG_QuestionLanguage] PRIMARY KEY CLUSTERED  ([QuestionLanguageId]) ON [PRIMARY]
GO
