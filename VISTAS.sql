-- CREAMOS LA UNA VISTA PARA CONTAR EL NUMERO DE COCHES POR MARCAS
--preparamos una consulta
CREATE VIEW V_N_Coches_POR_Marcas AS --poner el AS
SELECT M.denominacion as Marca, COUNT(C.id) as nCoches
FROM Marcas M
 LEFT JOIN Coches C on M.id = C.idMarca
 GROUP BY M.denominacion 