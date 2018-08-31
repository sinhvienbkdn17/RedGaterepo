CREATE TABLE [dbo].[GG_Categories]
(
[CategoryId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[ParentId] [int] NULL,
[IsActive] [bit] NULL,
[IsShare] [bit] NULL,
[IsDeleted] [bit] NULL,
[OrderNumber] [int] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Categories] ADD CONSTRAINT [PK_GG_Category] PRIMARY KEY CLUSTERED  ([CategoryId]) ON [PRIMARY]
GO
