DROP SCHEMA Ferreteria_Preti;

CREATE SCHEMA Ferreteria_Preti;
USE Ferreteria_Preti;

CREATE TABLE IF NOT EXISTS Clientes(
DNI_cliente INT NOT NULL,
Mail VARCHAR(100) NOT NULL,
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
PRIMARY KEY (DNI_cliente)
);


CREATE TABLE IF NOT EXISTS Proveedores(
Nombre_prov VARCHAR(100) NOT NULL,
Tipo_producto VARCHAR(100) NOT NULL,
Mail VARCHAR(100) NOT NULL,
Telefono VARCHAR(100) NOT NULL,
PRIMARY KEY (Nombre_prov)
);

CREATE TABLE IF NOT EXISTS Productos(
Id_producto INT AUTO_INCREMENT,
Tipo VARCHAR(100) NOT NULL,
Precio_compra INT NOT NULL,
Precio_venta INT NOT NULL,
PRIMARY KEY (Id_producto)
);

CREATE TABLE IF NOT EXISTS Pedidos_proveedores(
Id_orden INT AUTO_INCREMENT,
Fecha DATE NOT NULL,
Nombre_prov VARCHAR(30) NOT NULL,
Id_Producto INT NOT NULL,
PRIMARY KEY(Id_orden),
CONSTRAINT fk_Pedidos_proveedores_Proveedores FOREIGN KEY (Nombre_prov) REFERENCES Proveedores (Nombre_prov) ON DELETE RESTRICT,
CONSTRAINT fk_Pedidos_proveedores_Productos FOREIGN KEY (Id_Producto) REFERENCES Productos (Id_producto) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Empleados(
DNI_empleado INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Apellido VARCHAR(30) NOT NULL,
Orden_recibida INT NOT NULL,
PRIMARY KEY (DNI_empleado),
CONSTRAINT fk_Empleados_Pedidos_proveedores FOREIGN KEY (Orden_recibida) REFERENCES Pedidos_proveedores (Id_orden) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Ventas(
Id_venta INT AUTO_INCREMENT,
Fecha DATE,
DNI_empleado INT NOT NULL,
DNI_cliente INT NOT NULL,
Id_Producto INT NOT NULL,
PRIMARY KEY (Id_venta),
CONSTRAINT fk_Compras_Empleados FOREIGN KEY (DNI_empleado) REFERENCES Empleados (DNI_empleado) ON DELETE RESTRICT,
CONSTRAINT fk_Compras_Clientes FOREIGN KEY (DNI_cliente) REFERENCES Clientes (DNI_cliente) ON DELETE RESTRICT,
CONSTRAINT fk_Compras_Productos FOREIGN KEY (Id_Producto) REFERENCES Productos (Id_producto) ON DELETE RESTRICT
);

-- USE Ferreteria_Preti;--

INSERT INTO Clientes (DNI_cliente, Mail, Nombre, Apellido) VALUES
(35288954,'juanperalta@aol.ar', 'Juan', 'Peralta'),
(25674839,'soniaperez@aol.ar', 'Sonia', 'Perez'),
(32456547,'rodrigogarfuncolo@aol.ar', 'rodrigo', 'garfuncolo'),
(20890876,'ricardolaspa@aol.ar', 'Ricardo', 'Laspa'),
(23434554,'roncaballero@aol.ar', 'Ron', 'Caballero'),
(15678567,'jimenaortega@aol.ar', 'Jimena', 'Ortega'),
(23437856,'gracielaestral@aol.ar', 'Graciela', 'Estral'),
(25334276,'josecarabajal@aol.ar', 'Jose', 'Carabajal'),
(14623988,'guidosoler@aol.ar', 'Guido', 'Soler');


INSERT INTO Productos (Id_producto, Tipo, Precio_compra, Precio_venta)VALUES 

(2050,'Escalera Aluminio 5', 120, 170),
(2051,'Escalera Madera 5', 100, 150),
(2052,'Estanteria Aluminio 5', 190, 270),
(2053,'Estanteria Madera 5', 180, 240),
(2054,'Hidrolavadora max potencia', 300, 420),
(2055,'Hidrolavadora media potencia', 200, 350),
(2056,'Manguera media potencia 15m', 200, 310),
(2057,'Manguera largo alcance 30m', 350, 410);


INSERT INTO Proveedores (Nombre_prov, Tipo_producto, Mail, Telefono)
VALUES 
('Bosch','Escalera Aluminio 5', 'Bosch@aol.com', '+543425767888'),
('Escalerax','Escalera Madera 5', 'Escalerax@aol.com', '+543425767213'),
('Los estantes','Estanteria Aluminio 5', 'Losestantes@aol.com', '+543425767465'),
('Maderax','Estanteria Madera 5', 'Losestantes@aol.com', '+543425767465'),
('Hidrolavadorax','Hidrolavadora max potencia', 'Hidrolava@aol.com', '+543425767555'),
('La Hidrolavadora mejor','Hidrolavadora media potencia', 'LaHidrolavadora@aol.com', '+543425767787'),
('Manguerax','Manguera media potencia 15m', 'LaManguerax@aol.com', '+543425767454'),
('Plasticos Argentinos','Manguera largo alcance 30m', 'Plasticosargentinos@aol.com', '+543425767901');

INSERT INTO Pedidos_proveedores (Id_orden, Fecha, Nombre_prov, Id_Producto)VALUES
(1, '2023-03-23', 'Escalerax', 2051),
(2, '2023-05-11', 'Los estantes', 2052),
(3, '2023-05-21', 'Escalerax', 2051),
(4, '2022-06-12', 'Hidrolavadorax', 2054),
(5, '2022-06-30', 'Manguerax', 2056),
(6, '2022-07-02', 'Los estantes', 2052),
(7, '2023-07-31', 'Plasticos Argentinos', 2057),
(8, '2023-08-30', 'Hidrolavadorax', 2054),
(9, '2023-08-31', 'Bosch', 2050),
(10, '2023-08-31', 'Manguerax', 2056),
(11, '2023-09-02', 'Bosch', 2050),
(12, '2023-09-05', 'Plasticos Argentinos', 2057);


INSERT INTO Empleados (DNI_empleado, Nombre, Apellido, Orden_recibida) VALUES

(24365786, 'Sandra', 'Gonzalez', 1),
(32432565, 'Graciela', 'Lopez', 2),
(21656898, 'Gabriel', 'Pinto', 3),
(32222454, 'Fernando', 'Weber', 4),
(21222876, 'Gonzalo', 'Serrano', 5),
(21323555, 'Juan', 'Pascual', 6),
(36558786, 'Leonardo', 'Paz', 7),
(25544987, 'Alejandro', 'Doria', 8),
(38787660, 'Ricardo', 'Echegoyen', 9),
(35222878, 'Simon', 'Bolivar', 10);


INSERT INTO Ventas (Id_venta, Fecha, DNI_empleado, DNI_cliente, Id_Producto) VALUES
(1,'2023-06-12', 38787660, 14623988, 2056),
(2,'2023-06-14', 38787660, 25334276, 2053),
(3,'2023-06-15', 36558786, 25334276, 2057),
(4,'2023-07-20', 36558786, 23437856, 2050),
(5,'2023-07-21', 36558786, 15678567, 2054),
(6,'2023-08-09', 21323555, 23434554, 2055),
(7,'2023-08-09', 21222876, 20890876, 2057),
(8,'2023-09-12', 32222454, 32456547, 2051),
(9,'2023-09-15', 21656898, 32456547, 2052),
(10,'2023-10-23', 21656898, 25674839, 2054),
(11,'2023-10-25', 32432565, 25674839, 2055),
(12,'2023-11-03', 24365786, 35288954, 2050);

-- Vista para ver el tipo de producto, precios y proveedor --

CREATE OR REPLACE VIEW vw_proveedor_precios AS
SELECT a.Tipo, a.Precio_compra, a.Precio_venta, b.Nombre_prov
FROM productos AS a JOIN proveedores AS b ON (a.Tipo=b.Tipo_producto);

-- Vista para obtener productos cuyo precio es mayor o igual a $199 --

CREATE OR REPLACE VIEW vw_productos_precios AS
SELECT Tipo, Precio_compra
FROM productos
WHERE Precio_compra >= 199;

-- Vista para obtener los pedidos realizados en el año 2023 --

CREATE OR REPLACE VIEW vw_pedidos_2023 AS
SELECT Id_orden, Fecha, Nombre_prov
FROM pedidos_proveedores
WHERE Fecha BETWEEN '2023-01-01' AND '2023-12-31';

-- Vista para ver que productos compra cada cliente, junto con el ID de la venta --

CREATE OR REPLACE VIEW vw_compras_clientes AS
SELECT c.DNI_cliente, c.Apellido, v.Id_venta, v.Id_Producto, p.Tipo
FROM clientes AS c JOIN ventas AS v ON (c.DNI_cliente=v.DNI_cliente)
JOIN productos AS p ON (v.Id_Producto=p.Id_producto);

-- Se crea la vista para ver los empleados que recibieron los últimos 5 pedidos a proveedores --

CREATE OR REPLACE VIEW vw_empleados_ultimos_pedidos AS
SELECT e.DNI_empleado, e.Apellido , p.Id_orden, p.Fecha
FROM empleados AS e JOIN pedidos_proveedores AS p ON (e.Orden_recibida=p.Id_orden)
ORDER BY Fecha DESC
LIMIT 7;

-- Funcion para ver el porcentaje de ganancia por cada producto vendido para poder hacer un ranking y seguir con los mas rentables--

DELIMITER $$ 
CREATE FUNCTION f_porcentaje_ganancias (Precio_compra INT, Precio_venta INT) RETURNS DECIMAL(11,2)
NO SQL
BEGIN
DECLARE resultado DECIMAL (11,2);
SET resultado = ((Precio_venta - Precio_compra) / Precio_compra) * 100;
RETURN resultado;
END
$$

-- Sacamos el porcentaje de ganancia de una Estanteria Madera 5 --
-- SELECT f_porcentaje_ganancias (180,240) AS Porcentaje_ganancia;


-- Se busca conocer la cantidad de ventas de cada cliente en particular, para conocer si es un cliente frecuente y brindarle algún tipo de beneficio. --

DELIMITER $$
CREATE FUNCTION f_compras_clientes (cliente_dni INT) RETURNS INT
DETERMINISTIC
BEGIN 
DECLARE resultado INT;
SET resultado = (SELECT COUNT(Id_venta) FROM ventas WHERE DNI_cliente = cliente_dni);
RETURN resultado;
END
$$

-- Sacamos la cantidad de compras realizadas por el cliente con DNI 20890876.--
-- SELECT f_compras_clientes (20890876) AS cant_compras;

-- SE CREA EL SP PARA ORDENAR CUALQUIERA DE LAS TABLAS SEGUN EL CAMPO QUE SE DESEE, DE FORMA ASCENDENTE O DESCENDENTE --

DELIMITER //
CREATE PROCEDURE sp_ordenar_tablas (IN tabla VARCHAR (20), IN campo VARCHAR (20), IN orden VARCHAR (4))
BEGIN
SET @ordenar = CONCAT( 'SELECT * FROM', ' ', tabla, ' ','ORDER BY',' ', campo,' ', orden);

PREPARE consulta FROM @ordenar;
EXECUTE consulta;
DEALLOCATE PREPARE consulta;

END
//

-- SE EJECUTA EL SP EN LA TABLA VENTAS, ORDENANDO POR LA FECHA DE MANERA DESCENDENTE -- 

-- CALL sp_ordenar_tablas ('ventas', 'Fecha', 'DESC');


-- SE CREA UN SP PARA PODER INSERTAR DATOS EN LA TABLA DE PEDIDOS_PROVEEDORES, CADA VEZ QUE SE REALICE UN NUEVO PEDIDO --

DELIMITER //
CREATE PROCEDURE sp_insertar_pedidos (IN orden INT, IN sp_fecha DATE, IN sp_nombre VARCHAR (30), IN product INT)
BEGIN

INSERT INTO pedidos_proveedores
(Id_orden, Fecha, Nombre_prov, Id_Producto)
VALUES
(orden, sp_fecha, sp_nombre, product);

END
//

-- SE EJECUTA EL SP INSERTANDO UN PEDIDO DE UN PRODUCTO  -- 

-- CALL sp_insertar_pedidos (14, '2023-10-16', 'Bosch', 2050);

-- SE LLAMA A LA TABLA PARA VERIFCAR QUE SE HAYN INSERTADO CORRECTAMENTE LOS DATOS --
-- SELECT * FROM pedidos_proveedores;

-- Se crea un trigger en la tabla clientes para poder registrar cada vez que se suma un cliente nuevo a la tabla Auditoria_clientes. En esta tabla, luego de que se inserte un nuevo cliente y se ejecute el trigger, se va a dejar registrado los datos (DNI, Mail, Nombre y Apellido) del nuevo cliente, junto con el usuario que los registro, la fecha y la hora. -- 
-- USE Ferreteria_Preti;
-- Se crea la tabla LOG--
CREATE TABLE Auditoria_clientes
(
DNI INT NOT NULL,
Mail VARCHAR(50),
Nombre TEXT,
Apellido TEXT,
Usuario VARCHAR (255),
Fecha_hora DATETIME
);

-- Se crea el Trigger--
CREATE TRIGGER Auditoria_insercion_cliente
AFTER INSERT ON Clientes
FOR EACH ROW
INSERT INTO Auditoria_clientes
VALUES (NEW.DNI_cliente, NEW.Mail, NEW.Nombre, NEW.Apellido, user(), now());

-- Se inserta un nuevo registro a la tabla Clientes--
-- INSERT INTO Clientes VALUES (34627845, 'RosarioLopez@gmail.com', 'Rosario', 'Lomez');

-- Consultamos la tabla Auditoria_clientes--
-- SELECT * FROM Ferreteria_Preti.auditoria_clientes;



-- Se crea un segundo Trigger sobre la tabla ventas para poder registrar cada vez que se elimina una venta, puede ser por cancelación de la misma, en la tabla Auditoria_ventas. En esta tabla, antes de que se elimine la venta, se va a dejar registrado los datos de la venta (Id_venta, Fecha, DNI_cliente, Producto), junto con el usuario que eliminia la misma, la fecha y la hora.--
USE Ferreteria_Preti;
-- Se crea la tabla LOG--
CREATE TABLE Auditoria_ventas
(
Id_venta INT NOT NULL,
Fecha_de_eliminacion DATE,
DNI_cliente INT,
Producto INT,
Usuario VARCHAR (255),
Fecha_hora DATETIME
);

-- Se crea el Trigger--
CREATE TRIGGER Eliminacion_ventas
BEFORE DELETE ON Ventas
FOR EACH ROW
INSERT INTO Auditoria_ventas
VALUES (OLD.Id_venta, OLD.Fecha, OLD.DNI_cliente, OLD.Id_Producto, user(), now());

-- Se elimina de la tabla Ventas un registro--
-- DELETE FROM Ventas WHERE Id_venta=12;

-- Consultamos la tabla Auditoria_ventas--
-- SELECT * FROM Ferreteria_Preti.auditoria_ventas;