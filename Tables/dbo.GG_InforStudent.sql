CREATE TABLE [dbo].[GG_InforStudent]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[IdStudent] [int] NOT NULL,
[KeyName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Content] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TypeOf] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ModuleId] [int] NOT NULL,
[Note] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_InforStudent] ADD CONSTRAINT [PK_GG_InforStudent] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
