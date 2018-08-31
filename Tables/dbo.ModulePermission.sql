CREATE TABLE [dbo].[ModulePermission]
(
[ModulePermissionID] [int] NOT NULL IDENTITY(1, 1),
[ModuleID] [int] NOT NULL,
[PermissionID] [int] NOT NULL,
[AllowAccess] [bit] NOT NULL,
[RoleID] [int] NULL,
[UserID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[PortalID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModulePermission] ADD CONSTRAINT [PK_ModulePermission] PRIMARY KEY CLUSTERED  ([ModulePermissionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModulePermission] WITH NOCHECK ADD CONSTRAINT [FK_ModulePermission_Modules] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Modules] ([ModuleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] WITH NOCHECK ADD CONSTRAINT [FK_ModulePermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] ADD CONSTRAINT [FK_ModulePermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[ModulePermission] ADD CONSTRAINT [FK_ModulePermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
