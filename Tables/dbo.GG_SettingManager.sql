CREATE TABLE [dbo].[GG_SettingManager]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Phone] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Facebook] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_GG_SettingManager_IsDeleted] DEFAULT ((0)),
[PortalId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NULL,
[LastModifiedByUserId] [int] NULL,
[Url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_SettingManager] ADD CONSTRAINT [PK_GG_SettingManager] PRIMARY KEY CLUSTERED  ([Id] DESC) ON [PRIMARY]
GO
