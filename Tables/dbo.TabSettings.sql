CREATE TABLE [dbo].[TabSettings]
(
[TabID] [int] NOT NULL,
[SettingName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SettingValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabSettings] ADD CONSTRAINT [PK_TabSettings] PRIMARY KEY NONCLUSTERED  ([TabID], [SettingName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabSettings] WITH NOCHECK ADD CONSTRAINT [FK_TabSettings_Tabs] FOREIGN KEY ([TabID]) REFERENCES [dbo].[Tabs] ([TabID]) ON DELETE CASCADE
GO
