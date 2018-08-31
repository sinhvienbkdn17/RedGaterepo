CREATE TABLE [dbo].[SearchDeletedItems]
(
[SearchDeletedItemsID] [int] NOT NULL IDENTITY(1, 1),
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF__SearchDel__DateC__73DA2C14] DEFAULT (getutcdate()),
[Document] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SearchDeletedItems] ADD CONSTRAINT [PK_SearchDeletedItems] PRIMARY KEY CLUSTERED  ([SearchDeletedItemsID]) ON [PRIMARY]
GO
