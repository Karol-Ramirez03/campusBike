1. El vendedor ingresa al sistema.
2. El vendedor registra una devolución de bicicleta.
3. El sistema llama a un procedimiento almacenado para registrar la devolución.
4. El procedimiento almacenado inserta la devolución y actualiza el stock de la bicicleta.



DELIMITER $$

CREATE PROCEDURE registrarDevolucion(
    IN p_id_detalle_venta INT
)
BEGIN
    DECLARE v_id_bicicleta INT;
    DECLARE v_cantidad INT;
    DECLARE v_stock INT;

    SELECT id_bicicleta, cantidad INTO v_id_bicicleta, v_cantidad
    FROM detalle_venta
    WHERE id = p_id_detalle_venta;

    INSERT INTO devolucion (id_detalle_venta, fecha_devolucion)
    VALUES (p_id_detalle_venta, NOW());

    UPDATE bicicleta
    SET stock = stock + v_cantidad
    WHERE id = v_id_bicicleta;
END $$
DELIMITER ;

CALL registrarDevolucion(1);
