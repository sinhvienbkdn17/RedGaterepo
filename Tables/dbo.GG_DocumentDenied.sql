CREATE TABLE [dbo].[GG_DocumentDenied]
(
[DocumentDeniedId] [int] NOT NULL IDENTITY(1, 1),
[DocumentId] [int] NOT NULL,
[PortalId] [int] NULL,
[Reason] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_DocumentDenied] ADD CONSTRAINT [PK_GG_DocumentDenied] PRIMARY KEY CLUSTERED  ([DocumentDeniedId]) ON [PRIMARY]
GO
