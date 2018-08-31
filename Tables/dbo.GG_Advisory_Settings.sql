CREATE TABLE [dbo].[GG_Advisory_Settings]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ModuleId] [int] NOT NULL,
[SettingName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SettingValue] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Advisory_Settings] ADD CONSTRAINT [PK_GG_Advisory_Settings] PRIMARY KEY CLUSTERED  ([Id] DESC) ON [PRIMARY]
GO
