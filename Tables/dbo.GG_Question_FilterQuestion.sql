CREATE TABLE [dbo].[GG_Question_FilterQuestion]
(
[QuestionId] [int] NOT NULL,
[FilterQuestionId] [int] NOT NULL,
[PortalId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GG_Question_FilterQuestion] ADD CONSTRAINT [PK_GG_Question_FilterQuestion] PRIMARY KEY CLUSTERED  ([QuestionId], [FilterQuestionId]) ON [PRIMARY]
GO
