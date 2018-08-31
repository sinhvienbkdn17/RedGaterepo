CREATE TABLE [dbo].[GG_Document]
(
[DocumentId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[CoverImage] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PublishAt] [datetime] NULL,
[ExpireAt] [datetime] NULL,
[SizeImage] [int] NULL,
[Thumbnail] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [int] NULL,
[IsHotNews] [bit] NULL,
[IsDeleted] [bit] NULL,
[View] [int] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Document] ADD CONSTRAINT [PK_GG_Document] PRIMARY KEY CLUSTERED  ([DocumentId]) ON [PRIMARY]
GO
