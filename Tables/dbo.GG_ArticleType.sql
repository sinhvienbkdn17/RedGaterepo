CREATE TABLE [dbo].[GG_ArticleType]
(
[ArticleTypeId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[Name] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsSlideImage] [bit] NULL,
[IsVideo] [bit] NULL,
[IsEvent] [bit] NULL,
[IsActive] [bit] NULL,
[IsDeleted] [bit] NULL,
[OrderNumber] [int] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_ArticleType] ADD CONSTRAINT [PK_GG_ArticleType] PRIMARY KEY CLUSTERED  ([ArticleTypeId]) ON [PRIMARY]
GO
