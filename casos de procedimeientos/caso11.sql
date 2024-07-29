DELIMITER $$

CREATE PROCEDURE CalcularTotalConDescuento(
    IN p_id_venta INT,
    IN p_porcentaje_descuento DOUBLE
)
BEGIN
    SELECT SUM(d.cantidad * d.precio_unitario) * (1 - p_porcentaje_descuento / 100) AS total_con_descuento
    FROM detalle_venta d
    WHERE d.id_venta = p_id_venta;
END$$

DELIMITER ;

CALL CalcularTotalConDescuento(1, 10);

