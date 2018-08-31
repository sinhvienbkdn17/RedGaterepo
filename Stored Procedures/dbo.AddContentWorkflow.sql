SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddContentWorkflow]
@PortalID int,
@WorkflowName nvarchar(40),
@Description nvarchar(256),
@IsDeleted bit,
@StartAfterCreating bit,
@StartAfterEditing bit,
@DispositionEnabled bit
AS

INSERT INTO dbo.ContentWorkflows (
  [PortalID],
  [WorkflowName],
  [Description],
  [IsDeleted],
  [StartAfterCreating],
  [StartAfterEditing],
  [DispositionEnabled]
)
VALUES (
  @PortalID,
  @WorkflowName,
  @Description,
  @IsDeleted,
  @StartAfterCreating,
  @StartAfterEditing,
  @DispositionEnabled
)

SELECT SCOPE_IDENTITY()
GO
