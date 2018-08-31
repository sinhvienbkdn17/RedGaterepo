CREATE TABLE [dbo].[Taxonomy_VocabularyTypes]
(
[VocabularyTypeID] [int] NOT NULL IDENTITY(1, 1),
[VocabularyType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Taxonomy_VocabularyTypes] ADD CONSTRAINT [PK_Taxonomy_VocabularyType] PRIMARY KEY CLUSTERED  ([VocabularyTypeID]) ON [PRIMARY]
GO
