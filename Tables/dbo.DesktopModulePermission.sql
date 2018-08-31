CREATE TABLE [dbo].[DesktopModulePermission]
(
[DesktopModulePermissionID] [int] NOT NULL IDENTITY(1, 1),
[PortalDesktopModuleID] [int] NOT NULL,
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
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [PK_DesktopModulePermission] PRIMARY KEY CLUSTERED  ([DesktopModulePermissionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DesktopModulePermission] WITH NOCHECK ADD CONSTRAINT [FK_DesktopModulePermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [FK_DesktopModulePermission_PortalDesktopModules] FOREIGN KEY ([PortalDesktopModuleID]) REFERENCES [dbo].[PortalDesktopModules] ([PortalDesktopModuleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [FK_DesktopModulePermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [FK_DesktopModulePermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
