CREATE TABLE [dbo].[GG_Headers]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Logo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Language] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PortalId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Headers] ADD CONSTRAINT [PK_GG_Headers] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
