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

