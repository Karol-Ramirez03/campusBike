1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para contar el número de repuestos por proveedor.
3. El sistema llama a un procedimiento almacenado para contar los repuestos.
4. El procedimiento almacenado devuelve el número de repuestos suministrados por cada proveedor.

DELIMITER $$
CREATE PROCEDURE numeroProveedores()
BEGIN
    SELECT p.nombre_proveedor, SUM(dc.cantidad)AS TOTAL_PRODUCTO
    FROM detalle_compra dc
    JOIN compra c ON dc.id_compra = c.id
    JOIN proveedor p ON c.id_proveedor = p.id
    GROUP BY c.id_proveedor, p.nombre_proveedor;
END $$
DELIMITER ;