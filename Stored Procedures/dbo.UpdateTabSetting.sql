SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateTabSetting]
	@TabID	      	    int,           -- Not Null|-1
	@SettingName		nvarchar( 50), -- Not Null|''
	@SettingValue		nvarchar(Max), -- Null: remove setting
	@UserID				int            -- for logging
AS
BEGIN
	-- empty value: remove setting
	IF IsNull(@SettingValue, N'') = N'' AND IsNull(@SettingName, N'') != N''
		DELETE FROM dbo.[TabSettings]
		 WHERE IsNull(TabID, -1) = IsNull(@TabID, -1)
		   AND SettingName = @SettingName;
	ELSE IF IsNull(@SettingName, N'') != N'' AND IsNull(@TabID, -1) != -1 BEGIN -- key must be valid
		MERGE INTO dbo.[TabSettings] S
		 USING (SELECT @TabID MID, @SettingName SN, @SettingValue SV) Q
		    ON (S.TabID = Q.MID AND S.SettingName = Q.SN)
		 WHEN MATCHED AND IsNull(S.SettingValue, N'') != IsNull(Q.SV, N'') THEN -- update only, if value has been modified:
			UPDATE SET [SettingValue] = Q.SV, [LastModifiedByUserID] = @UserID, [LastModifiedOnDate] = GetDate()
		 WHEN NOT MATCHED THEN 
		    INSERT ( TabID,  SettingName,  SettingValue, CreatedByUserID    , CreatedOnDate, LastModifiedByUserID, LastModifiedOnDate)
			VALUES (@TabID, @SettingName, @SettingValue, IsNull(@UserID, -1),     GetDate(),  IsNull(@UserID, -1),          GetDate());
	END; -- Else If
END; -- Procedure
GO
