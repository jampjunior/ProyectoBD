USE carrental
GO

-- CREACION DE LA TABLA MARCAS

CREATE TABLE [dbo].[Marcas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
)

GO

--CREAMOS LA TABLA TIPO DE COMBUSTIBLES

CREATE TABLE [dbo].[TiposCombustibles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposCombustibles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) 

GO

--CREAMOS LA TABLA DE COCHES

CREATE TABLE [dbo].[Coches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[matricula] [nvarchar](10) NOT NULL,
	[idMarca] [bigint] NOT NULL,
	[idTiposCombustible] [bigint] NOT NULL,
	[color] [nvarchar](20) NULL,
	[cilindrada] [decimal](4, 2) NULL,
	[nPlazas] [smallint] NOT NULL DEFAULT 5,
	[fechaMatriculacion] [date] NULL,
 CONSTRAINT [PK_Coches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) 

GO
--CREACION DE LA RELACION ENTRE MARCA Y COCHES
ALTER TABLE [dbo].[Coches]  WITH CHECK ADD  CONSTRAINT [FK_Coches_Marcas] FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Coches] CHECK CONSTRAINT [FK_Coches_Marcas]
GO

--CREACION DE LA RELACION ENTRE TIPOS DE COMBUSTIBLES Y COCHES
ALTER TABLE [dbo].[Coches] 
 WITH CHECK ADD  CONSTRAINT [FK_Coches_TiposCombustibles]--nombre de la tabla
  FOREIGN KEY([idTiposCombustible])
REFERENCES [dbo].[TiposCombustibles] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Coches] CHECK CONSTRAINT [FK_Coches_TiposCombustibles]
GO