CREATE TABLE [dbo].[RedirectMessages]
(
[MessageId] [uniqueidentifier] NOT NULL CONSTRAINT [Guid_Default] DEFAULT (newid()),
[UserId] [int] NULL,
[TabId] [int] NULL,
[MessageText] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF__RedirectM__Creat__6774552F] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RedirectMessages] ADD CONSTRAINT [PK_RedirectMessages] PRIMARY KEY CLUSTERED  ([MessageId]) ON [PRIMARY]
GO
