CREATE TABLE [dbo].[GG_Question]
(
[QuestionId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[IsActive] [bit] NULL,
[IsDelete] [bit] NULL,
[CreatedByUserId] [int] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Question] ADD CONSTRAINT [PK_GG_Question] PRIMARY KEY CLUSTERED  ([QuestionId]) ON [PRIMARY]
GO
