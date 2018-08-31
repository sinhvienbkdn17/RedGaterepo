CREATE TABLE [dbo].[Taxonomy_ScopeTypes]
(
[ScopeTypeID] [int] NOT NULL IDENTITY(1, 1),
[ScopeType] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Taxonomy_ScopeTypes] ADD CONSTRAINT [PK_ScopeTypes] PRIMARY KEY CLUSTERED  ([ScopeTypeID]) ON [PRIMARY]
GO
