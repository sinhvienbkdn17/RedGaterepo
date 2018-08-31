CREATE TABLE [dbo].[FolderPermission]
(
[FolderPermissionID] [int] NOT NULL IDENTITY(1, 1),
[FolderID] [int] NOT NULL,
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
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [PK_FolderPermission] PRIMARY KEY CLUSTERED  ([FolderPermissionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [FK_FolderPermission_Folders] FOREIGN KEY ([FolderID]) REFERENCES [dbo].[Folders] ([FolderID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderPermission] WITH NOCHECK ADD CONSTRAINT [FK_FolderPermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [FK_FolderPermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [FK_FolderPermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
