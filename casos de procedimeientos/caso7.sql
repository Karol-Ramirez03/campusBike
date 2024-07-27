/*
1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para generar un reporte de clientes por ciudad.
3. El sistema llama a un procedimiento almacenado para generar el reporte.
4. El procedimiento almacenado obtiene la información de los clientes agrupados por ciudad
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS reporteClienteCiudad$$
CREATE PROCEDURE reporteClienteCiudad()
BEGIN
    SELECT  c.nombre_ciudad, COUNT(cl.id) AS num_clientes, GROUP_CONCAT(CONCAT(cl.nombre_cliente, '(', cl.correo_electronico,')')SEPARATOR ', ') AS DETALLESCLIENTES
    FROM  cliente cl
    JOIN  ciudad c ON c.id = cl.id_ciudad
    GROUP BY  c.nombre_ciudad;
END$$

DELIMITER ;


