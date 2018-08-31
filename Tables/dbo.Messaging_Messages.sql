CREATE TABLE [dbo].[Messaging_Messages]
(
[MessageID] [bigint] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[FromUserID] [int] NOT NULL,
[ToUserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromUserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ToUserID] [int] NULL,
[ToRoleID] [int] NULL,
[Status] [tinyint] NOT NULL,
[Subject] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Body] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [datetime] NOT NULL,
[Conversation] [uniqueidentifier] NOT NULL,
[ReplyTo] [bigint] NULL,
[AllowReply] [bit] NOT NULL,
[SkipPortal] [bit] NOT NULL,
[EmailSent] [bit] NOT NULL,
[EmailSentDate] [datetime] NULL,
[EmailSchedulerInstance] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messaging_Messages] ADD CONSTRAINT [PK_Messaging_Messages] PRIMARY KEY CLUSTERED  ([MessageID]) ON [PRIMARY]
GO
