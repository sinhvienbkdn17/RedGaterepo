SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateServerActivity]
    @ServerName			NVARCHAR(50),
    @IISAppName			NVARCHAR(200),
    @CreatedDate		DATETIME,
    @LastActivityDate	DATETIME,
    @PingFailureCount   INT,
    @Enabled            BIT
AS

	DECLARE @ServerID int
	SET @ServerID = (SELECT ServerID FROM dbo.WebServers WHERE ServerName = @ServerName AND IISAppName = @IISAppName)

	IF @ServerID IS NULL
		BEGIN
			-- Insert
			INSERT INTO dbo.WebServers (
				ServerName,
				IISAppName,
				CreatedDate,
				LastActivityDate,
                PingFailureCount,
				[Enabled]
			)
			VALUES (
				@ServerName,
				@IISAppName,
				@CreatedDate,
				@LastActivityDate,
                @PingFailureCount,
				@Enabled
			)

            SELECT @ServerID = SCOPE_IDENTITY()
		END
	ELSE
		BEGIN
			-- Update
			UPDATE dbo.WebServers 
				SET 
					LastActivityDate = @LastActivityDate, PingFailureCount = @PingFailureCount, [Enabled] = @Enabled
				WHERE  ServerName = @ServerName AND IISAppName = @IISAppName
		END

    SELECT @ServerID
GO
