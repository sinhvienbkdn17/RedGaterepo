CREATE TABLE [dbo].[GG_MenuItems]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Title] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MenuTypeId] [int] NOT NULL,
[MenuId] [int] NOT NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_GG_Menu_IsDeleted] DEFAULT ((0)),
[Link] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TabId] [int] NULL,
[ImageURL] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [int] NULL,
[IsOpenNewTab] [bit] NOT NULL CONSTRAINT [DF_GG_MenuItems_IsOpenNewTab] DEFAULT ((0)),
[Position] [int] NULL,
[CssClass] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDisplayName] [bit] NOT NULL CONSTRAINT [DF_GG_MenuItems_IsDisplayName] DEFAULT ((1)),
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_MenuItems] ADD CONSTRAINT [PK_GG_Menu] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
