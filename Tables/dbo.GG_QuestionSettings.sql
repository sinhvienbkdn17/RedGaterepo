CREATE TABLE [dbo].[GG_QuestionSettings]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ModuleId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_QuestionSettings] ADD CONSTRAINT [PK_GG_QuestionSettings] PRIMARY KEY CLUSTERED  ([Id] DESC) ON [PRIMARY]
GO
