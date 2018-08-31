CREATE TABLE [dbo].[GG_DocumentLogAction]
(
[LogActionId] [int] NOT NULL,
[DocumentId] [int] NOT NULL,
[PortalId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_DocumentLogAction] ADD CONSTRAINT [PK_GG_DocumentLogAction] PRIMARY KEY CLUSTERED  ([LogActionId], [DocumentId]) ON [PRIMARY]
GO
