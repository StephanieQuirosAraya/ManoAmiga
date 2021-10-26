CREATE PROCEDURE [dbo].[RegisterUser]
	@Email NCHAR(320),
	@Name NCHAR(20),
	@LastName NCHAR(20),
	@PhoneNumber NCHAR(8),
	@Password NCHAR(10)
AS 
--BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	
	DECLARE @Checksum VARBINARY(200)
	
	-- ---------------------------------------------------------------------------
	-- Revision de existencia de correo

	IF EXISTS (SELECT * FROM dbo.Users where Email = @Email)
	BEGIN
		SET @CustomError = 1
		SET @Message = 'Email already in use'
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
		RETURN
	END
	SET @Checksum = CHECKSUM(@Email,@Name)
	

	-- -------------------------------------------------------------------------------------
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		INSERT INTO [dbo].[Users]
					([Name]
					,[LastName]
					,[PhoneNumber]
					,[Checksum]
					,[Password]
					,[Email]
					,[Sinis])
				VALUES
					(@Name
					,@LastName
					,@PhoneNumber
					,@Checksum
					,@Password
					,@Email
					,0)



		
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
--END

RETURN 0
GO


--DELETE dbo.Users
--DBCC CHECKIDENT (Users, RESEED, 0);
--SELECT * FROM users

--EXEC RegisterUser 'holi1@gmail.com','holi','jejeps','1234'