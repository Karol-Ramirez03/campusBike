1. El administrador ingresa al sistema.
2. El administrador selecciona un cliente para generar un reporte de ventas.
3. El sistema llama a un procedimiento almacenado para generar el reporte.
4. El procedimiento almacenado obtiene las ventas y los detalles de las ventas realizadas por el
cliente


DELIMITER $$
DROP PROCEDURE IF EXISTS GenerarReporteVentas;

CREATE PROCEDURE GenerarReporteVentas(IN clienteID INT)
BEGIN
    SELECT v.id AS venta_id, v.fecha_venta, v.total, dv.id AS detalle_venta_id, b.id AS bicicleta_id, b.precio AS bicicleta_precio, dv.cantidad, dv.precio_unitario, c.nombre_cliente
    FROM venta v
    LEFT JOIN detalle_venta dv ON v.id = dv.id_venta
    LEFT JOIN bicicleta b ON dv.id_bicicleta = b.id
    JOIN cliente c ON v.id_cliente = c.id
    WHERE v.id_cliente = clienteID;
END $$

DELIMITER ;

