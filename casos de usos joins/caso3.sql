-- El sistema muestra una lista de proveedores con el total de repuestos comprados a cada uno.

SELECT p.nombre_proveedor, SUM(dc.cantidad) AS cantidad_producto
FROM detalle_compra dc
JOIN compra c ON  c.id = dc.id_compra
JOIN proveedor p ON p.id = c.id_proveedor
GROUP BY c.id_proveedor;

--PROCEDIMENTO ALMACENADO

CREATE PROCEDURE proveedoresTotalRepuestosComprados()
BEGIN
    SELECT p.nombre_proveedor, SUM(dc.cantidad) AS cantidad_producto
    FROM detalle_compra dc
    JOIN compra c ON  c.id = dc.id_compra
    JOIN proveedor p ON p.id = c.id_proveedor
    GROUP BY c.id_proveedor;
END$$

