1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de compras por proveedor.
3. El administrador ingresa el ID del proveedor.
4. El sistema llama a un procedimiento almacenado para calcular el promedio de compras.
5. El procedimiento almacenado devuelve el promedio de compras del proveedor especificado.

DELIMITER $$
DROP PROCEDURE IF EXISTS CalcularPromedioComprasPorProveedor $$
CREATE PROCEDURE CalcularPromedioComprasPorProveedor(IN proveedorID INT)
BEGIN
    SELECT p.nombre_proveedor, AVG(c.total) AS promedio_compras
    FROM compra c
    JOIN proveedor p ON c.id_proveedor = p.id
    WHERE p.id = proveedorID
    GROUP BY c.id_proveedor, p.nombre_proveedor;
END $$ 
DELIMITER ;
