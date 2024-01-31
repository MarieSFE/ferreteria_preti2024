DROP DATABASE IF EXISTS ferreteria;
CREATE DATABASE ferreteria CHARACTER SET utf8mb4;
USE ferreteria;

-- Crear la tabla Clientes
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255)
);

-- Crear la tabla Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255)
);

-- Crear la tabla Empleado
CREATE TABLE Empleado (
    EmpleadoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Posicion VARCHAR(100)
);

-- Crear la tabla Producto
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Marca VARCHAR(255),
    Descripcion VARCHAR(255),
    Medida VARCHAR(10),
    Color VARCHAR(50),
    Precio DECIMAL(10, 2)
);

-- Crear la tabla Venta
CREATE TABLE Venta (
    VentaID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE,
    ClienteID INT,
    EmpleadoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID)
);

-- Crear la tabla DetalleVenta (para la relación muchos a muchos entre Venta y Producto)
CREATE TABLE DetalleVenta (
    DetalleVentaID INT PRIMARY KEY AUTO_INCREMENT,
    VentaID INT,
    ProductoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (VentaID) REFERENCES Venta(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);


1ERA

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (clienteid,Nombre, Direccion, Telefono, CorreoElectronico)
VALUES
    (1,'Cliente Uno', 'Calle A #123', '123456789', 'clienteA@example.com'),
    (2,'Cliente Dos', 'Calle B #456', '987654321', 'clienteB@example.com'),
    (3,'Cliente Tres', 'Calle C #789', '555123456', 'clienteC@example.com');

-- Insertar datos en la tabla Producto
INSERT INTO Producto (ProductoID, Nombre, Marca, Descripcion, Medida, Color, Precio)
VALUES
    (1,'Escalera para Pintar', 'Rex', 'Madera', '2 metros','Blanca', 99.99),
    (2,'Estanteria',  'Exhibitodo', 'Metal', '5 estantes', 'Negro', 79.99),
	(3,'Pintura',  'Cetol', 'Laca al agua', '4 litros', 'Cedro', 79.99);
	
    
 -- Insertar datos en la tabla Empleado
INSERT INTO Empleado (EmpleadoID, Nombre, Posicion)
VALUES
    (1,'Empleado Uno', 'Vendedor'),
    (2,'Ana Martinez', 'Desarrollador'),
    (3,'Carlos Rodriguez', 'Reclutador');

-- Insertar datos en la tabla Venta
INSERT INTO Venta (ventaid,Fecha, ClienteID, EmpleadoID)
VALUES
    (1,'2022-01-10', 1, 1),
    (2,'2022-01-11', 2, 2),
    (3,'2022-01-12', 3, 3);

-- Insertar datos en la tabla DetalleVenta
INSERT INTO DetalleVenta (VentaID, ProductoID, Cantidad, PrecioUnitario)
VALUES
    (1, 1, 2, 99.99),
    (2, 2, 1, 74.99),
    (3, 3, 3, 54.99);


