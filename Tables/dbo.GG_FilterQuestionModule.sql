CREATE TABLE [dbo].[GG_FilterQuestionModule]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ModuleId] [int] NOT NULL,
[FilterQuestionId] [int] NOT NULL,
[OrderBy] [int] NULL CONSTRAINT [DF_GG_FilterQuestionModule_OrderBy] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_FilterQuestionModule] ADD CONSTRAINT [PK_GG_FilterQuestionModule] PRIMARY KEY CLUSTERED  ([Id] DESC) ON [PRIMARY]
GO
