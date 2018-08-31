CREATE TABLE [dbo].[GG_Advisory]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Phone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Branch] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[Status] [int] NOT NULL,
[IsDeleted] [int] NOT NULL CONSTRAINT [DF_GG_Advisory_IsDeleted] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Advisory] ADD CONSTRAINT [PK_GG_Advisory] PRIMARY KEY CLUSTERED  ([Id] DESC) ON [PRIMARY]
GO
