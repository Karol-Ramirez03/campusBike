1. El vendedor ingresa al sistema.
2. El vendedor registra una venta de bicicletas.
3. El sistema llama a un procedimiento almacenado para actualizar el inventario de las
bicicletas vendidas.
4. El procedimiento almacenado actualiza el stock de cada bicicleta.


DELIMITER $$ 
DROP PROCEDURE IF EXISTS registrarVenta$$
CREATE PROCEDURE registrarVenta(
    IN inClienteId VARCHAR(10),
    OUT outVentaId INT 
) 
BEGIN 
    /* Se crea una nueva venta con total inicial de 0
        para que luego el sistema calcule el total en
        base a los detalles de la venta */
    INSERT INTO venta(fecha,clienteId,total)
    VALUES (NOW(), inClienteId, 0);

    /* Se saca el valor del id para utilizarlo luego */
    SET outVentaId = LAST_INSERT_ID();
                --devuelve el ultimo id que genera en esa venta
                --autoincrementales
END $$
DELIMITER ;
call nombreprocedure(8,@venta);
call otro(@venta)


DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarStockBicicleta
CREATE PROCEDURE actualizarStockBicicleta(
    IN inVentaId INT
)
BEGIN
    UPDATE bicicleta b
    JOIN detalleVenta dv ON b.id = dv.bicicletaId
    SET b.stock = b.stock - dv.cantidad
    WHERE dv.ventaId = inVentaId;
END $$
DELIMITER ;


------------------------------------------------------------------
------------------------------------------------------------------



/* 
    Esta es una versión modificada del procedure del caso de uso 2
    de los primeros flujos.

    En esta versión del procedure se agrega la llamada al procedimiento
    que se encarga de actualizar correctamente el stock de bicicletas
*/

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

    CALL actualizarStockBicicleta(inVentaId);
END $$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS verificarStockAntesDeVenta$$
CREATE TRIGGER verificarStockAntesDeVenta
BEFORE INSERT ON detalleVenta
FOR EACH ROW
BEGIN
    DECLARE stockActual INT;
    
    -- Obtener el stock actual de la bicicleta --
    SELECT stock INTO stockActual
    FROM bicicleta
    WHERE id = NEW.bicicletaId;
    
    -- Verificar que el stock sea suficiente --
    IF stockActual < NEW.Cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para la bicicleta seleccionada';
    END IF;
END $$
DELIMITER ;