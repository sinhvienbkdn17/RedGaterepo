CREATE TABLE [dbo].[WorkflowStates]
(
[StateID] [int] NOT NULL IDENTITY(1, 1),
[WorkflowID] [int] NOT NULL,
[StateName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Order] [int] NOT NULL,
[IsActive] [bit] NOT NULL,
[Notify] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkflowStates] ADD CONSTRAINT [PK_WorkflowStates] PRIMARY KEY CLUSTERED  ([StateID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkflowStates] WITH NOCHECK ADD CONSTRAINT [FK_WorkflowStates_Workflow] FOREIGN KEY ([WorkflowID]) REFERENCES [dbo].[Workflow] ([WorkflowID]) ON DELETE CASCADE
GO
