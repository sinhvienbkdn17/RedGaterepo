CREATE TABLE [dbo].[TabPermission]
(
[TabPermissionID] [int] NOT NULL IDENTITY(1, 1),
[TabID] [int] NOT NULL,
[PermissionID] [int] NOT NULL,
[AllowAccess] [bit] NOT NULL,
[RoleID] [int] NULL,
[UserID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabPermission] ADD CONSTRAINT [PK_TabPermission] PRIMARY KEY CLUSTERED  ([TabPermissionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabPermission] WITH NOCHECK ADD CONSTRAINT [FK_TabPermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabPermission] ADD CONSTRAINT [FK_TabPermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[TabPermission] WITH NOCHECK ADD CONSTRAINT [FK_TabPermission_Tabs] FOREIGN KEY ([TabID]) REFERENCES [dbo].[Tabs] ([TabID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabPermission] ADD CONSTRAINT [FK_TabPermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
