ALTER PROCEDURE GET_COCHE_POR_MARCA_2
@marca nvarchar(50) =  NULL
, @nPlazas smallint = NULL
AS
BEGIN

SELECT Marcas.denominacion as 'Marca'
, matricula, nPlazas
FROM Marcas
INNER JOIN Coches on Marcas.id = Coches.idMarca
WHERE (Marcas.denominacion   LIKE '%' + @marca + '%' OR @marca is null)
and (Coches.nPlazas >= @nPlazas OR @nPlazas is null )
--GROUP BY Marcas.denominacion, matricula, nPlazas
--ORDER BY nPlazas

END