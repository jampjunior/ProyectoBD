ALTER PROCEDURE GET_COCHE_POR_MARCA_7
AS
BEGIN
SELECT 
      Marcas.denominacion as denominacionMarca
    , TiposCombustibles.denominacion as denominacionTipoCombustible
    , Coches.idMarca
    , Coches.idTiposCombustible
    , Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
    , Coches.fechaMatriculacion, Coches.cilindrada
FROM Marcas
    INNER JOIN Coches on Marcas.id = Coches.idMarca
    INNER JOIN TiposCombustibles on Coches.idTiposCombustible = TiposCombustibles.id
GROUP BY 
      Marcas.denominacion
    , TiposCombustibles.denominacion
    , Coches.idMarca
    , Coches.idTiposCombustible
    , Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
    , Coches.fechaMatriculacion, Coches.cilindrada
ORDER BY Marcas.denominacion

END