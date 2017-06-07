CREATE PROCEDURE [dbo].[GET_MARCA_ID]
@id bigint 
AS
BEGIN

SELECT *
FROM Marcas
WHERE Marcas.id = @id
ORDER BY Marcas.denominacion

END