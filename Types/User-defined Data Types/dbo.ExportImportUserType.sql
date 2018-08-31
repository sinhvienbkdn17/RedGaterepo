CREATE TYPE [dbo].[ExportImportUserType] AS TABLE
(
[PortalId] [int] NULL,
[Username] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AffiliateId] [int] NULL,
[IsSuperUser] [bit] NULL,
[Email] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatePassword] [bit] NULL,
[Authorised] [bit] NULL,
[CreatedByUserId] [int] NULL,
[VanityUrl] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RefreshRoles] [bit] NULL,
[LastIPAddress] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PasswordResetToken] [uniqueidentifier] NULL,
[PasswordResetExpiration] [datetime] NULL,
[IsDeleted] [bit] NULL,
[LastModifiedByUserId] [int] NULL,
[ApplicationId] [uniqueidentifier] NULL,
[AspUserId] [uniqueidentifier] NULL,
[MobileAlias] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsAnonymous] [bit] NULL,
[Password] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PasswordFormat] [int] NULL,
[PasswordSalt] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePIN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PasswordQuestion] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PasswordAnswer] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsApproved] [bit] NULL,
[IsLockedOut] [bit] NULL,
[FailedPasswordAttemptCount] [int] NULL,
[FailedPasswordAnswerAttemptCount] [int] NULL,
[Comment] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuthenticationType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuthenticationToken] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO