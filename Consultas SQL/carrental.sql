USE [carrental]
GO
/****** Object:  Table [dbo].[Coches]    Script Date: 31/05/2017 19:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[matricula] [nvarchar](10) NOT NULL,
	[idMarca] [bigint] NOT NULL,
	[idTiposCombustible] [bigint] NOT NULL,
	[color] [nvarchar](20) NULL,
	[cilindrada] [decimal](4, 2) NULL,
	[nPlazas] [smallint] NOT NULL,
	[fechaMatriculacion] [date] NULL,
 CONSTRAINT [PK_Coches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 31/05/2017 19:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiposCombustibles]    Script Date: 31/05/2017 19:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCombustibles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposCombustibles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_N_Coches_POR_Marcas]    Script Date: 31/05/2017 19:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_N_Coches_POR_Marcas] AS
SELECT M.denominacion as Marca, COUNT(C.id) as nCoches
FROM Marcas M
 LEFT JOIN Coches C on M.id = C.idMarca
 GROUP BY M.denominacion 
GO
SET IDENTITY_INSERT [dbo].[Coches] ON 

INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTiposCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (1, N'TF-1000-BG', 1, 1, N'Negro', CAST(18.00 AS Decimal(4, 2)), 5, CAST(N'1996-10-12' AS Date))
INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTiposCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (7, N'GC-4528-TT', 3, 2, N'Rojo', CAST(2.00 AS Decimal(4, 2)), 2, CAST(N'1995-10-16' AS Date))
INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTiposCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (8, N'6556BDS', 2, 2, N'Blanco', CAST(5.55 AS Decimal(4, 2)), 2, CAST(N'2010-10-15' AS Date))
SET IDENTITY_INSERT [dbo].[Coches] OFF
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (1, N'Seat')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (2, N'Toyota')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (3, N'Ferrari')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (4, N'Mercedes-Benz')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
SET IDENTITY_INSERT [dbo].[TiposCombustibles] ON 

INSERT [dbo].[TiposCombustibles] ([id], [denominacion]) VALUES (1, N'Gasolina')
INSERT [dbo].[TiposCombustibles] ([id], [denominacion]) VALUES (2, N'Diésel')
INSERT [dbo].[TiposCombustibles] ([id], [denominacion]) VALUES (3, N'Hibrído')
INSERT [dbo].[TiposCombustibles] ([id], [denominacion]) VALUES (4, N'Eléctrico')
INSERT [dbo].[TiposCombustibles] ([id], [denominacion]) VALUES (5, N'Hidrógeno')
SET IDENTITY_INSERT [dbo].[TiposCombustibles] OFF
ALTER TABLE [dbo].[Coches] ADD  DEFAULT ((5)) FOR [nPlazas]
GO
ALTER TABLE [dbo].[Coches]  WITH CHECK ADD  CONSTRAINT [FK_Coches_Marcas] FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coches] CHECK CONSTRAINT [FK_Coches_Marcas]
GO
ALTER TABLE [dbo].[Coches]  WITH CHECK ADD  CONSTRAINT [FK_Coches_TiposCombustibles] FOREIGN KEY([idTiposCombustible])
REFERENCES [dbo].[TiposCombustibles] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coches] CHECK CONSTRAINT [FK_Coches_TiposCombustibles]
GO
