CREATE TABLE [dbo].[GG_MenuTypes]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_MenuTypes] ADD CONSTRAINT [PK_GG_MenuTypes] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
