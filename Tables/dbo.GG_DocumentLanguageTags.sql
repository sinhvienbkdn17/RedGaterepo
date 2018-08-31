CREATE TABLE [dbo].[GG_DocumentLanguageTags]
(
[TagId] [int] NOT NULL,
[DocumentLanguageId] [int] NOT NULL,
[PortalId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_DocumentLanguageTags] ADD CONSTRAINT [PK_GG_DocumentLanguageTags] PRIMARY KEY CLUSTERED  ([TagId], [DocumentLanguageId]) ON [PRIMARY]
GO
