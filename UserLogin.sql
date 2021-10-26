CREATE PROCEDURE [dbo].[UserLogin]
	@Email NCHAR(320),
	@Password NCHAR(10)
AS 
--BEGIN
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	IF EXISTS (SELECT * FROM Users where Email = @Email and Password = @Password)
	BEGIN
		SELECT Name, LastName, UserID FROM Users where Email = @Email and Password = @Password
	END
	ELSE
	BEGIN
		SET @CustomError = 2
		SET @Message = 'Email and password do not match'
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
		RETURN 1
	END
--END

RETURN 0
GO


--DELETE dbo.Users
--DBCC CHECKIDENT (Users, RESEED, 0);
--SELECT * FROM users

--EXEC UserLogin 'holi2@gmail.com','1234'