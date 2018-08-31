CREATE TABLE [dbo].[GG_FilterDocumentLanguage]
(
[FilterDocumentLanguageId] [int] NOT NULL IDENTITY(1, 1),
[FilterDocumentId] [int] NULL,
[PortalId] [int] NULL,
[Alias] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_FilterDocumentLanguage] ADD CONSTRAINT [PK_GG_FilterDocumentLanguage] PRIMARY KEY CLUSTERED  ([FilterDocumentLanguageId]) ON [PRIMARY]
GO
