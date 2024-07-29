/*
1. El vendedor ingresa al sistema.
2. El vendedor aplica un descuento a una venta.
3. El sistema llama a un procedimiento almacenado para calcular el total con descuento.
4. El procedimiento almacenado calcula el total con el descuento aplicado y registra la venta.
*/


DELIMITER $$
DROP PROCEDURE IF EXISTS CalcularTotalConDescuento$$
CREATE PROCEDURE CalcularTotalConDescuento(
    IN idcliente INT,
    IN p_porcentaje_descuento INT,
    IN inCantidad INT,
    IN idbici INT,
    IN precioUnitario DOUBLE
)
BEGIN
    DECLARE total_descuento DOUBLE;
    DECLARE idventa INT;
    DECLARE v_total INT;

    SET v_Total = inCantidad * precioUnitario;

    SET total_descuento = v_Total - (v_Total * p_porcentaje_descuento / 100);

    SET idventa = LAST_INSERT_ID(); 

    INSERT INTO venta (fecha_venta, id_cliente, total) 
    VALUES (NOW(), idcliente , total_descuento);

    INSERT INTO detalle_venta (id_venta, id_bicicleta, cantidad, precio_unitario) 
    VALUES (idventa, idbici, inCantidad, precioUnitario);


END$$
DELIMITER ;

CALL CalcularTotalConDescuento(1, 10, 10, 1, 2000);

SELECT * FROM venta;
SELECT * FROM detalle_venta;
