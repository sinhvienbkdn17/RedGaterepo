SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[SuperUserTabID]
() 
	RETURNS Int
AS
BEGIN
    DECLARE @HostTabId Int = Null
    SELECT  TOP (1) @HostTabId = TabID
		FROM  dbo.Tabs
		WHERE (PortalID IS NULL) AND (ParentId IS NULL)
		ORDER BY TabID
    RETURN @HostTabId
END
GO
