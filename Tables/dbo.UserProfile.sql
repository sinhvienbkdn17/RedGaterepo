CREATE TABLE [dbo].[UserProfile]
(
[ProfileID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[PropertyDefinitionID] [int] NOT NULL,
[PropertyValue] [nvarchar] (3750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PropertyText] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Visibility] [int] NOT NULL CONSTRAINT [DF__UserProfi__Visib__19FFD4FC] DEFAULT ((0)),
[LastUpdatedDate] [datetime] NOT NULL,
[ExtendedVisibility] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfile] ADD CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED  ([ProfileID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfile] WITH NOCHECK ADD CONSTRAINT [FK_UserProfile_ProfilePropertyDefinition] FOREIGN KEY ([PropertyDefinitionID]) REFERENCES [dbo].[ProfilePropertyDefinition] ([PropertyDefinitionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfile] ADD CONSTRAINT [FK_UserProfile_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
