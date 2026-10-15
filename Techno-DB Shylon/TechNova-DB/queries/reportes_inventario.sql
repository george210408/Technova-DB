-- Consulta: Productos con Stock Crítico
-- Objetivo: Listar productos que están por debajo de su stock mínimo
SELECT
    ProductoID,
    NombreProducto,
    Stock,
    StockMinimo
FROM inventario.Productos
WHERE Stock <= StockMinimo AND Activo = 1;
GO

-- Consulta: Valor Total del Inventario
-- Objetivo: Calcular cuánto dinero hay invertido en productos
SELECT
    SUM(Stock * CostoUnitario) AS ValorTotalInventario
FROM inventario.Productos;
GO
