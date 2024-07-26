1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para contar el número de clientes activos en un mes.
3. El administrador ingresa el mes y el año.
4. El sistema llama a un procedimiento almacenado para contar los clientes activos.
5. El procedimiento almacenado devuelve el número de clientes que han realizado compras en el mes especificado.

DELIMITER $$
DROP PROCEDURE IF EXISTS ContarClientesActivosEnMes $$
CREATE PROCEDURE ContarClientesActivosEnMes(IN mes INT, IN anio INT)
BEGIN
    SELECT COUNT(DISTINCT v.id_cliente) AS clientes_activos
    FROM venta v
    WHERE MONTH(v.fecha_venta) = mes AND YEAR(v.fecha_venta) = anio;
END$$
DELIMITER ;


