SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_GetSearchItems]
	@PortalId INT,
	@ModuleId INT,
	@StartDate DATETIME,
	@StartJournalId INT,
	@NumbersOfResult INT = 500
AS
	WITH ValidJournals AS (
	SELECT	JournalId
			FROM (
					SELECT *, ROW_NUMBER() OVER (ORDER BY JournalId) rownumber FROM (
						SELECT  DISTINCT(j.JournalId)
								
						 FROM dbo.Journal j
						INNER JOIN dbo.Journal_Security js ON js.JournalId = j.JournalId
						INNER JOIN dbo.Users u ON u.UserID = j.UserId
						INNER JOIN dbo.ContentItems ci ON ci.ContentItemID = j.ContentItemId
                        LEFT JOIN dbo.Journal_Comments jc ON jc.JournalId = j.JournalId
						WHERE ci.ModuleID = @ModuleId
						AND (j.DateUpdated > @StartDate OR jc.DateUpdated > @StartDate) --check the update time both for journal item and journal comment
						AND j.JournalId > @StartJournalId
                        AND j.JournalTypeId IN (1,2,3,4)) AS T
				 ) AS T WHERE rownumber <= @NumbersOfResult )

				 SELECT  j.JournalId,
								JournalTypeId,
								j.UserId,
								DateUpdated,
								ProfileId,
								GroupId,
								u.DisplayName AS Title,
								Summary,
								js.SecurityKey,
                                ci.TabID,
								ci.ModuleID
						 FROM dbo.Journal j
						INNER JOIN dbo.Journal_Security js ON js.JournalId = j.JournalId
						INNER JOIN ValidJournals vj ON vj.JournalId = j.JournalId
						INNER JOIN dbo.Users u ON u.UserID = j.UserId
                        INNER JOIN dbo.ContentItems ci ON ci.ContentItemID = j.ContentItemId
GO
