
1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para contar el número de ventas por categoría de bicicleta.
3. El sistema llama a un procedimiento almacenado para contar las ventas.
4. El procedimiento almacenado devuelve el número de ventas por categoría de bicicleta.

DELIMITER $$
CREATE PROCEDURE ventasxBicicletas(
    IN idBici INT
)
BEGIN
    SELECT id_bicicleta, SUM(cantidad) AS cantidad, precio_unitario
    FROM detalle_venta
    WHERE id_bicicleta = idBici
    GROUP BY id_bicicleta, precio_unitario;
END$$
DELIMITER ;