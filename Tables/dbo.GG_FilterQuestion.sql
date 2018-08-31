CREATE TABLE [dbo].[GG_FilterQuestion]
(
[FilterQuestionId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[IsDelete] [bit] NULL,
[IsActive] [bit] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_FilterQuestion] ADD CONSTRAINT [PK_GG_FilterQuestion] PRIMARY KEY CLUSTERED  ([FilterQuestionId]) ON [PRIMARY]
GO
