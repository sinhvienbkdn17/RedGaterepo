SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPortalAliases]
AS
	SELECT * FROM dbo.PortalAlias
GO
