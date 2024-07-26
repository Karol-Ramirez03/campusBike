1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de ventas por cliente.
3. El administrador ingresa el ID del cliente.
4. El sistema llama a un procedimiento almacenado para calcular el promedio de ventas.
5. El procedimiento almacenado devuelve el promedio de ventas del cliente especificado.

DELIMITER $$

CREATE PROCEDURE CalcularPromedioVentasPorCliente(IN clienteID INT)
BEGIN
    SELECT c.nombre_cliente, AVG(v.total) AS promedio_ventas
    FROM venta v
    JOIN cliente c ON v.id_cliente = c.id
    WHERE c.id = clienteID
    GROUP BY c.id, c.nombre_cliente;
END$$
DELIMITER ;