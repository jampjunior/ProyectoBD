--Consultas de Selección
SELECT	*
FROM  Services

SELECT name, id
 FROM Services  

SELECT name, id 
 FROM Services 
 ORDER BY name, id desc, hiddenId

SELECT *
 FROM Services 
 WHERE deleted = 0 

SELECT *
 FROM Services 
 WHERE deleted = 0 AND status = 0

SELECT *
 FROM Services 
 WHERE deleted = 0  OR  price <>20

SELECT * 
 FROM Services
  WHERE idUserResponse IS NOT NULL 

SELECT name
FROM Services
WHERE name LIKE '%Visita'
--Visita% y %Visita%
SELECT * 
FROM Services
WHERE tags like 'c%ches'

SELECT COUNT(*) as 'Total de Filas'
FROM Services

SELECT max(price) as PrecioAlto
FROM Services

SELECT min(price) as PrecioBajo
FROM Services

SELECT sum(price) as Total
FROM Services

SELECT avg(price) as Media
FROM Services

SELECT distinct deleted 
FROM Services

SELECT count(*)as Total , deleted
FROM Services
group by deleted 

SELECT count(*), deleted, isAdmin 
FROM Users
GROUP BY deleted, isAdmin

SELECT count(*) as 'Nº Filas',deleted, isAdmin,email 
FROM Users
WHERE hiddenId > 168 AND firstName LIKE '%e%'
GROUP BY deleted, isAdmin,email
ORDER BY email desc

--  CONSULTAS SOBRE VARIAS TABLAS
SELECT 
	  S.id, S.name, S.description, COUNT(*)
FROM Services S
	INNER JOIN ServiceImages SI
		on S.id = SI.idService
GROUP BY 	  
	  S.id, S.name, S.description

SELECT 
	  S.id, S.name, S.description, SI.imageUrl
FROM Services S
	LEFT JOIN ServiceImages SI
		on S.id = SI.idService
GROUP BY 	  
	  S.id, S.name, S.description, SI.imageUrl
HAVING SI.imageUrl LIKE '%_2.png'
