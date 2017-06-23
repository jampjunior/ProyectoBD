CREATE PROCEDURE ActualizarUsuario
@nif nvarchar(12)
,@nombre nvarchar(50)
,@apellidos nvarchar(75)
,@email nvarchar(255)
,@password nvarchar(16)
,@fechaNacimiento date
AS
BEGIN
 update Usuario SET
 nombre = @nombre
 ,apellidos =@apellidos
 ,email = @email
 ,password = @password
 ,fechaNacimiento = @fechaNacimiento
 WHERE nif = @nif
END