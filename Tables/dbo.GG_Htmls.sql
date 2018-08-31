CREATE TABLE [dbo].[GG_Htmls]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Content] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PortalId] [int] NOT NULL,
[ModuleId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Htmls] ADD CONSTRAINT [PK_GG_Htmls] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
