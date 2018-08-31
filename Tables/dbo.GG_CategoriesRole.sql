CREATE TABLE [dbo].[GG_CategoriesRole]
(
[CategoryId] [int] NOT NULL,
[RoleId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[IsView] [bit] NULL,
[IsEdit] [bit] NULL,
[IsDeleted] [bit] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_CategoriesRole] ADD CONSTRAINT [PK_GG_CategoriesRole] PRIMARY KEY CLUSTERED  ([CategoryId], [RoleId]) ON [PRIMARY]
GO
