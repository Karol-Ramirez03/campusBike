--1. El vendedor ingresa al sistema.
2. El vendedor registra una nueva venta.
3. El sistema llama a un procedimiento almacenado para registrar la venta y sus detalles.
4. El procedimiento almacenado inserta la venta y sus detalles en las tablas correspondientes

venta de bicicleta, venta, detalles venta, actuaLIZAR BICICLETA

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarVentaConDetalles$$
CREATE PROCEDURE registrarVentaConDetalles(
    IN clienteid VARCHAR(10),
    IN biciId INT,
    IN Cantidad INT,
    OUT outVentaId INT 
)
BEGIN
    DECLARE precioUnitario DOUBLE;
    DECLARE totalDetalle DOUBLE;
    
    INSERT INTO venta(fecha_venta, id_cliente)
    VALUES (NOW(), clienteid);

    SET outVentaId = LAST_INSERT_ID();
    
    SELECT precio INTO precioUnitario
    FROM bicicleta
    WHERE id = biciId;

    SET totalDetalle = precioUnitario * Cantidad;

    INSERT INTO detalle_venta (id_venta, id_bicicleta, cantidad, precio_unitario)
    VALUES (outVentaId, biciId, Cantidad, precioUnitario);

    UPDATE venta
    SET total = totalDetalle
    WHERE id = outVentaId;

    UPDATE bicicleta
    SET stock = stock - Cantidad
    WHERE id = biciId;
    
END $$

DELIMITER ;
