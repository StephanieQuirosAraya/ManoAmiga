-- Creación de la base de datos de ManoAmiga proyecto de Requerimientos de Software
CREATE DATABASE ManoAmiga;

-- Seleccionamos la base de datos para las modificaciones sobre la base
USE ManoAmiga;

GO
-- DROP TABLE persona;

/****** Object:  Table [dbo].[Users]    Script Date: 10/26/2021 2:48:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[PhoneNumber] [nvarchar](8) NOT NULL,
	[Checksum] [varbinary](300) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](320) NOT NULL,
	[Sinis] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO





-- Bibliografía
-- https://codigosql.top/sql-server/como-crear-una-base-de-datos-en-sql-server/
-- https://www.youtube.com/watch?v=Ne4yRNKr_og&ab_channel=TriggerDB-MicrosoftSQLyPowerBI
-- https://blogs.triggerdb.com/2021/06/10/como-guardar-imagenes-en-sql-server/