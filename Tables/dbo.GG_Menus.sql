CREATE TABLE [dbo].[GG_Menus]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModuleId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_GG_Menus_IsDeleted] DEFAULT ((0)),
[Style] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Menus] ADD CONSTRAINT [PK_GG_Menus] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
