1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ventas por marca.
3. El sistema llama a un procedimiento almacenado para calcular el total de ventas por marca.
4. El procedimiento almacenado devuelve el total de ventas agrupadas por marca.

DELIMITER $$
CREATE PROCEDURE ventasXmarca()
BEGIN
    SELECT mb.nombre_marca, SUM(dv.cantidad * dv.precio_unitario) AS total_marca
    FROM detalle_venta dv
    JOIN bicicleta b ON dv.id_bicicleta = b.id
    JOIN marca_bicicleta mb ON mb.id = b.id_marca_bicicleta
    GROUP BY b.id_marca_bicicleta;
END$$
DELIMITER ;