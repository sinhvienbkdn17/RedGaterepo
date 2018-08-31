CREATE TABLE [dbo].[EventLog]
(
[LogGUID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogTypeKey] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogConfigID] [int] NULL,
[LogUserID] [int] NULL,
[LogUserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LogPortalID] [int] NULL,
[LogPortalName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LogCreateDate] [datetime] NOT NULL,
[LogServerName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogProperties] [xml] NULL,
[LogNotificationPending] [bit] NULL,
[LogEventID] [bigint] NOT NULL IDENTITY(1, 1),
[ExceptionHash] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLog] ADD CONSTRAINT [PK_EventLogMaster] PRIMARY KEY CLUSTERED  ([LogEventID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLog] WITH NOCHECK ADD CONSTRAINT [FK_EventLog_EventLogConfig] FOREIGN KEY ([LogConfigID]) REFERENCES [dbo].[EventLogConfig] ([ID])
GO
ALTER TABLE [dbo].[EventLog] WITH NOCHECK ADD CONSTRAINT [FK_EventLog_EventLogTypes] FOREIGN KEY ([LogTypeKey]) REFERENCES [dbo].[EventLogTypes] ([LogTypeKey])
GO
