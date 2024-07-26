/*
1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el ingreso total por año.
3. El administrador ingresa el año.
4. El sistema llama a un procedimiento almacenado para calcular el ingreso total.
5. El procedimiento almacenado devuelve el ingreso total del año especificado.

*/
DELIMITER $$
DROP PROCEDURE IF EXISTS CalcularIngresoTotalPorAnio $$
CREATE PROCEDURE CalcularIngresoTotalPorAnio(IN anio INT)
BEGIN
    SELECT SUM(v.total) AS ingreso_total
    FROM venta v
    WHERE YEAR(v.fecha_venta) = anio;
END $$
DELIMITER ;