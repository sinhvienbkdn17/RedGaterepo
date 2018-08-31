CREATE TABLE [dbo].[CoreMessaging_Messages]
(
[MessageID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[NotificationTypeID] [int] NULL,
[To] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[From] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Body] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConversationID] [int] NULL,
[ReplyAllAllowed] [bit] NULL,
[SenderUserID] [int] NULL,
[ExpirationDate] [datetime] NULL,
[Context] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IncludeDismissAction] [bit] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_Messages] ADD CONSTRAINT [PK_CoreMessaging_Messages] PRIMARY KEY CLUSTERED  ([MessageID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_Messages] WITH NOCHECK ADD CONSTRAINT [FK_CoreMessaging_Messages_CoreMessaging_NotificationTypes] FOREIGN KEY ([NotificationTypeID]) REFERENCES [dbo].[CoreMessaging_NotificationTypes] ([NotificationTypeID]) ON DELETE CASCADE
GO
