SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPackageTypes]
AS
	SELECT * FROM dbo.PackageTypes
GO
