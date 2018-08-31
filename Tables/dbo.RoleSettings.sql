CREATE TABLE [dbo].[RoleSettings]
(
[RoleSettingID] [int] NOT NULL IDENTITY(1, 1),
[RoleID] [int] NOT NULL,
[SettingName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SettingValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RoleSettings_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RoleSettings_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoleSettings] ADD CONSTRAINT [PK_RoleSettings] PRIMARY KEY CLUSTERED  ([RoleSettingID]) ON [PRIMARY]
GO
