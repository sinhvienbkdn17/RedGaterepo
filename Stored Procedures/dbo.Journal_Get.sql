SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Get]
    @PortalId INT,
    @CurrentUserId INT,
    @JournalId INT,
    @IncludeAllItems INT = 0,
    @IsDeleted INT = 0,
    @SecurityCheck BIT = 0
    AS
    DECLARE @RegisteredRoleId INT
	SELECT @RegisteredRoleId = RegisteredRoleId FROM dbo.[Portals] WHERE PortalID = @PortalId
    SELECT     j.JournalId, j.JournalTypeId, j.Title, j.Summary, j.UserId, j.DateCreated, j.DateUpdated, j.PortalId,
                j.ProfileId, j.GroupId, j.ObjectKey, j.AccessKey,
                "JournalOwner" = '<entity><id>' + CAST(p.UserId as nvarchar(150)) + '</id><name><![CDATA[' + p.DisplayName + ']]></name></entity>',
                "JournalAuthor" = CASE WHEN ISNULL(a.UserId,-1) >0 THEN '<entity><id>' + CAST(a.UserId as nvarchar(150)) + '</id><name><![CDATA[' + a.DisplayName + ']]></name></entity>' ELSE '' END,
                "JournalOwnerId" = ISNULL(j.ProfileId,j.UserId),
                 jt.Icon, jt.JournalType,
                "Profile" = CASE WHEN j.ProfileId > 0 THEN '<entity><id>' + CAST(p.UserID as nvarchar(150)) + '</id><name><![CDATA[' + p.DisplayName + ']]></name><vanity></vanity></entity>' ELSE '' END,
				"SimilarCount" = (SELECT COUNT(JournalId) FROM dbo.Journal WHERE ContentItemId = j.ContentItemId AND JournalTypeId = j.JournalTypeId),
                jd.JournalXML, ContentItemId, j.ItemData, j.IsDeleted, j.CommentsDisabled, j.CommentsHidden
    FROM        dbo.[Journal] AS j
                INNER JOIN dbo.[Journal_Types] as jt ON jt.JournalTypeId = j.JournalTypeId
                INNER JOIN dbo.[Journal_Security] AS js ON js.JournalId = j.JournalId
                INNER JOIN dbo.[Journal_User_Permissions](@PortalId,@CurrentUserId, @RegisteredRoleId) as t ON t.seckey = js.SecurityKey OR @SecurityCheck = 0
                LEFT OUTER JOIN dbo.[Journal_Data] as jd on jd.JournalId = j.JournalId 
                LEFT OUTER JOIN dbo.[Users] AS p ON j.ProfileId = p.UserID 
                LEFT OUTER JOIN dbo.[Users] AS a ON j.UserId = a.UserID
    WHERE       ((@IncludeAllItems = 0) AND (j.JournalId = @JournalId AND j.IsDeleted = @IsDeleted)) 
                OR 
                ((@IncludeAllItems = 1) AND (j.JournalId = @JournalId))
GO
