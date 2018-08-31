CREATE TABLE [dbo].[WebServers]
(
[ServerID] [int] NOT NULL IDENTITY(1, 1),
[ServerName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[LastActivityDate] [datetime] NOT NULL,
[URL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IISAppName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_WebServers_IISAppName] DEFAULT (''),
[Enabled] [bit] NOT NULL CONSTRAINT [DF_WebServers_Enabled] DEFAULT ((1)),
[ServerGroup] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UniqueId] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PingFailureCount] [int] NOT NULL CONSTRAINT [DF__WebServer__PingF__284DF453] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WebServers] ADD CONSTRAINT [PK_WebServers] PRIMARY KEY CLUSTERED  ([ServerID]) ON [PRIMARY]
GO
