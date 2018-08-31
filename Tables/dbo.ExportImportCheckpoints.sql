CREATE TABLE [dbo].[ExportImportCheckpoints]
(
[CheckpointId] [int] NOT NULL IDENTITY(1, 1),
[JobId] [int] NOT NULL,
[AssemblyName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Category] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Stage] [int] NOT NULL,
[StageData] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Progress] [int] NOT NULL,
[TotalItems] [int] NOT NULL CONSTRAINT [DF__ExportImp__Total__0EC32C7A] DEFAULT ((0)),
[ProcessedItems] [int] NOT NULL CONSTRAINT [DF__ExportImp__Proce__0FB750B3] DEFAULT ((0)),
[StartDate] [datetime] NULL,
[LastUpdateDate] [datetime] NULL,
[Completed] [bit] NULL CONSTRAINT [DF__ExportImp__Compl__10AB74EC] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExportImportCheckpoints] ADD CONSTRAINT [PK_ExportImportCheckpoints] PRIMARY KEY CLUSTERED  ([CheckpointId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExportImportCheckpoints] ADD CONSTRAINT [FK_ExportImportCheckpoints_JobId] FOREIGN KEY ([JobId]) REFERENCES [dbo].[ExportImportJobs] ([JobId]) ON DELETE CASCADE
GO
