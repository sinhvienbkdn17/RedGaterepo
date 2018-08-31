CREATE TABLE [dbo].[Authentication]
(
[AuthenticationID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NOT NULL CONSTRAINT [DF__Authentic__Packa__7132C993] DEFAULT ((-1)),
[AuthenticationType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsEnabled] [bit] NOT NULL CONSTRAINT [DF__Authentic__IsEna__7226EDCC] DEFAULT ((0)),
[SettingsControlSrc] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LoginControlSrc] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogoffControlSrc] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authentication] ADD CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED  ([AuthenticationID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authentication] WITH NOCHECK ADD CONSTRAINT [FK_Authentication_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
