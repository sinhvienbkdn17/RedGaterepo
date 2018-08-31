CREATE TABLE [dbo].[CoreMessaging_MessageRecipients]
(
[RecipientID] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [int] NOT NULL,
[UserID] [int] NOT NULL,
[Read] [bit] NOT NULL CONSTRAINT [DF__CoreMessag__Read__0539C240] DEFAULT ((0)),
[Archived] [bit] NOT NULL CONSTRAINT [DF__CoreMessa__Archi__062DE679] DEFAULT ((0)),
[EmailSent] [bit] NOT NULL CONSTRAINT [DF__CoreMessa__Email__07220AB2] DEFAULT ((0)),
[EmailSentDate] [datetime] NULL,
[EmailSchedulerInstance] [uniqueidentifier] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[SendToast] [bit] NOT NULL CONSTRAINT [DF__CoreMessa__SendT__08162EEB] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_MessageRecipients] ADD CONSTRAINT [PK_CoreMessaging_MessageRecipients] PRIMARY KEY CLUSTERED  ([RecipientID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_MessageRecipients] ADD CONSTRAINT [FK_CoreMessaging_MessageRecipients_CoreMessaging_Messages] FOREIGN KEY ([MessageID]) REFERENCES [dbo].[CoreMessaging_Messages] ([MessageID]) ON DELETE CASCADE
GO
