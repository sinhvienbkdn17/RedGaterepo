CREATE TABLE [dbo].[ProfilePropertyDefinition]
(
[PropertyDefinitionID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[ModuleDefID] [int] NULL,
[Deleted] [bit] NOT NULL,
[DataType] [int] NOT NULL,
[DefaultValue] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PropertyCategory] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PropertyName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Length] [int] NOT NULL CONSTRAINT [DF_ProfilePropertyDefinition_Length] DEFAULT ((0)),
[Required] [bit] NOT NULL,
[ValidationExpression] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ViewOrder] [int] NOT NULL,
[Visible] [bit] NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[DefaultVisibility] [int] NULL,
[ReadOnly] [bit] NOT NULL CONSTRAINT [DF_ProfilePropertyDefinition_ReadOnly] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfilePropertyDefinition] ADD CONSTRAINT [PK_ProfilePropertyDefinition] PRIMARY KEY CLUSTERED  ([PropertyDefinitionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfilePropertyDefinition] WITH NOCHECK ADD CONSTRAINT [FK_ProfilePropertyDefinition_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
