1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ventas por año y mes.
3. El sistema llama a un procedimiento almacenado para calcular el total de ventas.
4. El procedimiento almacenado devuelve el total de ventas agrupadas por año y mes.


DELIMITER $$
CREATE PROCEDURE totalVentasAñoMes(
    IN numMES INT,
    IN year INT
)
BEGIN 
    SELECT  SUM(total) AS suma_año_mes
    FROM venta
    WHERE (MONTH(fecha_venta) = numMes) AND (YEAR(fecha_venta) = year)
    GROUP BY MONTH(fecha_venta), YEAR(fecha_venta);
    
END$$
DELIMITER ;