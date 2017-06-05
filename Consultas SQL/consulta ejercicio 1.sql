SELECT Coches.*, Marcas.denominacion as denominacionmarca,
TiposCombustibles.denominacion as denominacionTipoCombustible
FROM Marcas
INNER JOIN Coches on Marcas.id = Coches.idMarca
INNER JOIN TiposCombustibles on Coches.idTiposCombustible = TiposCombustibles.id
