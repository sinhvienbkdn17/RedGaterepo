CREATE TABLE [dbo].[UrlTracking]
(
[UrlTrackingID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[Url] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UrlType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Clicks] [int] NOT NULL,
[LastClick] [datetime] NULL,
[CreatedDate] [datetime] NOT NULL,
[LogActivity] [bit] NOT NULL,
[TrackClicks] [bit] NOT NULL CONSTRAINT [DF_UrlTracking_TrackClicks] DEFAULT ((1)),
[ModuleId] [int] NULL,
[NewWindow] [bit] NOT NULL CONSTRAINT [DF_UrlTracking_NewWindow] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UrlTracking] ADD CONSTRAINT [PK_UrlTracking] PRIMARY KEY CLUSTERED  ([UrlTrackingID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UrlTracking] ADD CONSTRAINT [IX_UrlTracking] UNIQUE NONCLUSTERED  ([PortalID], [Url], [ModuleId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UrlTracking] ADD CONSTRAINT [FK_UrlTracking_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
