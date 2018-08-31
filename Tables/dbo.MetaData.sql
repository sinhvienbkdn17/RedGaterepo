CREATE TABLE [dbo].[MetaData]
(
[MetaDataID] [int] NOT NULL IDENTITY(1, 1),
[MetaDataName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MetaDataDescription] [nvarchar] (2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MetaData] ADD CONSTRAINT [PK_MetaData] PRIMARY KEY CLUSTERED  ([MetaDataID]) ON [PRIMARY]
GO
