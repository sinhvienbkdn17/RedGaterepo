CREATE TABLE [dbo].[GG_LogAction_Version]
(
[LogActionVersionId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[LogStatus] [int] NULL,
[LogActionName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActionLogUserId] [int] NULL,
[ActionOnDate] [datetime] NULL,
[Version] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_LogAction_Version] ADD CONSTRAINT [PK_GG_LogAction_Version] PRIMARY KEY CLUSTERED  ([LogActionVersionId]) ON [PRIMARY]
GO
