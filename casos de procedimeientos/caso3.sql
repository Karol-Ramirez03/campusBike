1. El administrador ingresa al sistema.
2. El administrador selecciona un cliente para generar un reporte de ventas.
3. El sistema llama a un procedimiento almacenado para generar el reporte.
4. El procedimiento almacenado obtiene las ventas y los detalles de las ventas realizadas por el
cliente


/* 
    Este procedimiento es una combinación de los procedimientos
    que ya se encuentra hechos en el caso 4 de los primeros casos de uso

        RECIBE:
                * Id del cliente al que se va a generar el reporte
                * (OPCIONAL - PUEDE SER NULL) Id de la venta de la que se desea mostrar detalles
    
    Si el Id de venta es NULL entonces solo devolverá todas las ventas hechas 
    por el cliente y si tiene algún valor devolverá la venta junto a su detalle de venta
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS generarReporteVentasPorCliente$$
CREATE PROCEDURE GenerarReporteVentasPorCliente(
    IN inClienteId INT,
    IN inVentaId INT
)
BEGIN
    -- Seleccionar todas las ventas realizadas por el cliente --
    SELECT v.id AS ventaId, v.fecha, v.total
    FROM venta v
    WHERE v.clienteId = inClienteId
    ORDER BY v.fecha DESC;

    -- Seleccionar los detalles de la venta específica si se proporciona el id de venta --
    IF inVentaId IS NOT NULL THEN
       SELECT dv.bicicletaId, b.modelo, b.marca, dv.cantidad, dv.precioUnitario
        FROM detalleVenta dv
        JOIN bicicleta b ON dv.bicicletaId = b.id
        WHERE dv.ventaId = inVentaId;
    END IF;
END $$
DELIMITER ;