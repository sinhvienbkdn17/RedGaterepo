CREATE TABLE [dbo].[GG_Document_FilterDocument]
(
[DocumentId] [int] NOT NULL,
[FilterDocumentId] [int] NOT NULL,
[PortalId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Document_FilterDocument] ADD CONSTRAINT [PK_GG_Document_FilterDocument] PRIMARY KEY CLUSTERED  ([DocumentId], [FilterDocumentId]) ON [PRIMARY]
GO
