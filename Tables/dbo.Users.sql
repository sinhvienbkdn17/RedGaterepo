CREATE TABLE [dbo].[Users]
(
[UserID] [int] NOT NULL IDENTITY(1, 1),
[Username] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsSuperUser] [bit] NOT NULL CONSTRAINT [DF_Users_IsSuperUser] DEFAULT ((0)),
[AffiliateId] [int] NULL,
[Email] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Users_DisplayName] DEFAULT (''),
[UpdatePassword] [bit] NOT NULL CONSTRAINT [DF_Users_UpdatePassword] DEFAULT ((0)),
[LastIPAddress] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Users_IsDeleted] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[PasswordResetToken] [uniqueidentifier] NULL,
[PasswordResetExpiration] [datetime] NULL,
[LowerEmail] AS (lower([Email])) PERSISTED
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED  ([UserID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED  ([Username]) ON [PRIMARY]
GO
