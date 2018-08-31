CREATE TABLE [dbo].[GG_FilterDocument]
(
[FilterDocumentId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[IsDelete] [bit] NULL,
[IsActive] [bit] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_FilterDocument] ADD CONSTRAINT [PK_GG_FilterDocument] PRIMARY KEY CLUSTERED  ([FilterDocumentId]) ON [PRIMARY]
GO
