CREATE TABLE [dbo].[UserAuthentication]
(
[UserAuthenticationID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[AuthenticationType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AuthenticationToken] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAuthentication] ADD CONSTRAINT [PK_UserAuthentication] PRIMARY KEY CLUSTERED  ([UserAuthenticationID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAuthentication] ADD CONSTRAINT [FK_UserAuthentication_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
