CREATE TABLE [dbo].[Workflow]
(
[WorkflowID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[WorkflowName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Workflow] ADD CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED  ([WorkflowID]) ON [PRIMARY]
GO
