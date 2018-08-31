CREATE TABLE [dbo].[GG_ArticleImage_Version]
(
[ImageVersionId] [int] NOT NULL IDENTITY(1, 1),
[ImageId] [int] NULL,
[PortalId] [int] NOT NULL,
[Path] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDisplay] [bit] NULL,
[IsDeleted] [bit] NULL,
[OrderNumber] [int] NULL,
[CreatedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[Version] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleImage_Version] ADD CONSTRAINT [PK_GG_ArticleImage_Version_1] PRIMARY KEY CLUSTERED  ([ImageVersionId]) ON [PRIMARY]
GO
