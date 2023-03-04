create database GestorRSI1
use GestorRSI1

--1 Creación de la tabla de departamento--
CREATE TABLE departamento(
	IDDepartamento INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(255) NULL,
)
GO
-- Llave primaria--
ALTER TABLE departamento ADD CONSTRAINT Pk_IDDepartamento PRIMARY KEY(IDDepartamento) 

-- Test Insert --
INSERT INTO departamento VALUES('Marketing','Es el área de una empresa que se encarga del desarrollo de estrategias de ventas que ayudan a sus organizaciones a posicionarse en un lugar rentable en el mercado');
INSERT INTO departamento VALUES('Comercial','Tiene la función de dar a conocer los productos o servicios que comercializa la empresa a través de acciones publicitarias y de promoción.');
INSERT INTO departamento VALUES('Administrativo','Su objetivo es administrar de un modo correcto los recursos financieros y humanos  de una compañía.');
INSERT INTO departamento VALUES('Desarrollo Software','Su objetivo es realizar tareas de análisis, diseño, desarrollo, prueba-depuración y mantenimiento de los sistemas informáticos requeridos');

--2 Creación de la tabla de departamento--
CREATE TABLE empleado(
	IDEmpleado INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	fechaNacimiento date NULL,
	direccion VARCHAR(255) NULL,
	IDDepartamento INT NULL,
	fechaIngreso date NULL,
)
GO
-- Llave primaria--
ALTER TABLE empleado ADD CONSTRAINT Pk_IDEmpleado PRIMARY KEY(IDEmpleado) 
-- Llave foranea
ALTER TABLE departamento ADD CONSTRAINT fk_IDDepartamento FOREIGN KEY (IDDepartamento)
REFERENCES departamento(IDDepartamento)
GO

-- Test Insert --
INSERT INTO empleado VALUES('Ismael Chavez Perez','2001-07-16','Matamoros Norte-Centro-Sur, Mariano Matamoros, 22206 Tijuana, B.C.',6,'2022-03-03');
INSERT INTO empleado VALUES('David Chavez Perez','2003-03-07','Matamoros Norte-Centro-Sur, Mariano Matamoros, 22206 Tijuana, B.C.',6,'2023-01-01');
INSERT INTO empleado VALUES('Melissa Chavez Perez','1995-01-10','Matamoros Norte-Centro-Sur, Mariano Matamoros, 22206 Tijuana, B.C.',6,'2022-07-01');


-- Procedimientos Departamento --
create procedure sp_loadDepartamento
as begin
SELECT IDDepartamento as ID, nombre as Nombre, descripcion as Descripcion FROM departamento
end

create procedure sp_createDepartamento
@nombre VARCHAR(50),
@descripcion VARCHAR(255)
as begin
INSERT INTO departamento VALUES(@nombre,@descripcion);
end

create procedure sp_readDepartamento
@IDDepartamento INT
as begin
SELECT * FROM departamento where IDDepartamento=@IDDepartamento
end

create procedure sp_updateDepartamento
@IDDepartamento INT,
@nombre VARCHAR(50),
@descripcion VARCHAR(255)
as begin
UPDATE departamento set nombre=@nombre,descripcion=@descripcion
where IDDepartamento=@IDDepartamento
end

create procedure sp_deleteDepartamento
@IDDepartamento INT
as begin
delete FROM departamento where IDDepartamento=@IDDepartamento
end

-- Procedimientos Empleado --
create procedure sp_loadEmpleado
as begin
SELECT IDEmpleado as "ID", nombre as Nombre, CONVERT(varchar,fechaNacimiento,111) as "Fecha de nacimiento", direccion as Direccion, IDDepartamento as "Departamento", CONVERT(varchar,fechaIngreso,111) as "Fecha de ingreso", DATEDIFF(DAY, fechaIngreso, GETDATE()) as "Dias laborados" FROM empleado ORDER BY fechaIngreso DESC;
end

create procedure sp_createEmpleado
@nombre VARCHAR(50),
@fechaNacimiento date,
@direccion VARCHAR(255),
@IDDepartamento INT,
@fechaIngreso date
as begin
INSERT INTO empleado VALUES(@nombre,@fechaNacimiento,@direccion,@IDDepartamento,@fechaIngreso);
end

create procedure sp_readEmpleado
@IDEmpleado INT
as begin
SELECT * FROM empleado where IDEmpleado=@IDEmpleado
end

create procedure sp_updateEmpleado
@IDEmpleado INT,
@nombre VARCHAR(50),
@fechaNacimiento date,
@direccion VARCHAR(255),
@IDDepartamento INT,
@fechaIngreso date
as begin
UPDATE empleado set nombre=@nombre,fechaNacimiento=@fechaNacimiento,direccion=@direccion,IDDepartamento=@IDDepartamento,fechaIngreso=@fechaIngreso
where IDEmpleado=@IDEmpleado
end

create procedure sp_deleteEmpleado
@IDEmpleado INT
as begin
delete FROM empleado where IDEmpleado=@IDEmpleado
end