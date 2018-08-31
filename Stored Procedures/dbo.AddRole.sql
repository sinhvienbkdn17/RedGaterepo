SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddRole] 
	@PortalID         int,
	@RoleGroupId      int,
	@RoleName         nvarchar(50),
	@Description      nvarchar(1000),
	@ServiceFee       money,
	@BillingPeriod    int,
	@BillingFrequency char(1),
	@TrialFee         money,
	@TrialPeriod      int,
	@TrialFrequency   char(1),
	@IsPublic         bit,
	@AutoAssignment   bit,
	@RSVPCode         nvarchar(50),
	@IconFile         nvarchar(100),
	@CreatedByUserID  int,
	@Status			  int,
	@SecurityMode   int,
	@IsSystemRole bit
AS
	INSERT INTO dbo.Roles (
	  PortalId,
	  RoleGroupId,
	  RoleName,
	  Description,
	  ServiceFee,
	  BillingPeriod,
	  BillingFrequency,
	  TrialFee,
	  TrialPeriod,
	  TrialFrequency,
	  IsPublic,
	  AutoAssignment,
	  RSVPCode,
	  IconFile,
	  CreatedByUserID,
	  CreatedOnDate,
	  LastModifiedByUserID,
	  LastModifiedOnDate,
	  Status,
	  SecurityMode,
	  IsSystemRole
	)
	VALUES (
	  @PortalID,
	  @RoleGroupId,
	  @RoleName,
	  @Description,
	  @ServiceFee,
	  @BillingPeriod,
	  @BillingFrequency,
	  @TrialFee,
	  @TrialPeriod,
	  @TrialFrequency,
	  @IsPublic,
	  @AutoAssignment,
	  @RSVPCode,
	  @IconFile,
	  @CreatedByUserID,
	  getdate(),
	  @CreatedByUserID,
	  getdate(),
	  @Status,
	  @SecurityMode,
	  @IsSystemRole
	)
	SELECT SCOPE_IDENTITY()
GO
