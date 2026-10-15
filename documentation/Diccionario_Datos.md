# Documentación Técnica - TechNova DB

## 1. Descripción General
Este proyecto implementa el sistema de gestión de base de datos para la empresa TechNova, enfocándose en el control de inventarios y gestión de proveedores.

## 2. Diccionario de Datos

### Esquema: `inventario`
- **Tabla `Categorias`**: Clasifica los productos.
  - `CategoriaID`: Identificador único (PK).
  - `NombreCategoria`: Nombre de la categoría.
- **Tabla `Productos`**: Información detallada de los artículos.
  - `ProductoID`: Identificador único (PK).
  - `CodigoProducto`: SKU único del producto.
  - `Stock`: Cantidad actual en bodega.
  - `Activo`: Indica si el producto está disponible para venta.

### Esquema: `compras`
- **Tabla `Proveedores`**: Datos de contacto de los aliados comerciales.
  - `ProveedorID`: Identificador único (PK).
  - `RazonSocial`: Nombre legal de la empresa.

## 3. Versiones
El proyecto sigue un flujo de versionamiento semántico (V1.0, V1.1, etc.) registrado en el archivo `CHANGELOG.md`.
