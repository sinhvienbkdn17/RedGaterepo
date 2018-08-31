CREATE TABLE [dbo].[UsersOnline]
(
[UserID] [int] NOT NULL,
[PortalID] [int] NOT NULL,
[TabID] [int] NOT NULL,
[CreationDate] [datetime] NOT NULL CONSTRAINT [DF__UsersOnli__Creat__247D636F] DEFAULT (getdate()),
[LastActiveDate] [datetime] NOT NULL CONSTRAINT [DF__UsersOnli__LastA__257187A8] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersOnline] ADD CONSTRAINT [PK_UsersOnline] PRIMARY KEY CLUSTERED  ([UserID], [PortalID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersOnline] ADD CONSTRAINT [FK_UsersOnline_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersOnline] ADD CONSTRAINT [FK_UsersOnline_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
