CREATE TABLE [dbo].[GG_Banner_Settings]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ModuleId] [int] NOT NULL,
[SettingName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SettingValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Banner_Settings] ADD CONSTRAINT [PK_GG_Banner_Settings] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
