-- Baseline Version 1.0: TechNova Initial Structure
CREATE DATABASE TechNova_Bodega;
GO

USE TechNova_Bodega;
GO

CREATE SCHEMA inventario;
GO

CREATE SCHEMA compras;
GO

CREATE TABLE inventario.Categorias (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    NombreCategoria NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(MAX)
);

CREATE TABLE compras.Proveedores (
    ProveedorID INT PRIMARY KEY IDENTITY(1,1),
    RazonSocial NVARCHAR(200) NOT NULL,
    Telefono NVARCHAR(20),
    Email NVARCHAR(100)
);

CREATE TABLE inventario.Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    CodigoProducto NVARCHAR(50) UNIQUE NOT NULL,
    NombreProducto NVARCHAR(200) NOT NULL,
    CategoriaID INT FOREIGN KEY REFERENCES inventario.Categorias(CategoriaID),
    ProveedorID INT FOREIGN KEY REFERENCES compras.Proveedores(ProveedorID),
    PrecioVenta DECIMAL(18,2) NOT NULL,
    CostoUnitario DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL,
    StockMinimo INT,
    StockMaximo INT,
    Activo BIT DEFAULT 1
);

GO

CREATE VIEW inventario.vw_CatalogoProductos
AS
SELECT
    p.ProductoID,
    p.CodigoProducto,
    p.NombreProducto,
    c.NombreCategoria,
    pr.RazonSocial AS Proveedor,
    p.PrecioVenta,
    p.CostoUnitario,
    p.Stock,
    p.StockMinimo,
    p.StockMaximo,
    p.Activo
FROM inventario.Productos AS p
INNER JOIN inventario.Categorias AS c
    ON p.CategoriaID = c.CategoriaID
LEFT JOIN compras.Proveedores AS pr
    ON p.ProveedorID = pr.ProveedorID;
GO
