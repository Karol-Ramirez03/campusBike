1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de compras mensuales.
3. El sistema llama a un procedimiento almacenado para calcular el promedio de compras mensuales.
4. El procedimiento almacenado devuelve el promedio de compras realizadas mensualmente.


DELIMITER $$

CREATE PROCEDURE CalcularPromedioComprasMensuales()
BEGIN
    SELECT YEAR(fecha_venta) AS anio, MONTH(fecha_venta) AS mes, AVG(total) AS promedio_compras
    FROM venta
    GROUP BY YEAR(fecha_venta), MONTH(fecha_venta);
END $$

DELIMITER ;

