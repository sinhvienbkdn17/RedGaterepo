CREATE TABLE [dbo].[GG_DocumentLanguage]
(
[DocumentLanguageId] [int] NOT NULL IDENTITY(1, 1),
[DocumentId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[Path] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Extension] [nchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Size] [int] NOT NULL,
[Alias] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LimitTitle] [int] NOT NULL,
[Description] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_DocumentLanguage] ADD CONSTRAINT [PK_GG_DocumentLanguage] PRIMARY KEY CLUSTERED  ([DocumentLanguageId]) ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [dbo].[GG_DocumentLanguage] KEY INDEX [PK_GG_DocumentLanguage] ON [fulltext_document] WITH CHANGE_TRACKING MANUAL
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_DocumentLanguage] ADD ([Alias] LANGUAGE 1033)
GO
ALTER FULLTEXT INDEX ON [dbo].[GG_DocumentLanguage] ADD ([Title] LANGUAGE 1066)
GO
