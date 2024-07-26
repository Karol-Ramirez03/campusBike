1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de repuestos comprados por proveedor. 
3. El administrador ingresa el ID del proveedor. 
4. El sistema llama a un procedimiento almacenado para calcular el total de repuestos. 
5. El procedimiento almacenado devuelve el total de repuestos comprados al proveedor especificado

DELIMITER $$
CREATE PROCEDURE CalcularTotalRepuestosPorProveedor(IN proveedorID INT)
BEGIN
    SELECT p.nombre_proveedor, SUM(dc.cantidad) AS total_repuestos
    FROM detalle_compra dc
    JOIN compra c ON dc.id_compra = c.id
    JOIN proveedor p ON c.id_proveedor = p.id
    WHERE p.id = proveedorID
    GROUP BY c.id_proveedor, p.nombre_proveedor;
END$$
DELIMITER ;

