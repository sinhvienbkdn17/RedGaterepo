CREATE TABLE [dbo].[GG_Tags]
(
[TagId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NULL,
[Name] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alias] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDisplay] [bit] NULL,
[IsDeleted] [bit] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Tags] ADD CONSTRAINT [PK_GG_Tags] PRIMARY KEY CLUSTERED  ([TagId]) ON [PRIMARY]
GO
