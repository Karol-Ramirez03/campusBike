/*1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para contar el número de ventas en un rango de fechas.
3. El administrador ingresa las fechas de inicio y fin.
4. El sistema llama a un procedimiento almacenado para contar las ventas.
5. El procedimiento almacenado devuelve el número de ventas en el rango de fechas
especificado.
*/

contar ventas por mes

DELIMITER $$
DROP PROCEDURE IF EXISTS ContarVentasEnRangoFechas $$
CREATE PROCEDURE ContarVentasEnRangoFechas(IN fechaInicio DATE, IN fechaFin DATE)
BEGIN
    SELECT COUNT(id) AS numero_ventas
    FROM venta
    WHERE fecha_venta BETWEEN fechaInicio AND fechaFin;
END$$
DELIMITER ;

'2024-01-01' AND '2024-12-31'
