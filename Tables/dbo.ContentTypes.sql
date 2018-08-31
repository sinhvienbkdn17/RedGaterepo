CREATE TABLE [dbo].[ContentTypes]
(
[ContentTypeID] [int] NOT NULL IDENTITY(1, 1),
[ContentType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes] ADD CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED  ([ContentTypeID]) ON [PRIMARY]
GO
