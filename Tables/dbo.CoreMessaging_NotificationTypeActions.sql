CREATE TABLE [dbo].[CoreMessaging_NotificationTypeActions]
(
[NotificationTypeActionID] [int] NOT NULL IDENTITY(1, 1),
[NotificationTypeID] [int] NOT NULL,
[NameResourceKey] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DescriptionResourceKey] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConfirmResourceKey] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order] [int] NOT NULL,
[APICall] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypeActions] ADD CONSTRAINT [PK_CoreMessaging_NotificationTypeActions] PRIMARY KEY CLUSTERED  ([NotificationTypeActionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypeActions] ADD CONSTRAINT [FK_CoreMessaging_NotificationTypeActions_CoreMessaging_NotificationTypes] FOREIGN KEY ([NotificationTypeID]) REFERENCES [dbo].[CoreMessaging_NotificationTypes] ([NotificationTypeID]) ON DELETE CASCADE
GO
