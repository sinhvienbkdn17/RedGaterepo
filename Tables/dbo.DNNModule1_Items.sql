CREATE TABLE [dbo].[DNNModule1_Items]
(
[ItemId] [int] NOT NULL IDENTITY(1, 1),
[ItemName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ItemDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AssignedUserId] [int] NULL,
[ModuleId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DNNModule1_Items] ADD CONSTRAINT [PK_DNNModule1_Items] PRIMARY KEY CLUSTERED  ([ItemId]) ON [PRIMARY]
GO
