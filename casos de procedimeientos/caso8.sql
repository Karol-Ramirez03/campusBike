    
/*
1. El vendedor ingresa al sistema.
2. El vendedor selecciona una bicicleta para vender.
3. El sistema llama a un procedimiento almacenado para verificar el stock.
4. El procedimiento  almacenado devuelve un mensaje indicando si hay suficiente stock para
realizar la venta.
*/

--FORMA 1   
DELIMITER $$

DROP PROCEDURE IF EXISTS verificarStock$$
CREATE PROCEDURE verificarStock(
    IN bicicletaId INT,
    IN cantidadDeseada INT,
    OUT mensaje VARCHAR(255)
)
BEGIN
    DECLARE stockActual INT;

    SELECT stock INTO stockActual
    FROM bicicleta
    WHERE id = bicicletaId;

    IF stockActual IS NULL THEN
        SET mensaje = 'Bicicleta no encontrada.';
    ELSEIF stockActual >= cantidadDeseada THEN
        SET mensaje = 'stock disponible';
    ELSE
        SET mensaje = 'insuficiente para completar la venta.';
    END IF;
END$$

DELIMITER ;

CALL verificarStock(1, 2, @mensaje);
SELECT @mensaje AS mensaje;

--FORMA 2   
DELIMITER $$

DROP PROCEDURE IF EXISTS verificarStock$$
CREATE PROCEDURE verificarStock(
    IN bicicletaId INT,
    IN cantidadDeseada INT
)
BEGIN
    DECLARE stockActual INT;

    SELECT stock INTO stockActual
    FROM bicicleta
    WHERE id = bicicletaId;

    IF stockActual IS NULL THEN
        SELECT 'Bicicleta no encontrada.' AS mensaje;
    ELSEIF stockActual >= cantidadDeseada THEN
        SELECT 'Stock disponible' AS mensaje;
    ELSE
        SELECT 'Stock insuficiente para completar la venta.' AS mensaje;
    END IF;
END$$

DELIMITER ;
