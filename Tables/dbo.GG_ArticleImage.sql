CREATE TABLE [dbo].[GG_ArticleImage]
(
[ImageId] [int] NOT NULL IDENTITY(1, 1),
[Path] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PortalId] [int] NOT NULL,
[IsDisplay] [bit] NULL,
[IsDeleted] [bit] NULL,
[OrderNumber] [int] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleImage] ADD CONSTRAINT [PK_GG_ArticleImage] PRIMARY KEY CLUSTERED  ([ImageId]) ON [PRIMARY]
GO
