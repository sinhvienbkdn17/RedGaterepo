CREATE TABLE [dbo].[ModuleDefinitions]
(
[ModuleDefID] [int] NOT NULL IDENTITY(1, 1),
[FriendlyName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DesktopModuleID] [int] NOT NULL,
[DefaultCacheTime] [int] NOT NULL CONSTRAINT [DF_ModuleDefinitions_DefaultCacheTime] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[DefinitionName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModuleDefinitions] ADD CONSTRAINT [PK_ModuleDefinitions] PRIMARY KEY CLUSTERED  ([ModuleDefID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModuleDefinitions] WITH NOCHECK ADD CONSTRAINT [FK_ModuleDefinitions_DesktopModules] FOREIGN KEY ([DesktopModuleID]) REFERENCES [dbo].[DesktopModules] ([DesktopModuleID]) ON DELETE CASCADE
GO
