SELECT Marcas.denominacion as 'Marca'
, matricula, nPlazas
FROM Marcas
INNER JOIN Coches on Marcas.id = Coches.idMarca --clave en común
GROUP BY Marcas.denominacion, matricula, nPlazas
ORDER BY nPlazas
