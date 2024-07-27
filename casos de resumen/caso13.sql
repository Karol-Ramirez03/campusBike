1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ventas por día de la semana.
3. El sistema llama a un procedimiento almacenado para calcular el total de ventas.
4. El procedimiento almacenado devuelve el total de ventas agrupadas por día de la semana.

DELIMITER $$
CREATE PROCEDURE CalcularTotalVentasPorDiaSemana()
BEGIN
    SELECT DAY(fecha_venta) AS dia_semana, SUM(total) AS total_ventas
    FROM venta
    GROUP BY DAY(fecha_venta);
    
END $$

DELIMITER ;

