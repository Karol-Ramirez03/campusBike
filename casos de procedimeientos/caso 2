--1. El vendedor ingresa al sistema.
2. El vendedor registra una nueva venta.
3. El sistema llama a un procedimiento almacenado para registrar la venta y sus detalles.
4. El procedimiento almacenado inserta la venta y sus detalles en las tablas correspondientes


DELIMITER $$
DROP PROCEDURE IF EXISTS registrarVentaConDetalles$$
CREATE PROCEDURE registrarVentaConDetalles(
    IN inClienteId VARCHAR(10),
    IN inBicicletaId INT,
    IN inCantidad INT,
    OUT outVentaId INT 
)
BEGIN
    DECLARE precioUnitario DECIMAL(10, 2);
    DECLARE totalDetalle DECIMAL(10, 2);
    
    INSERT INTO venta(fecha, clienteId, total)
    VALUES (NOW(), inClienteId, 0);

    SET outVentaId = LAST_INSERT_ID();
    
    SELECT precio INTO precioUnitario
    FROM bicicleta
    WHERE id = inBicicletaId;

    SET totalDetalle = precioUnitario * inCantidad;

    INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario)
    VALUES (outVentaId, inBicicletaId, inCantidad, precioUnitario);

    UPDATE venta
    SET total = totalDetalle
    WHERE id = outVentaId;

    UPDATE bicicleta
    SET stock = stock - inCantidad
    WHERE id = inBicicletaId;

    IF (SELECT stock FROM bicicleta WHERE id = inBicicletaId) < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la venta';
    END IF;
END $$

DELIMITER ;

----------------------------------------------------
----------------------------------------------------


/* Este procedure se usa para registrar los detalles
    una nueva venta */

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarDetalleVenta$$
CREATE PROCEDURE RegistrarDetalleVenta(
    IN inVentaId INT,
    IN inBicicletaId INT,
    IN inCantidad INT
)
BEGIN
    DECLARE precioUnitario DECIMAL(10, 2);
    DECLARE totalDetalle DECIMAL(10, 2);
    
    -- Obtener el precio unitario de la bicicleta --
    SELECT precio INTO precioUnitario
    FROM bicicleta
    WHERE id = inBicicletaId;
    
    -- Calcular el total del detalle --
    SET totalDetalle = precioUnitario * inCantidad;
    
    -- Insertar el detalle de la venta --
    INSERT INTO detalleVenta (ventaId, bicicletaId, cantidad, precioUnitario)
    VALUES (inVentaId, inBicicletaId, inCantidad, precioUnitario);
    
    -- Actualizar el total de la venta --
    UPDATE venta
    SET total = totalDetalle
    WHERE id = inVentaId;
    
    -- Actualizar el inventario de bicicletas --
    UPDATE bicicleta
    SET stock = stock - inCantidad
    WHERE id = inBicicletaId;
END $$
DELIMITER ;


-- TESTEADO Y FUNCIONANDO --
