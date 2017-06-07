USE [carrental]
GO

/****** Object:  StoredProcedure [dbo].[GET_COCHE_POR_MARCA_2]    Script Date: 06/06/2017 17:32:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GET_COCHE_POR_MARCA_ID]
@id bigint = NULL
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
--SELECT Coches.*, Marcas.denominacion as denominacionmarca
--FROM Marcas
--INNER JOIN Coches on Marcas.id = Coches.idMarca

END
GO

