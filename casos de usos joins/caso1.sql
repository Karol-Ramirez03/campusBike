--El sistema muestra una lista de ciudades con el total de ventas realizadas en cada una.


SELECT c.nombre_ciudad, SUM(v.total) AS ventas_totales
FROM ciudad c
JOIN  cliente cl ON c.id = cl.id_ciudad
JOIN venta v ON cl.id = v.id_cliente
GROUP BY cl.id_ciudad;

-- procedimiento almacenado

DELIMITER //

CREATE PROCEDURE ObtenerVentasPorCiudad()
BEGIN
    SELECT c.nombre_ciudad, SUM(v.total) AS ventas_totales
    FROM ciudad c
    JOIN cliente cl ON c.id = cl.id_ciudad
    JOIN venta v ON cl.id = v.id_cliente
    GROUP BY cl.id_ciudad;
END //

DELIMITER ;
