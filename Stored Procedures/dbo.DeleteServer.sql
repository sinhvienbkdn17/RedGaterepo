SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteServer]
	@ServerID			int
AS
	DELETE FROM dbo.WebServers WHERE ServerID=@ServerID
GO
