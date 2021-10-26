-- Creación de la base de datos de ManoAmiga proyecto de Requerimientos de Software
CREATE DATABASE ManoAmiga;

-- Seleccionamos la base de datos para las modificaciones sobre la base
USE ManoAmiga;

GO
-- DROP TABLE persona;
CREATE TABLE DBO.usuario(
	id_usuario	int		    not null,
	nombre		varchar(30)	not null,
	apellido1	varchar(30)	not null,
	apellido2	varchar(30)	not null,
	telefono    varchar(30) not null,
	direccion   varchar(30) not null,
)
GO

-- =============================================
-- Inserciones de los datos de la tabla usuario
-- =============================================

INSERT INTO DBO.usuario (id_usuario,nombre,apellido1,apellido2,telefono,direccion) 
values (1,'Juan','Lopez','Sequeira','88996352', 'El Rosario de Naranjo');

INSERT INTO DBO.usuario (id_usuario,nombre,apellido1,apellido2,telefono,direccion) 
values (2,'Luis','Montes','Montes','86659224','Santa Clara de San Carlos');

INSERT INTO DBO.usuario (id_usuario,nombre,apellido1,apellido2,telefono,direccion)
values (3,'Stephanie','Aguilera','Lara','86633225','San Juan de Naranjo');

DELETE FROM usuario where id_usuario=1;
SELECT * FROM usuario;


GO
-- DROP TABLE persona;
CREATE TABLE DBO.dextra(
	id_persona			int			primary key not null,
	nombre		char(30)	not null,
	apellido1	char(30)	not null,
	apellido2	char(30)	not null,
	telefono    char(30)    not null
)
GO

GO
-- DROP TABLE persona;
CREATE TABLE DBO.sinis(
	id_persona			int			primary key not null,
	nombre		char(30)	not null,
	apellido1	char(30)	not null,
	apellido2	char(30)	not null,
	telefono    char(30)    not null
)
GO



-- Bibliografía
-- https://codigosql.top/sql-server/como-crear-una-base-de-datos-en-sql-server/
-- https://www.youtube.com/watch?v=Ne4yRNKr_og&ab_channel=TriggerDB-MicrosoftSQLyPowerBI
-- https://blogs.triggerdb.com/2021/06/10/como-guardar-imagenes-en-sql-server/