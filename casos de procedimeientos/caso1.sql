/*1. El vendedor ingresa al sistema.
2. El vendedor registra una venta de bicicletas.
3. El sistema llama a un procedimiento almacenado para actualizar el inventario de las
bicicletas vendidas.
4. El procedimiento almacenado actualiza el stock de cada bicicleta.
*/

venta de bicicleta y actualiar el stock:


DELIMITER $$
CREATE PROCEDURE registroVentaBici(
    IN ClienteId INT,
    OUT ventaid INT
)
BEGIN
    INSERT INTO venta(fecha_venta,id_cliente,total)
    VALUES (NOW(),ClienteId,0);
END$$
DELIMITER ;


/* 
call nombreprocedure(8,@venta);
call otro(@venta) */


DELIMITER $$
CREATE PROCEDURE actualizarBici(
    IN ventaid INT
)
BEGIN
    UPDATE bicicleta b
    JOIN detalle_venta dv ON b.id = dv.id_bicicleta
    SET b.stock = b.stock - dv.cantidad
    WHERE dv.id_venta = ventaId;
END $$
DELIMITER ;




/* DELIMITER $$
DROP PROCEDURE IF EXISTS registrarDetalleVenta$$
CREATE PROCEDURE RegistrarDetalleVenta(
    IN inVentaId INT,
    IN inBicicletaId INT,
    IN inCantidad INT
)
BEGIN
    DECLARE precioUnitario DECIMAL(10, 2);
    DECLARE totalDetalle DECIMAL(10, 2);

    SELECT precio INTO precioUnitario
    FROM bicicleta
    WHERE id = inBicicletaId;

    SET totalDetalle = precioUnitario * inCantidad;

    INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario)
    VALUES (inVentaId, inBicicletaId, inCantidad, precioUnitario);

    UPDATE venta
    SET total = totalDetalle
    WHERE id = inVentaId;

    UPDATE bicicleta
    SET stock = stock - inCantidad
    WHERE id = inBicicletaId;

    CALL actualizarStockBicicleta(inVentaId);
END $$
DELIMITER ; */


DELIMITER $$
DROP TRIGGER IF EXISTS verificarStockAntesDeVenta$$
CREATE TRIGGER verificarStockAntesDeVenta
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE stockActual INT;
    

    SELECT stock INTO stockActual
    FROM bicicleta
    WHERE id = NEW.id_bicicleta;

    IF stockActual < NEW.Cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la bicicleta seleccionada';
    END IF;
END $$
DELIMITER ;