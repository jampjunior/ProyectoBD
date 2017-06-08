--Procedimiento almacenado
--esqueleto
ALTER PROCEDURE GET_COCHE_POR_MARCA
AS
BEGIN
--SELECT COUNT(*) FROM Coches
	
--SELECT * FROM Coches
	
--INSERT INTO Coches(matricula, idMarca, idTiposCombustible, color, cilindrada, nPlazas, fechaMatriculacion)--lista de campos

--SELECT	matricula, idMarca, idTiposCombustible, color, cilindrada, nPlazas, fechaMatriculacion	FROM Coches

--SELECT * FROM Coches
--PRINT 'MI PRIMER PROCEDIMIENTO ALMACENADO' 
--SELECT 
--      Marcas.denominacion as denominacionMarca
--    , TiposCombustibles.denominacion as denominacionTipoCombustible
--    , Coches.idMarca
--    , Coches.idTiposCombustible
--    , Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
--    , Coches.fechaMatriculacion, Coches.cilindrada
--FROM Marcas
--    INNER JOIN Coches on Marcas.id = Coches.idMarca
--    INNER JOIN TiposCombustibles on Coches.idTiposCombustible = TiposCombustibles.id
--GROUP BY 
--      Marcas.denominacion
--    , TiposCombustibles.denominacion
--    , Coches.idMarca
--    , Coches.idTiposCombustible
--    , Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
--    , Coches.fechaMatriculacion, Coches.cilindrada
--ORDER BY Marcas.denominacion
--SELECT Coches.*, Marcas.denominacion as denominacionmarca
--FROM Marcas
--INNER JOIN Coches on Marcas.id = Coches.idMarca
SELECT Marcas.denominacion as 'Marca'
, matricula, nPlazas
FROM Marcas
INNER JOIN Coches on Marcas.id = Coches.idMarca
GROUP BY Marcas.denominacion, matricula, nPlazas
ORDER BY nPlazas

END
--para ver los resultados cambiados le ejecutamos otra vez.
--PROCEDIMIENTO PARA LISTAS DE MARCAS
ALTER PROCEDURE GetMarcas
AS
BEGIN
select
id, denominacion 
FROM Marcas
END
--PROCEDIMIENTO PARA INSERTAR UNA NUEVA MARCA

CREATE PROCEDURE AgregarMarca
 @denominacion nvarchar(50)
AS
BEGIN
INSERT INTO Marcas(denominacion) VALUES(@denominacion)
END