/*
1. El administrador de compras ingresa al sistema.
2. El administrador selecciona un proveedor para generar un reporte de compras.
3. El sistema llama a un procedimiento almacenado para generar el reporte.
4. El procedimiento almacenado obtiene las compras y los detalles de las compras realizadas al
proveedor.
*/


DELIMITER $$

CREATE PROCEDURE GenerarReporteVentas()
BEGIN
    SELECT
        v.id AS id_venta,
        v.fecha_venta,
        c.nombre_cliente,
        ci.nombre_ciudad,
        m.nombre_modelo AS nombre_bicicleta,
        d.cantidad,
        d.precio_unitario,
        (d.cantidad * d.precio_unitario) AS total_venta
    FROM
        venta v
    INNER JOIN
        cliente c ON v.id_cliente = c.id
    INNER JOIN
        ciudad ci ON c.id_ciudad = ci.id
    INNER JOIN
        detalle_venta d ON v.id = d.id_venta
    INNER JOIN
        bicicleta b ON d.id_bicicleta = b.id
    INNER JOIN
        modelo_bicicleta m ON b.id_modelo_bicicleta = m.id
    ORDER BY
        v.fecha_venta;
END$$

DELIMITER ;

CALL GenerarReporteVentas();
