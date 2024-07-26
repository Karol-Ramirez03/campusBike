1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de ventas mensuales. 
3. El administrador ingresa el mes y el año. 
4. El sistema llama a un procedimiento almacenado para calcular el total de ventas. 
5. El procedimiento almacenado devuelve el total de ventas del mes especificado.

DELIMITER $$
CREATE PROCEDURE ventasxmes(
    in mesnumero INT
)
BEGIN

    SELECT SUM(total) AS ventas_mes
    FROM venta
    WHERE MONTH(fecha_venta) = mesnumero
    GROUP BY MONTH(fecha_venta);
    
END$$
DELIMITER ;